using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_Nhom5.Models;
using System.Linq.Dynamic;


namespace Web_Nhom5.Areas.Admin.Controllers
{
    public class QL_KhoaHocController : Controller
    {
        TTTinHocEntities model = new TTTinHocEntities();
        // GET: Admin/QL_KhoaHoc
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public JsonResult GetAll()
        {
            int start = Convert.ToInt32(Request["start"]);
            int length = Convert.ToInt32(Request["length"]);
            string searchValue = Request["search[value]"];
            string sortColumnName = Request["columns[" + Request["order[0][column]"] + "][name]"];
            string sortDirection = Request["order[0][dir]"];

            List<KhoaHoc> list = new List<KhoaHoc>();
            list = model.Database.SqlQuery<KhoaHoc>("select * from KhoaHoc").ToList();
            int totalrows = list.Count;
            if (searchValue != null)
            {
                list = model.Database.SqlQuery<KhoaHoc>("select * from KhoaHoc where TenKhoaHoc like '%" + searchValue + "%'").ToList();
            }
            int totalrowsafterfiltering = list.Count;
            //sap xep            
            list = list.OrderBy(sortColumnName + " " + sortDirection).ToList<KhoaHoc>();
            //phan trang
            list = list.Skip(start).Take(length).ToList<KhoaHoc>();
            return Json(new { data = list, draw = Request["draw"], recordsTotal = totalrows, recordsFiltered = totalrowsafterfiltering }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult LayDSTheoID(int ID)
        {
            var caulenhsql = "select * from KhoaHoc where ID= " + ID;
            var list = model.Database.SqlQuery<KhoaHoc>(caulenhsql).SingleOrDefault();
            return Json(new { list, success = true }, JsonRequestBehavior.AllowGet);

        }
        [HttpPost]
        public ActionResult XoaKhoaHoc(int id)
        {
            Xoa1(id);
            return Json(new { success = true, message = "Xóa thành công!!!" }, JsonRequestBehavior.AllowGet);
        }
        public void Xoa1(int id)
        {
            KhoaHoc sp2 = model.KhoaHocs.FirstOrDefault(x => x.ID == id);
            model.KhoaHocs.Remove(sp2);
            model.SaveChanges();
        }
        public ActionResult ThemVaSuaKhoaHoc(KhoaHoc KH)
        {

            if (KH.ID == 0)
            {
                model.KhoaHocs.Add(KH);
                model.SaveChanges();
                return Json(new { success = true, s = "Thêm thành công!!!" }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                model.Entry<KhoaHoc>(KH).State = System.Data.Entity.EntityState.Modified;
                model.SaveChanges();
                return Json(new { success = true, message = "Sửa thành công!!!" }, JsonRequestBehavior.AllowGet);
            }
        }


    }
}

