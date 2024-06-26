using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Cart : System.Web.UI.Page
    {
        private List<CartItem> cartItems = new List<CartItem>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize cart items if not already done
                if (Session["CartItems"] == null)
                {
                    Session["CartItems"] = cartItems;
                }
                else
                {
                    // Retrieve cart items from session
                    cartItems = (List<CartItem>)Session["CartItems"];
                }

                // Bind cart items to the repeater
                BindCartItems();
            }
        }

        private void BindCartItems()
        {
            // Retrieve cart items from session
            cartItems = (List<CartItem>)Session["CartItems"];

            rptCart.DataSource = cartItems;
            rptCart.DataBind();

            // Calculate and update TotalSubtotal
            UpdateTotalSubtotal();
        }

        protected void rptCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            // Get the index of the product and the command
            int index = int.Parse(e.CommandArgument.ToString());
            string command = e.CommandName;

            // Retrieve cart items from session
            cartItems = Session["CartItems"] as List<CartItem>;
            if (cartItems == null || index < 0 || index >= cartItems.Count)
            {
                // Invalid index or cart items list is empty
                return;
            }

            // Handle different commands    
            switch (command)
            {
                case "Increase":
                    // Increase quantity
                    cartItems[index].Quantity++;
                    break;
                case "Decrease":
                    // Decrease quantity, ensure it doesn't go below 1
                    cartItems[index].Quantity = Math.Max(cartItems[index].Quantity - 1, 1);
                    break;
                case "Remove":
                    // Remove the product from the cart
                    decimal removedSubtotal = cartItems[index].Subtotal;
                    cartItems.RemoveAt(index);
                    Session["CartItems"] = cartItems;
                    // No need to update TotalSubtotal here, it will be updated in UpdateTotalSubtotal()
                    break;
            }

            // Update session with modified cart items
            Session["CartItems"] = cartItems;

            // Rebind the repeater to reflect changes
            BindCartItems();
        }


        private void UpdateTotalSubtotal()
        {
            // Retrieve cart items from session
            cartItems = Session["CartItems"] as List<CartItem>;

            // Calculate total subtotal
            decimal totalSubtotal = 0;
            for (int i = 0; i < cartItems.Count; i++)
            {
                totalSubtotal += (cartItems[i].ProductPrice * cartItems[i].Quantity);
            }

            // Display total subtotal price
            lblTotalSubtotal.Text = totalSubtotal.ToString();

            Session["TotalSubtotal"] = lblTotalSubtotal.Text;
        }

        protected void checkoutLink_Click(object sender, EventArgs e)
        {
            // Store cart items in session before proceeding to checkout
            Session["CartItems"] = cartItems;

            // Redirect to the Payment.aspx page
            Response.Redirect("~/Payment.aspx");
        }

    }
}