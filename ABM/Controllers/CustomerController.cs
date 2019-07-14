using ABM.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ABM.Controllers {
	public class CustomerController : BaseController {
		public ActionResult UserProfile() => this.View();
        public ActionResult ShoppingCart()
        {
            return View(Carro);
        }
        public ActionResult Support() => this.View();

        public JsonResult QuitarProductoDelCarro(int id)
        {
            try
            {
                var carprod = BddABM.NUB_CARRO_PRODUCTOS.FirstOrDefault(o => o.carpord_id == id);
                BddABM.NUB_CARRO_PRODUCTOS.Remove(carprod);
                BddABM.Entry(carprod).State = System.Data.Entity.EntityState.Deleted;

                BddABM.SaveChanges();

                return JsonExito();

            }
            catch (Exception ex)
            {
                return JsonError("No se ha podido eliminar el producto, por favor contactar con un administrador.");
            }
        }
		public ActionResult SuccessfulPayment() => this.View();
		public ActionResult PaymentFailure() => this.View();
    }
}