using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;

namespace Admin.Controllers
{
    public class HomeController : BaseController
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }

        [AllowAnonymous, HttpPost]
        public ActionResult Login(string email, string password)
        {   //   LINQ
            Data.DatabaseContainer db = new Data.DatabaseContainer();
            Data.User user = db.UserSet.FirstOrDefault(r => r.email == email && r.password == password);
            if (user != null)
            {
                Session["user"] = user;
                return RedirectToAction("Index");
            }

            TempData["error"] = "Hatalı kullanıcı adı veya parola !";

            return View();
        }
    }
}