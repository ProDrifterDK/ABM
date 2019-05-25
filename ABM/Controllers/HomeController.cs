using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ABM.Base;

namespace ABM.Controllers {
	public class HomeController : BaseController {
        public ActionResult Sales()
        {
            try
            {
                ViewBag.Sales = BddABM.TBL_PRODUCTO.Where(o => !string.IsNullOrEmpty(o.pro_precio_oferta)).ToList();
                ViewBag.Productos = BddABM.TBL_PRODUCTO.Where(o => string.IsNullOrEmpty(o.pro_precio_oferta)).ToList();

                return View();
            }
            catch (Exception ex)
            {
                return View();
            }
        }
		public ActionResult Product(int proId)
        {
            try
            {
                var modelo = BddABM.TBL_PRODUCTO.FirstOrDefault(o => proId == o.pro_id);
                if (modelo == null) return RedirectToAction("Sales");

                return View(modelo);
            }
            catch (Exception ex)
            {
                return RedirectToAction("Sales");
            }
        }
        public ActionResult Description() => this.View();
        
    }
}