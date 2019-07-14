using ABM.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ABM.Controllers
{
    public class CuentaController : BaseController
    {
        // GET: Cuenta
        public ActionResult Login() => this.View();

        [HttpPost]
        public ActionResult Login(string rut, string clave)
        {
            if (string.IsNullOrEmpty(rut) || string.IsNullOrEmpty(clave))
            {
                ViewBag.Error = "true";
                ViewBag.Mensaje = "Se debe ingresar rut y clave";

                return View();
            }

            var user = BddABM.TBL_USUARIO.FirstOrDefault(o => o.usu_rut == rut);

            if(user == null)
            {
                ViewBag.Error = "true";
                ViewBag.Mensaje = "El rut no se encuentra en el sistema.";
                return View();
            }

            if(user.usu_clave != clave) {
                ViewBag.Error = "true";
                ViewBag.Mensaje = "Clave incorrecta.";

                return View();
            }
;
            Usuario = user;

            var listaPuede = new List<int> { 1, 2 };

            var carro = user.TBL_CARRO_COMPRA.FirstOrDefault(o => listaPuede.Contains(o.CEST_ESTADO));

            if (carro != null)
            {
                Carro = carro;
            }

            return RedirectToAction("Sales","Home");
        }

        public ActionResult CrearCuenta()
        {
            return View();
        }
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Login");
        }

        [HttpPost]
        public ActionResult CrearCuenta(string nombre, string email, string claveConfirmar, string clave, string rut, string telefono)
        {
            if(clave != claveConfirmar)
            {
                ViewBag.Error = "true";
                ViewBag.Mensaje = "Las claves no coinciden.";
                return View();
            }

            var usuario = BddABM.TBL_USUARIO.AsNoTracking().FirstOrDefault(o => o.usu_rut == rut);

            if(usuario != null)
            {
                ViewBag.Error = "true";
                ViewBag.Mensaje = "El rut ya está en uso.";
                return View();
            }

            usuario = new Datos.SQL.TBL_USUARIO
            {
                usu_nombre = nombre,
                usu_correo = email,
                usu_clave = clave,
                usu_rut = rut,
                usu_telefono = telefono,
                rol_id = 4
            };

            BddABM.TBL_USUARIO.Add(usuario);
            BddABM.Entry(usuario).State = System.Data.Entity.EntityState.Added;

            BddABM.SaveChanges();

            return RedirectToAction("Login");
        }
    }
}