using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_Nhom5.Models;
using System.Linq.Dynamic;


namespace Web_Nhom5.Areas.Admin.Controllers
{
    public class LopController : Controller
    {
        TTTinHocEntities model = new TTTinHocEntities();
        // GET: Admin/Lop
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public JsonResult DataTable()
        {
            int start = Convert.ToInt32(Request["start"]);
            int length = Convert.ToInt32(Request["length"]);
            string searchValue = Request["search[value]"];
            string sortColumnName = Request["columns[" + Request["order[0][column]"] + "][name]"];
            string sortDirection = Request["order[0][dir]"];

            List<Lop> list = new List<Lop>();
            list = model.Database.SqlQuery<Lop>("select * from Lop").ToList();
            int totalrows = list.Count;
            //tim kiếm 
            if (searchValue != null)
            {
                list = model.Database.SqlQuery<Lop>("select * from Lop where TenLop like '%" + searchValue + "%'").ToList();
            }
            int totalrowsafterfiltering = list.Count;
            //sap xep            
            list = list.OrderBy(sortColumnName + " " + sortDirection).ToList<Lop>();
            //phan trang
            list = list.Skip(start).Take(length).ToList<Lop>();
            return Json(new { data = list, draw = Request["draw"], recordsTotal = totalrows, recordsFiltered = totalrowsafterfiltering }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult LayDSTheoID(int ID)
        {
            var caulenhsql = "select * from Lop where ID= " + ID;
            var list = model.Database.SqlQuery<Lop>(caulenhsql).SingleOrDefault();
            return Json(new { list, success = true }, JsonRequestBehavior.AllowGet);

        }
        [HttpPost]
        public ActionResult XoaLop(int id)
        {
            Xoa1(id);
            return Json(new { success = true, message = "Xóa thành công!!!" }, JsonRequestBehavior.AllowGet);
        }
        public void Xoa1(int id)
        {
            Lop sp2 = model.Lops.FirstOrDefault(x => x.ID == id);
            model.Lops.Remove(sp2);
            model.SaveChanges();
        }
        public ActionResult ThemVaSuaLop(Lop LopHoc)
        {

            if (LopHoc.ID == 0)
            {
                model.Lops.Add(LopHoc);
                model.SaveChanges();
                return Json(new { success = true, s = "Thêm thành công!!!" }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                model.Entry<Lop>(LopHoc).State = System.Data.Entity.EntityState.Modified;
                model.SaveChanges();
                return Json(new { success = true, message = "Sửa thành công!!!" }, JsonRequestBehavior.AllowGet);
            }
        }


    }
}

