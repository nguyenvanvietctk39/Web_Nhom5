using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web_Nhom5.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            if (Session["UserName"].ToString() !="")
            {
                @ViewBag.Name = Session["UserName"].ToString();
            }
            else
            {
                @ViewBag.Name = "";
            }


            return View();
        }
        public ActionResult QuanLyTaiKhoan()
        {
            return View();
        }
    }
}