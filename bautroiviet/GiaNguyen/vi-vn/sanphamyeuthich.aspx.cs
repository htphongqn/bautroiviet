using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using System.Collections;
using vpro.functions;
using Controller;
using GiaNguyen.Components;

namespace THVDev.vi_vn
{
    public partial class sanphamyeuthich : System.Web.UI.Page
    {
        Function fun = new Function();
        Propertity per = new Propertity();
        Home index = new Home();
        Checkcookie ck = new Checkcookie();
        Product_Details pro_detail = new Product_Details();
        clsFormat fm = new clsFormat();
        Pageindex_chage change = new Pageindex_chage();
        protected void Page_Load(object sender, EventArgs e)
        {
            Loadlist();
        }
        
        public void Loadlist()
        {
            try
            {
                int sotin = 30;
                var list = index.Loadpro_cookie(1, ck.Listcookie_like());
                Rplistnews.DataSource = list;
                Rplistnews.DataBind();
                //if (list.Count > 0)
                //{
                //    if (_page != 0)
                //    {
                //        Rplistnews.DataSource = list.Skip(sotin * _page - sotin).Take(sotin);
                //        Rplistnews.DataBind();
                //    }
                //    else
                //    {
                //        Rplistnews.DataSource = list.Take(sotin);
                //        Rplistnews.DataBind();
                //    }

                //    ltrPage.Text = change.result(list.Count, sotin, _cat_seo_url, 0, _page, 1);

                //}

            }
            catch (Exception)
            {

                throw;
            }
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
        #region Funtion
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
        public string Getprice(object price)
        {
            return fun.Getprice(price);
        }
        #endregion
    }
}