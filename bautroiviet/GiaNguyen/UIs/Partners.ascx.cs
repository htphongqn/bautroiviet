using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;

namespace THVDev.UIs
{
    public partial class Partners : System.Web.UI.UserControl
    {
        #region Decclare
        Propertity per = new Propertity();
        Function fun = new Function();
        Config cf = new Config();
        private Controller.Home index = new Controller.Home();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_ads();
            }
        }
        public void Load_ads()
        {
            try
            {
                var list = per.Load_slider(3, 15);
                Rpbanner.DataSource = list;
                Rpbanner.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        public string GetImageAd(object Ad_Id, object Ad_Image1, object Ad_Target, object Ad_Url)
        {
            try
            {
                string temp;
                temp = fun.GetImageAd(Ad_Id, Ad_Image1, Ad_Target, Ad_Url);
                return temp;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }

        }
    }
}