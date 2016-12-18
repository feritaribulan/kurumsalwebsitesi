using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Filters;
using Web.Helpers;
using Web.ViewModel;

namespace Web.Controllers
{
    [MemberAuthorize]
    public class CreditController : BaseController
    {
        // GET: Credit
        public ActionResult Index(int Id)
        {
            var product = db.ProductSet.FirstOrDefault(q => q.Id == Id);
            ViewBag.product = product;

            return View();
        }

        [HttpPost]
        public ActionResult Pay(int Id, CreditViewModel credit)
        {
            Product product = db.ProductSet.FirstOrDefault(q => q.Id == Id);

            if (ModelState.IsValid)
            {
                ProductAccess access = new ProductAccess();
                access.UserId = UserHelper.Current().Id;
                access.ProductId = product.Id;

                Payment payment = new Payment();
                payment.Amount = product.Price;
                payment.Date = DateTime.Now;
                payment.UserId = UserHelper.Current().Id;
                payment.ProductAccess = access;
                db.PaymentSet.Add(payment);

                db.SaveChanges();

                return RedirectToAction("Success");
            }

            ViewBag.product = product;

            return View("Index");
        }

        public ActionResult Success()
        {
            return View();
        }

        public ActionResult List()
        {
            var UserId = UserHelper.Current().Id;
            var payments = db.PaymentSet.Where(q => q.UserId == UserId).AsEnumerable();
            return View(payments);
        }
    }
}