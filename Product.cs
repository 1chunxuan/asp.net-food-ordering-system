using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment
{
    public class Product
    {
        public int ProductID { get; set; }
        public int CategoryID { get; set; }
        public int StaffID { get; set; }
        public string ProductName { get; set; }
        public string ProductDesc { get; set; }
        public decimal ProductPrice { get; set; }
        public int ProductStoreQuantity { get; set; }
        public string ProductPhoto { get; set; }
    }
}