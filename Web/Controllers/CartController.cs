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
    public class CartController : BaseController
    {
        // GET: Cart
        public ActionResult Index()
        {
            var carts = getCarts();
            return View(carts);
        }

        public ActionResult PayForm()
        {
            var carts = getCarts();
            if (carts.Count() > 0)
            {
                ViewBag.Amount = carts.Sum(q => q.Product.Price);
                return View();
            }

            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult Pay(CreditViewModel credit)
        {
            var carts = getCarts();

            if (ModelState.IsValid)
            {
                foreach (var cart in carts)
                {
                    ProductAccess access = new ProductAccess();
                    access.UserId = UserHelper.Current().Id;
                    access.ProductId = cart.ProductId;

                    Payment payment = new Payment();
                    payment.Amount = cart.Product.Price;
                    payment.Date = DateTime.Now;
                    payment.UserId = UserHelper.Current().Id;
                    payment.ProductAccess = access;
                    db.PaymentSet.Add(payment);

                    cart.Statu = CartStatus.Paid;
                }

                db.SaveChanges();

                return RedirectToAction("Success");
            }

            ViewBag.Amount = carts.Sum(q => q.Product.Price);
            return View("PayForm");
        }

        public ActionResult Success()
        {
            return View();
        }

        private IQueryable<Cart> getCarts()
        {
            int userId = UserHelper.Current().Id;
            return db.CartSet.Where(q => q.UserId == userId && q.Statu == Data.CartStatus.New);
        }
    }
}