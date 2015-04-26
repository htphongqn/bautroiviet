using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Controller;
using vpro.functions;

namespace THVDev
{
    public partial class Default : System.Web.UI.Page
    {
        Config cf = new Config();
        Function fun = new Function();
        Propertity per = new Propertity();
        Home index = new Home();
        Product_Details pro_detail = new Product_Details();
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlHead header = base.Header;
            HtmlMeta headerDes = new HtmlMeta();
            HtmlMeta headerKey = new HtmlMeta();
            headerDes.Name = "Description";
            headerKey.Name = "Keywords";
            var _configs = cf.Config_meta();

            if (_configs.ToList().Count > 0)
            {
                if (!string.IsNullOrEmpty(_configs.ToList()[0].CONFIG_FAVICON))
                    ltrFavicon.Text = "<link rel='shortcut icon' href='" + PathFiles.GetPathConfigs() + _configs.ToList()[0].CONFIG_FAVICON + "' />";
                header.Title = _configs.ToList()[0].CONFIG_TITLE;

                headerDes.Content = _configs.ToList()[0].CONFIG_DESCRIPTION;
                header.Controls.Add(headerDes);

                headerKey.Content = _configs.ToList()[0].CONFIG_KEYWORD;
                header.Controls.Add(headerKey);
            }
            else
            {
                header.Title = "Enews Standard V1.0";

                headerDes.Content = "Enews Standard V1.0";
                header.Controls.Add(headerDes);

                headerKey.Content = "Enews Standard V1.0";
                header.Controls.Add(headerKey);
            }

            if (!IsPostBack)
            {
                Loadlist_product_moi();
                Loadlist_product_noibat();
                Loadlist_productNew_khuyenmai();
                Load_Menu1();
            }
        }
        public void Loadlist_product_moi()
        {
            var list = index.Loadindex(1, 3, 20);
            Rplistnews_moi.DataSource = list;
            Rplistnews_moi.DataBind();
        }
        public void Loadlist_product_noibat()
        {
            var list = index.Loadindex(1, 2, 20);
            Rplistnews_noibat.DataSource = list;
            Rplistnews_noibat.DataBind();
        }
        public void Loadlist_productNew_khuyenmai()
        {
            var list = index.Loadindex(1, 4, 20);
            Rplistnews_khuyenmai.DataSource = list;
            Rplistnews_khuyenmai.DataBind();
        }
        protected void Load_Menu1()
        {
            try
            {
                rptMenuCats.DataSource = per.Loadmenu(1, 4, 1, -1);
                rptMenuCats.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }

        }
        public IQueryable Loadlist_productByCatId(object cat_parent_id)
        {
            var list = index.Load_pro_index_cate(Utils.CIntDef(cat_parent_id), 20);
            return list;
        }
        protected void Rplistnews_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddCart")
            {
                string _sNews_Seo_Url = Utils.CStrDef(e.CommandArgument);
                var list = pro_detail.Load_Product_Detail(_sNews_Seo_Url);
                if (list.Count > 0)
                {
                    if (Utils.CDecDef(list[0].NEWS_PRICE1) != 0)
                        Response.Redirect("~/vi-vn/Addtocart.aspx?id=" + list[0].NEWS_ID + "&quantity=1");
                }
            }
        }
        #region function
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

        public string GetLink(object News_Url, object News_Seo_Url, object cat_seo)
        {
            try
            {
                return fun.Getlink_News(News_Url, News_Seo_Url, cat_seo);
            }
            catch (Exception ex)
            {
                vpro.functions.clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetImageT(object News_Id, object News_Image1)
        {

            try
            {
                return fun.GetImageT_News(News_Id, News_Image1);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string getdate(object date)
        {
            return fun.getDate(date);
        }
        public string Getprice(object price)
        {
            return fun.Getprice(price);
        }
        #endregion
    }
}