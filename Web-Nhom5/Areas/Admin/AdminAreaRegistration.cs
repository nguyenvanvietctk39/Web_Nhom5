using System.Web.Mvc;

namespace Web_Nhom5.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "QuanLyTaiKhoan",
                "Admin/QuanLyTaiKhoan",
                 new { Controller = "Admin", action = "QuanLyTaiKhoan", id = UrlParameter.Optional }
           );

            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Index", Controller = "Admin", id = UrlParameter.Optional }
            );
            
        }
    }
}