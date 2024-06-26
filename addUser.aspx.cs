using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class addStaff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBackStaff_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminHome.aspx");
        }

        public void fvStaff_InsertItem()
        {

            var item = new Models.User();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here
                Models.foodieEntities _db = new Models.foodieEntities();
                _db.Users.Add(item);
                _db.SaveChanges();
                Response.Redirect("/adminHome.aspx");
            }
        }

        protected void fvStaff_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
                Response.Redirect("/adminHome.aspx");
        }
    }
}