using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Data;

namespace Admin.Controllers
{
    public class CategoryProductsController : Controller
    {
        private DatabaseContainer db = new DatabaseContainer();

        // GET: CategoryProducts
        public ActionResult Index()
        {
            return View(db.CategoryProductSet.ToList());
        }

        // GET: CategoryProducts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CategoryProduct categoryProduct = db.CategoryProductSet.Find(id);
            if (categoryProduct == null)
            {
                return HttpNotFound();
            }
            return View(categoryProduct);
        }

        // GET: CategoryProducts/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: CategoryProducts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Title")] CategoryProduct categoryProduct)
        {
            if (ModelState.IsValid)
            {
                db.CategoryProductSet.Add(categoryProduct);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(categoryProduct);
        }

        // GET: CategoryProducts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CategoryProduct categoryProduct = db.CategoryProductSet.Find(id);
            if (categoryProduct == null)
            {
                return HttpNotFound();
            }
            return View(categoryProduct);
        }

        // POST: CategoryProducts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Title")] CategoryProduct categoryProduct)
        {
            if (ModelState.IsValid)
            {
                db.Entry(categoryProduct).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(categoryProduct);
        }

        // GET: CategoryProducts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CategoryProduct categoryProduct = db.CategoryProductSet.Find(id);
            if (categoryProduct == null)
            {
                return HttpNotFound();
            }
            return View(categoryProduct);
        }

        // POST: CategoryProducts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CategoryProduct categoryProduct = db.CategoryProductSet.Find(id);
            db.CategoryProductSet.Remove(categoryProduct);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
