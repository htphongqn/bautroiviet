using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;
using System.IO;

namespace THVDev.UIs
{
    public partial class Footer : System.Web.UI.UserControl
    {
        #region Declare
        private Propertity per = new Propertity();
        private Function fun = new Function();
        private Config cf = new Config();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_Menu1(); Load_MenuDuoi();
                Show_Footer_HTML();
            }
        }

        public string Getbanner(object Banner_type, object banner_field, object Banner_ID, object Banner_Image)
        {
            return fun.Getbanner(Banner_type, banner_field, Banner_ID, Banner_Image);
        }
        protected void Load_Menu1()
        {
            try
            {
                Rpmenu_footer.DataSource = per.Loadmenu(-1, 12, 1, 1);
                Rpmenu_footer.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }

        }
        protected void Load_MenuDuoi()
        {
            try
            {
                rptMenuDuoi.DataSource = per.Loadmenu(2, 12, 1, -1);
                rptMenuDuoi.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }

        }
        protected IQueryable Load_Menu2(object cat_parent_id)
        {
            try
            {
                var list = per.Menu2(cat_parent_id);
                return list;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }

        }
        public string GetLink_Cat(object Cat_Url, object Cat_Seo_Url, object Cat_Type)
        {
            try
            {
                return fun.Getlink_Cat(Cat_Url, Cat_Seo_Url);
            }
            catch (Exception)
            {

                throw;
            }
        }
        private void Show_Footer_HTML()
        {
            Literal_Info.Text = cf.Show_File_HTML("footer-vi.htm", "/Data/footer/");
        }
        #region Function
        public string GetLink(object Cat_Url, object Cat_Seo_Url, object Cat_Type)
        {
            try
            {
                string temp = fun.Getlink_Cat(Cat_Url, Cat_Seo_Url);
                return temp;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public string GetStyleActive(object Cat_Seo_Url, object Cat_Url)
        {
            try
            {
                string _curl = Utils.CStrDef(Request.QueryString["curl"]);
                string _seoUrl = Utils.CStrDef(Request.QueryString["purl"]);
                return per.GetStyleActive(Cat_Seo_Url, Cat_Url);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        #endregion
    }
}