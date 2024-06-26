using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Assignment
{
    public partial class addProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminProduct.aspx");
        }

        public void fvProduct_InsertItem()
        {
            var item = new Models.Product();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here
                Models.foodieEntities _db = new Models.foodieEntities();
                _db.Products.Add(item);
                _db.SaveChanges();
                Response.Redirect("/adminProduct.aspx");
            }
        }

        protected void fvPrpduct_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
                Response.Redirect("/adminProduct.aspx");
        }
    }
}