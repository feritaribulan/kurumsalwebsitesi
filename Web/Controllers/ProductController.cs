using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Helpers;

namespace Web.Controllers
{
    public class ProjectsController : BaseController
    {
        // GET: Projects
        public ActionResult Index()
        {
            var projects = db.ProductSet.AsQueryable();

            return View(projects);
        }

        //public ActionResult Download(int id)
        //{
        //    var project = db.ProductSet.FirstOrDefault(q => q.Id == id);
        //    if (project == null)
        //    {
        //        return Content("Dosya bulunamadı");
        //    }

        //    Response.AddHeader("Content-Disposition", "attachment; filename=" + project.Filename);

        //    return File(project.File, project.ContentType);
        //}

        [HttpPost]
        public ActionResult AddToCart(int id)
        {
            if (UserHelper.isMember() == true)
            {

                Cart cart = new Cart();
                cart.ProductId = id;
                cart.UserId = UserHelper.Current().Id;
                cart.Statu = CartStatus.New;
                cart.Court = 1;

                db.CartSet.Add(cart);

                db.SaveChanges();

                return Json(id);
            }

            return Json("login");
        }

        [HttpPost]
        public ActionResult RemoveFromCart(int id)
        {
            if (UserHelper.isMember() == true)
            {
                int userId = UserHelper.Current().Id;
                var cart = db.CartSet.FirstOrDefault(q => q.Statu == CartStatus.New &&
                                                          q.UserId == userId &&
                                                          q.ProductId == id
                                                    );
                db.CartSet.Remove(cart);
                db.SaveChanges();

                return Json(id);
            }

            return Json("login");
        }
    }
}