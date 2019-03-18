using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ABM.Controllers {
	public class AdminController : Controller {
		// GET: Admin
		public ActionResult Login() => this.View();
		public ActionResult Delivery() => this.View();
		public ActionResult Seller() => this.View();
	}
}