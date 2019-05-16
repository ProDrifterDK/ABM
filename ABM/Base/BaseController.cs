using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ABM.Datos.SQL;

namespace ABM.Base
{
    public class BaseController : Controller
    {
        protected ABMEntities BddABM { get; set; }
        protected BaseController()
        {
            BddABM = new ABMEntities();
        }

        protected TBL_USUARIO Usuario { get { return (TBL_USUARIO)Session["Usuario"] ?? new TBL_USUARIO(); } set { Session["Usuario"] = value; } }

        protected JsonResult JsonExito(string mensaje = "", object data = null)
        {
            return Json(new { exito = true, mensaje = mensaje, data = data });
        }

        protected JsonResult JsonError(string mensaje = "")
        {
            return Json(new { exito = false, mensaje = mensaje });
        }

        protected JsonResult JsonSolo(object data)
        {
            return Json(data);
        }
        public string URLWEBPAY = "";

        protected List<SelectListItem> TipoProductoSelect(int SelectId = 0)
        {
            List<SelectListItem> lista = new List<SelectListItem>();

            lista.Add(new SelectListItem
            {
                Value = "0",
                Text = "Seleccione...",
                Selected = SelectId == 0,
            });

            var items = BddABM.TBL_TIPO_PRODUCTO.ToList().Select(o => new SelectListItem
            {
                Value = o.tprod_id.ToString(),
                Text = o.tprod_nombre ?? "",
                Selected = o.tprod_id == SelectId,
            }).ToList();

            lista.AddRange(items);
            return lista;
        }
    }
}