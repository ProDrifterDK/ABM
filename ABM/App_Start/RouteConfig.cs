using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ABM {
	public class RouteConfig {
		public static void RegisterRoutes(RouteCollection routes) {
			routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
                name: "Customer",
                url: "Customer/{id}",
                defaults: new { controller = "Customer", action = "UserProfile", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Pago",
                url: "Pagar/{id}",
                defaults: new { controller = "Pago", action = "Pagar", id = UrlParameter.Optional }
            );
            routes.MapRoute(
				name: "Default",
				url: "{action}/{id}",
				defaults: new { controller = "Home", action = "Sales", id = UrlParameter.Optional }
			);
		}
	}
}
