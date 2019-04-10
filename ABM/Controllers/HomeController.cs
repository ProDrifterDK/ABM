using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ABM.Controllers {
	public class HomeController : Controller {
		public ActionResult Sales() => this.View();
		public ActionResult BestSellers() => this.View();
		public ActionResult Product() => this.View();
        public ActionResult Description() => this.View();
    }
}