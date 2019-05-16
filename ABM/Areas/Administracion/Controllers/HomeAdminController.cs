using ABM.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ABM.Datos.SQL;

namespace ABM.Areas.Administracion.Controllers
{
    public class HomeAdminController : BaseController
    {
        public ActionResult Index() => this.View();

        public ActionResult AdministradorProductos()
        {
            var model = BddABM.TBL_PRODUCTO.ToList();
            return View(model);
        }
        public ActionResult EditarProducto(int id = 0)
        {
            ViewBag.TipoProductoSelect = TipoProductoSelect();
            var model = BddABM.TBL_PRODUCTO.FirstOrDefault(o => o.pro_id == id) ?? new Datos.SQL.TBL_PRODUCTO();
            return View(model);
        }
        [HttpPost]
        public ActionResult EditarProducto(TBL_PRODUCTO modelo)
        {
            ViewBag.TipoProductoSelect = TipoProductoSelect();
            ViewBag.Mensaje = "Registro modificado con éxito.";
            ViewBag.Error = 0;

            try
            {
                if(modelo.pro_id == 0)
                {
                    BddABM.TBL_PRODUCTO.Add(modelo);
                    BddABM.Entry(modelo).State = System.Data.Entity.EntityState.Added;

                    BddABM.SaveChanges();
                }
                else
                {
                    BddABM.TBL_PRODUCTO.Attach(modelo);
                    BddABM.Entry(modelo).State = System.Data.Entity.EntityState.Modified;

                    BddABM.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                ViewBag.Mensaje = "No se ha podido modificar el registro.";
                ViewBag.Error = 1;
            }

            return View(modelo);
        }
    }
}