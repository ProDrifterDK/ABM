using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ABM.Controllers {
	public class CustomerController : Controller {
		public ActionResult UserProfile() => this.View();
	}
}