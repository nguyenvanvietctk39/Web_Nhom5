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
    public class LoginController : Controller
    {
        TTTinHocEntities model = new TTTinHocEntities();
        public string MaHoaMD5(string str)
        {
            string kq = "";
            byte[] convertStrToByte = Encoding.UTF8.GetBytes(str);
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            var mahoa = md5.ComputeHash(convertStrToByte);
            foreach (Byte a in mahoa)
            {
                kq += a.ToString("X2");
            }
            return kq;
        }
        public JsonResult DangNhap(TaiKhoan tk)
        {
            var result = false;
            var matkhau = MaHoaMD5(tk.MatKhau);
            string flag = "";
            var DataItem = model.TaiKhoans.Where(x => x.TenTK == tk.TenTK && x.MatKhau == matkhau).SingleOrDefault();
            if (DataItem != null)
            {
                Session["TaiKhoan"] = DataItem;
                Session["UserID"] = DataItem.ID.ToString();
                Session["UserName"] = DataItem.TenTK.ToString();
                Session["Quyen"] = DataItem.Quyen.ToString();
                flag = DataItem.Quyen.ToString();
                result = true;
            }
            return Json(new { result, flag }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult DangXuat()
        {
            Session.Clear();
            Session.Abandon();
            return Redirect("/");
        }
    }
}