using ABM.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ABM.Controllers
{
    public class CuentaController : BaseController
    {
        // GET: Cuenta
        public ActionResult Login() => this.View();

        [HttpPost]
        public ActionResult Login(string usuario, string clave)
        {
            if (string.IsNullOrEmpty(usuario) && string.IsNullOrEmpty(clave))
            {

            }

            return View();
        }
    }
}