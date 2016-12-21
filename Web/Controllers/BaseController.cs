﻿using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web.Controllers
{
    public class BaseController : Controller
    {
        public DatabaseContainer db = new DatabaseContainer();

        public BaseController()
        {
            var httpContext = System.Web.HttpContext.Current;

            if (httpContext.Application["categories"] == null)
            {
                httpContext.Application["categories"] = db.PostSet.ToList();
            }
        }
    }
}