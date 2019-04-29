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
    }
}