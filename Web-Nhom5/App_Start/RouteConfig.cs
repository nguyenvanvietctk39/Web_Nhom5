using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Web_Nhom5
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");           
            routes.MapRoute(
                name: "KhoaHoc",
                url: "khoahoc",
                defaults: new { controller = "Home", action = "KhoaHoc", id = UrlParameter.Optional },
                namespaces: new[] { "Web-Nhom5.Controller" }
                
            );
            routes.MapRoute(
               name: "LienHe",
               url: "lienhe",
               defaults: new { controller = "Home", action = "LienHe", id = UrlParameter.Optional },
               namespaces: new[] { "Web-Nhom5.Controller" }

           );
            routes.MapRoute(
                name: "LichKhaiGiang",
                url: "lichkhaigiang",
                defaults: new { controller = "Home", action = "LichKhaiGiang", id = UrlParameter.Optional },
                namespaces: new[] { "Web-Nhom5.Controller" }

            );
            routes.MapRoute(
                name: "GioiThieu",
                url: "gioithieu",
                defaults: new { controller = "Home", action = "GioiThieu", id = UrlParameter.Optional },
                namespaces: new[] { "Web-Nhom5.Controller" }

            );
            routes.MapRoute(
                name: "TrangChu",
                url: "",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "Web-Nhom5.Controller" }

            );
            routes.MapRoute(
               name: "Default",
               url: "{controller}/{action}/{id}",
               defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
               namespaces: new[] { "Web-Nhom5.Controller" }
           );
        }
    }
}
