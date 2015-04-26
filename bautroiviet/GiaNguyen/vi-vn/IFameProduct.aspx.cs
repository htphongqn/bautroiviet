using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GiaNguyen.Components;
using Controller;
using vpro.functions;

namespace THVDev.vi_vn
{
    public partial class IFameProduct : System.Web.UI.Page
    {
        Product_Details pro_detail = new Product_Details();
        Function fun = new Function();
        protected void Page_Load(object sender, EventArgs e)
        {
            Loaddetails();
        }
        public void Loaddetails()
        {
            try
            {
                string _sNews_Seo_Url = Utils.CStrDef(Request.QueryString["news_seo_url"]);
                var list = pro_detail.Load_Product_Detail(_sNews_Seo_Url);
                if (list != null && list.Count > 0)
                {

                    int id = list[0].NEWS_ID;
                    var listAlbum = pro_detail.Load_albumimg(id).ToList();
                    Rpimg_small.DataSource = listAlbum;
                    Rpimg_small.DataBind();

                }

            }
            catch (Exception ex)
            {

                clsVproErrorHandler.HandlerError(ex);
            }
        }
        #region function
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