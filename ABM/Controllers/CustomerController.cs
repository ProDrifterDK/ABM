using ABM.Base;
using System.Web.Mvc;

namespace ABM.Controllers
{
    public class CustomerController : BaseController {
		public ActionResult UserProfile() => this.View();
    }
}