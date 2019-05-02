using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;
namespace Web_Nhom5.DAO
{
    public class CheckMD5
    {
        public string MD5(string str)
        {
            string kq = "";
            byte[] convertStrToByte = Encoding.ASCII.GetBytes(str);
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            var mahoa = md5.ComputeHash(convertStrToByte);
            foreach (Byte a in mahoa)
            {
                kq += a.ToString();
            }
            return kq;
        }
    }
}