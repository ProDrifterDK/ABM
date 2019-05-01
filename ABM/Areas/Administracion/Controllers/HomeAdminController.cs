using ABM.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ABM.Areas.Administracion.Controllers
{
    public class HomeAdminController : BaseController
    {
        public ActionResult Index() => this.View();

        public ActionResult AdministradorProductos()
        {
            return View();
        }

        public JsonResult JsonListarTablaProductos()
        {
            var productos = BddABM.TBL_PRODUCTO.ToList();

            var data = productos.Select(o => new
            {
                Nombre = o.pro_nombre,
                Detalle = o.pro_detalle,
                Precio = o.pro_precio,
                PrecioOferta = o.pro_precio_oferta,
                Sotock = o.pro_stock,
                Id = o.pro_id,
            }).ToList();


            return Json(new
            {
                data = data.ToArray()
            }

              , JsonRequestBehavior.AllowGet);

        }
    }
}