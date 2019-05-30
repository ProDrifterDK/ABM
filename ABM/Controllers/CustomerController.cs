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
    }
}