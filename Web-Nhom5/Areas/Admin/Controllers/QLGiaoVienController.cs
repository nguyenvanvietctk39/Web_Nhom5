using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_Nhom5.Models;
using System.Linq.Dynamic;
namespace Web_Nhom5.Areas.Admin.Controllers
{
    public class QLGiaoVienController : Controller
    {
        TTTinHocEntities model = new TTTinHocEntities();
        // GET: Admin/QLGiaoVien
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

            List<GV> list = new List<GV>();
            list = model.Database.SqlQuery<GV>("select * from GV").ToList();
            int totalrows = list.Count;
            if (searchValue != "")
            {
                list = model.Database.SqlQuery<GV>("select * from GV where TenGV like '%" + searchValue + "%'").ToList();
            }
            int totalrowsafterfiltering = list.Count;
            //sap xep            
            list = list.OrderBy(sortColumnName + " " + sortDirection).ToList<GV>();
            //phan trang
            list = list.Skip(start).Take(length).ToList<GV>();
            return Json(new { data = list, draw = Request["draw"], recordsTotal = totalrows, recordsFiltered = totalrowsafterfiltering }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult XoaGV(int ID)
        {
            model.Database.ExecuteSqlCommand("delete from GV where ID =" + ID);

            //GV gv = model.GVs.FirstOrDefault(x => x.ID == ID);
            //model.GVs.Remove(gv);
            //model.SaveChanges();
            return Json(new { success = true, message = "Xóa thành công!!!" }, JsonRequestBehavior.AllowGet);

        }
        [HttpPost]
        public ActionResult LayDSTheoID(int ID)
        {
            var caulenhsql = "select * from GV where ID= " + ID;
            var list = model.Database.SqlQuery<GV>(caulenhsql).SingleOrDefault();
            return Json(new { list, success = true }, JsonRequestBehavior.AllowGet);

        }
        public ActionResult AddOrEdit(GV gv)
        {
        
            //exec GV_Insert 20, N'GV020', N'A', N'abc',N'vag', N'nam', N'2/2/2000', N'avx.png', N'faf  '
            string sql = "";
            sql += string.Format("{0},", gv.ID);
            sql += string.Format("N'{0}',", gv.MaGV);
            sql += string.Format("N'{0}',", gv.TenGV);
            sql += string.Format("N'{0}',", gv.DiaChi);
            sql += string.Format("N'{0}',", gv.SDT);
            sql += string.Format("N'{0}',", gv.Email);
            sql += string.Format("N'{0}',", gv.GioiTinh);
            sql += string.Format("N'{0}',", gv.NTNS);
            sql += string.Format("N'{0}'", gv.HinhAnh);
            if (gv.ID == 0)//add giao viên
            {
                //gọi proc GV_Insert trong SQL thực thi thêm giáo viên
                if (model.Database.ExecuteSqlCommand("exec GV_Insert " + sql) > 0)
                {
                    return Json(new { success = true, message = "Thêm thành công!!!" }, JsonRequestBehavior.AllowGet);
                }
                else
                    return Json(new { success = false, message = "Thêm thất bại!!!" }, JsonRequestBehavior.AllowGet);
            }
            //exec GV_Update 20, N'GV030', N'A', N'abc',N'vag', N'nam', N'2/2/2000', N'avx.png', N'faf'
            else//sửa giao viên
            {
                //gọi proc GV_Update trong sql thực thi sửa thông tin giáo viên
                if (model.Database.ExecuteSqlCommand("exec GV_Update " + sql) > 0)
                {
                    return Json(new { success = true, message = "Sửa thành công!!!" }, JsonRequestBehavior.AllowGet);
                }
                return Json(new { success = false, message = "Sửa thất bại!!!" }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}