using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security.Cryptography;
using System.Text;
using Web_Nhom5.Models;

namespace Web_Nhom5.Controllers
{
    public class HomeController : Controller
    {
        TTTinHocEntities model = new TTTinHocEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult KhoaHoc()
        {
            var list = model.KhoaHocs.ToList();
            ViewData["listKhoaHoc"] = list;
            return View();
        }
        public ActionResult GioiThieu()
        {
            return View();
        }
        public ActionResult LichKhaiGiang()
        {
            return View();
        }
        public ActionResult LienHe()
        {
            return View();
        }
    }
}