using Assignment.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Assignment
{
    public partial class addOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnBackOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx");
        }


        public void fvOrder_InsertItem()
        {
            var item = new Models.Order();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here
                Models.foodieEntities _db = new Models.foodieEntities();
                _db.Orders.Add(item);
                _db.SaveChanges();
                Response.Redirect("/admin.aspx");
            }
        }

        protected void fvOrder_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
                Response.Redirect("/admin.aspx");
        }
    }
}