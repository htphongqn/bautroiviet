using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using GiaNguyen.Components;
using System.Web.UI.HtmlControls;

namespace THVDev.UIs
{
    public partial class topbar : System.Web.UI.UserControl
    {
        Cart_result cart = new Cart_result();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Guid _guid = (Guid)Session["news_guid"];
                var _basket = cart.Load_cart(_guid);

                if (_basket != null)
                {
                    lbCountCart.Text = Utils.CStrDef(_basket.ToList().Count);
                }
                
            }
        }
        protected void Lbsearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("/tim-kiem.html?page=0&keyword=" + q.Value);
        }
    }
}