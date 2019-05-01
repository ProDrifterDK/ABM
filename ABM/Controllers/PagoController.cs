﻿using ABM.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ABM.Datos.SQL;
using Webpay.Transbank.Library;
using Webpay.Transbank.Library.Wsdl.Normal;

namespace ABM.Controllers
{
    public class PagoController : BaseController
    {
        // GET: Pago
        public ActionResult Index() => View();
        public ActionResult Pagar(string aaction, string token)
        {
            TBL_USUARIO cliente = Usuario;

            //WebPay
            Configuration configuration = new Configuration();
            configuration.Environment = certificate["environment"];
            configuration.CommerceCode = certificate["commerce_code"];
            configuration.PublicCert = certificate["public_cert"];
            configuration.WebpayCert = certificate["webpay_cert"];
            configuration.Password = certificate["password"];

            /** Crea Dictionary con descripción */
            Dictionary<string, string> description = new Dictionary<string, string>();

            description.Add("VD", "Venta Deb&iacute;to");
            description.Add("VN", "Venta Normal");
            description.Add("VC", "Venta en cuotas");
            description.Add("SI", "cuotas sin inter&eacute;s");
            description.Add("S2", "2 cuotas sin inter&eacute;s");
            description.Add("NC", "N cuotas sin inter&eacute;s");

            /** Creacion Objeto Webpay */
            Webpay.Transbank.Library.Webpay webpay = new Webpay.Transbank.Library.Webpay(configuration);

            /** Crea Dictionary con codigos de resultado */
            Dictionary<string, string> codes = new Dictionary<string, string>();

            codes.Add("0", "Transacción aprobada");
            codes.Add("-1", "Rechazo de transacción");
            codes.Add("-2", "Transacción debe reintentarse");
            codes.Add("-3", "Error en transacción");
            codes.Add("-4", "Rechazo de transacción");
            codes.Add("-5", "Rechazo por error de tasa");
            codes.Add("-6", "Excede cupo máximo mensual");
            codes.Add("-7", "Excede límite diario por transacción");
            codes.Add("-8", "Rubro no autorizado");

            if (string.IsNullOrEmpty(aaction))
                aaction = "result";

            switch (aaction)
            {
                case "result":
                    /** Obtiene Información POST */
                    string[] keysPost = Request.Form.AllKeys;

                    /** Token de la transacción */

                    /** Token de la transacción */
                    token = Request.Form["token_ws"];
                    request.Add("token", token.ToString());

                    transactionResultOutput result = webpay.getNormalTransaction().getTransactionResult(token);

                    var carro = BddABM.TBL_CARRO_COMPRA.FirstOrDefault(o => o.CAR_TOKEN == token);

                    var listo = result.detailOutput[0].responseCode == 0;

                    if (listo)
                    {
                        listo = carro.CAR_MONTO == result.detailOutput[0].amount;

                        if (!listo)
                        {
                            carro.CEST_ESTADO = 5;
                            carro.CAS_ERROR = "Pago RECHAZADO los montos difieren";
                            ViewBag.Mensaje = "Pago RECHAZADO los montos difieren";
                            ViewBag.Error = true;

                            BddABM.TBL_CARRO_COMPRA.Attach(carro);
                            BddABM.Entry(carro).State = System.Data.Entity.EntityState.Modified;

                            BddABM.SaveChanges();

                            return View(cliente);
                        }

                        listo = carro.CAR_ORDEN_COMPRA == result.detailOutput[0].buyOrder;

                        if (!listo)
                        {
                            carro.CEST_ESTADO = 5;
                            carro.CAS_ERROR = "Pago RECHAZADO los orden de compra difieren";
                            ViewBag.Mensaje = "Pago RECHAZADO los orden de compra difieren";
                            ViewBag.Error = true;

                            BddABM.TBL_CARRO_COMPRA.Attach(carro);
                            BddABM.Entry(carro).State = System.Data.Entity.EntityState.Modified;

                            BddABM.SaveChanges();

                            return View(cliente);
                        }

                        carro.CEST_ESTADO = 2;

                        carro.CAR_CODIGO_AUTORIZACION = result.detailOutput[0].authorizationCode;
                        carro.CAR_CODIGO_COMERCIO = result.detailOutput[0].commerceCode;


                        BddABM.TBL_CARRO_COMPRA.Attach(carro);
                        BddABM.Entry(carro).State = System.Data.Entity.EntityState.Modified;

                        BddABM.SaveChanges();

                        var deudas = carro.TBL_COMPRA.ToList();
                        try
                        {
                            //var d = webpay.getNormalTransaction().acknowledgeTransaction(token);

                        }
                        catch (Exception ex)
                        {
                            carro.CEST_ESTADO = 5;
                            carro.CAS_ERROR = "Error al terminar el pago, itentelo de nuevo.";
                            ViewBag.Mensaje = "Error al terminar el pago, itentelo de nuevo.";
                            ViewBag.Error = true;

                            return View(cliente);
                        }

                        BddABM.SaveChanges();

                        ViewBag.Mensaje = "Pago realizado con éxito.";

                        ViewBag.Error = false;

                        return Redirect(result.urlRedirection + "?token_ws=" + token);
                    }
                    else
                    {
                        carro.CEST_ESTADO = 5;
                        carro.CAS_ERROR = "Pago RECHAZADO por webpay [Codigo]=> " + result.detailOutput[0].responseCode + " [Descripcion]=> " + codes[result.detailOutput[0].responseCode.ToString()];
                        ViewBag.Mensaje = "Pago RECHAZADO por webpay [Codigo]=> " + result.detailOutput[0].responseCode + " [Descripcion]=> " + codes[result.detailOutput[0].responseCode.ToString()];
                        ViewBag.Error = true;

                        BddABM.TBL_CARRO_COMPRA.Attach(carro);
                        BddABM.Entry(carro).State = System.Data.Entity.EntityState.Modified;

                        BddABM.SaveChanges();

                        return View(cliente);
                    }
                    break;
                case "end":
                    break;
            }

            return View(cliente);
        }


        #region WebPay
        /** Mensaje de Ejecución */
        private string message;

        /** Crea Dictionary con datos Integración Pruebas */
        private Dictionary<string, string> certificate = Transbank.NET.sample.certificates.CertNormal.certificate();

        /** Crea Dictionary con datos de entrada */
        private Dictionary<string, string> request = new Dictionary<string, string>();
        public JsonResult GetToken(int compra, string rut)
        {
            int deudaTotal = 0;

            var carro = new TBL_CARRO_COMPRA
            {
                CEST_ESTADO = 1,
            };

            BddABM.TBL_CARRO_COMPRA.Add(carro);
            BddABM.Entry(carro).State = System.Data.Entity.EntityState.Added;

            BddABM.SaveChanges();

            var comp = BddABM.TBL_COMPRA.FirstOrDefault(o => o.com_id == compra);
            comp.car_id = carro.CAR_ID;

            BddABM.TBL_COMPRA.Attach(comp);
            BddABM.Entry(comp).State = System.Data.Entity.EntityState.Modified;

            deudaTotal += comp.com_valor;

            carro.CAR_MONTO = deudaTotal;

            BddABM.TBL_CARRO_COMPRA.Attach(carro);
            BddABM.Entry(carro).State = System.Data.Entity.EntityState.Modified;

            BddABM.SaveChanges();

            Configuration configuration = new Configuration();
            configuration.Environment = certificate["environment"];
            configuration.CommerceCode = certificate["commerce_code"];
            configuration.PublicCert = certificate["public_cert"];
            configuration.WebpayCert = certificate["webpay_cert"];
            configuration.Password = certificate["password"];

            /** Creacion Objeto Webpay */
            Webpay.Transbank.Library.Webpay webpay = new Webpay.Transbank.Library.Webpay(configuration);

            /** Información de Host para crear URL */
            String httpHost = System.Web.HttpContext.Current.Request.ServerVariables["HTTP_HOST"].ToString();
            String selfURL = System.Web.HttpContext.Current.Request.ServerVariables["URL"].ToString();


            string sample_baseurl = "http://" + httpHost + selfURL;
            /** Crea Dictionary con descripción */
            Dictionary<string, string> description = new Dictionary<string, string>();

            description.Add("VD", "Venta Deb&iacute;to");
            description.Add("VN", "Venta Normal");
            description.Add("VC", "Venta en cuotas");
            description.Add("SI", "cuotas sin inter&eacute;s");
            description.Add("S2", "2 cuotas sin inter&eacute;s");
            description.Add("NC", "N cuotas sin inter&eacute;s");


            string buyOrder;

            Random random = new Random();

            /** Monto de la transacción */
            decimal amount = (decimal)deudaTotal;

            /** Orden de compra de la tienda */
            buyOrder = carro.CAR_ID.ToString();

            /** (Opcional) Identificador de sesión, uso interno de comercio */
            string sessionId = Session.SessionID;

            /** URL Final */
            string urlReturn = "http://" + httpHost + "/Session/Deudas" + "?rut=" + rut + "&aaction=result";

            /** URL Final */
            string urlFinal = "http://" + httpHost + "/Session/Deudas" + "?rut=" + rut + "&aaction=end";

            request.Add("amount", amount.ToString());
            request.Add("buyOrder", buyOrder.ToString());
            request.Add("sessionId", sessionId.ToString());
            request.Add("urlReturn", urlReturn.ToString());
            request.Add("urlFinal", urlFinal.ToString());

            /** Ejecutamos metodo initTransaction desde Libreria */
            wsInitTransactionOutput result = webpay.getNormalTransaction().initTransaction(amount, buyOrder, sessionId, urlReturn, urlFinal);

            carro.CAR_TOKEN = result.token;
            carro.CAR_ORDEN_COMPRA = buyOrder;
            carro.CAR_SESSION_ID = sessionId;

            BddABM.TBL_CARRO_COMPRA.Attach(carro);
            BddABM.Entry(carro).State = System.Data.Entity.EntityState.Modified;

            BddABM.SaveChanges();

            URLWEBPAY = result.url;

            if (result.token != null && result.token != "")
            {
                return JsonExito("Sesion iniciada con exito en Webpay", new { request = request, result = result });
            }
            else
            {
                return JsonError("webpay no disponible");
            }
        }
        #endregion
    }
}