//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Web_Nhom5.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class KhoaHoc
    {
        public int ID { get; set; }
        public string TenKhoaHoc { get; set; }
        public Nullable<System.DateTime> NgayKG { get; set; }
        public Nullable<decimal> HocPhi { get; set; }
        public Nullable<int> SoTiet { get; set; }
        public string GioiThieu { get; set; }
        public string MucTieu { get; set; }
        public string BangCap { get; set; }
    }
}