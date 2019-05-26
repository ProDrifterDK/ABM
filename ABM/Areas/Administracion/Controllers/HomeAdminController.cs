using ABM.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ABM.Datos.SQL;
using System.IO;

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
            HttpPostedFileBase file = null;

            string imagenAntigua = null;


            for (int i = 0; i < Request.Files.Count; i++)
            {
                if (!Directory.Exists("~/ImagenesProductos"))
                {
                    Directory.CreateDirectory(Server.MapPath("~/ImagenesProductos"));
                }

                file = Request.Files[0];
                file.SaveAs(Path.Combine(Server.MapPath("~/ImagenesProductos"), file.FileName));


                imagenAntigua = modelo.pro_imagen;
                modelo.pro_imagen = "/ImagenesProductos/" + file.FileName;
            }

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
                    if (!string.IsNullOrEmpty(imagenAntigua))
                    {
                        System.IO.File.Delete(imagenAntigua);
                    }

                    BddABM.TBL_PRODUCTO.Attach(modelo);
                    BddABM.Entry(modelo).State = System.Data.Entity.EntityState.Modified;

                    BddABM.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if(file != null)
                {
                    //delete modelo.pro_imagen;
                }

                ViewBag.Mensaje = "No se ha podido modificar el registro.";
                ViewBag.Error = 1;
            }

            return View(modelo);
        }
    }
}