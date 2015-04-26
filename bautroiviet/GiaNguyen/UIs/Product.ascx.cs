using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GiaNguyen.Components;
using Controller;
using vpro.functions;

namespace THVDev.UIs
{
    public partial class Product : System.Web.UI.UserControl
    {
        private Controller.Home _home = new Controller.Home();
        private News_details ndetail = new News_details();
        Product_Details pro_detail = new Product_Details();
        Function fun = new Function();
        Attfile att = new Attfile();
        Comment cm = new Comment();
        Home index = new Home();
        public clsFormat fm = new clsFormat();
        Propertity per = new Propertity();
        string _sNews_Seo_Url = string.Empty;
        public string comment_url = "";

        Checkcookie checkck = new Checkcookie();
        setCookieLike setck = new setCookieLike();
        Getcookie ck = new Getcookie();

        protected void Page_Load(object sender, EventArgs e)
        {
            _sNews_Seo_Url = Utils.CStrDef(Request.QueryString["purl"]);
            if (!IsPostBack)
            {
                Loaddetails();
            }
        }
        public void Load_ads()
        {
            try
            {
                var list = per.Load_slider(4, 5);
                rptbannerhotro.DataSource = list;
                rptbannerhotro.DataBind();
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
        public void Loaddetails()
        {
            try
            {
                var list = pro_detail.Load_Product_Detail(_sNews_Seo_Url);
                if (list != null && list.Count > 0)
                {

                    rptProductTime.DataSource = list.Take(1);
                    rptProductTime.DataBind();

                    lbProductName.Text = list[0].NEWS_TITLE;
                    lbDes.Text = list[0].NEWS_DESC;
                    lbBaohanh.Text = list[0].NEWS_FIELD1;
                    lbKhuvuban.Text = per.getnameEshop_pro(Utils.CIntDef(list[0].NEWS_FIELD3));
                    lbProductID.Text = Utils.CStrDef(list[0].NEWS_ID);

                    //if (Utils.CDecDef(list[0].NEWS_PRICE1) != 0)
                    //    lnkAddCart.PostBackUrl = "../vi-vn/Addtocart.aspx?id=" + list[0].NEWS_ID + "&quantity=" + ddlQuantity.SelectedValue;


                    if (list[0].NEWS_PRICE2 > 0)
                    {
                        lbPriceNew.Text = GetPrice(list[0].NEWS_PRICE2);
                        lbPriceOld.Text = GetPrice(list[0].NEWS_PRICE1);
                        lbTietkiem.Text = GetPrice(list[0].NEWS_PRICE1 - list[0].NEWS_PRICE2);
                        lbTietkiemphantram.Text = Utils.CStrDef(Utils.CIntDef(list[0].NEWS_PRICE3));
                    }
                    else
                    {
                        lbPriceNew.Text = GetPrice(list[0].NEWS_PRICE1);
                        divgiagoc.Visible = false;
                        divtietkiem.Visible = false;
                    }

                    lbCommentFace.Text = "<div class='fb-comments' data-href='" + Request.ServerVariables["HTTP_REFERER"] + "' data-numposts='5' data-colorscheme='light' data-width='100%'></div>";
                    Lbface.Text = "<div class='fb-like' data-href='" + Request.ServerVariables["HTTP_REFERER"] + "' data-layout='button_count' data-action='like' data-show-faces='true' data-share='true'></div>";

                    Show_File_HTML();

                    int id = list[0].NEWS_ID;
                    var listAlbum = pro_detail.Load_albumimg(id).ToList();
                    Rpimg_small.DataSource = listAlbum;
                    Rpimg_small.DataBind();
                    Rpimg_l.DataSource = listAlbum.Take(1);
                    Rpimg_l.DataBind();

                    Loadlist_productCungloai(_sNews_Seo_Url);
                }

            }
            catch (Exception ex)
            {

                clsVproErrorHandler.HandlerError(ex);
            }
        }
//        public string getKhuyenmai(object newsid, object newsprice3, object newsendday, object newsbuycount)
//        {
//            string ret = "";
//            if (Utils.CIntDef(newsprice3, 0) > 0)
//            {
//                ret = string.Format(@"<div class='info_img'>
//                                        <span class='saleoff_percent font1'>{0}%</span>
//                                        <div class='time_div' id='time_div_{1}'>
//                                            <span class='f_bold cl_black_4 time_auto hasCountdown' id='deal-timeleft-{2}'
//                                                curtime='{3}'><span class='getngay_{4}'>
//                                                </span>: <span class='getgio_{5}'></span>: <span class='getphut_{6}'>
//                                                </span>: <span class='getgiay_{7}'></span></span><span class='cl_black_4 time_title'>
//                                                    <span>ngày</span><span>giờ</span><span>phút</span><span>giây</span></span>
//                                                    <p class='countBuy'>Đã mua: {8}</p></div>
//                                    </div>", string.Format("{0:#,##0.#}", newsprice3), newsid, newsid, Getgiay(newsendday), newsid, newsid, newsid, newsid, newsbuycount);
//            }
//            return ret;
//        }
        public string Getgiay(object dateend)
        {
            TimeSpan diff = DateTime.Parse(Utils.CStrDef(dateend)) - DateTime.Parse(Utils.CStrDef(DateTime.Now));
            return diff.TotalSeconds.ToString();
        }
        public void Loadlist_productCungloai(string _sNews_Seo_Url)
        {
            var list = pro_detail.Load_Product_Cungloai(_sNews_Seo_Url).Take(12);
            RplistproductCungloai.DataSource = list;
            RplistproductCungloai.DataBind();
        }
        public string GetPrice(object News_Price1)
        {
            try
            {
                return fun.Getprice(News_Price1);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        
        protected void Lbaddtocart_Click(object sender, EventArgs e)
        {
            var list = pro_detail.Load_Product_Detail(_sNews_Seo_Url);
            if (list.Count > 0)
            {
                if (Utils.CDecDef(list[0].NEWS_PRICE1) != 0)
                    Response.Redirect("~/vi-vn/Addtocart.aspx?id=" + list[0].NEWS_ID + "&quantity=" + ddlQuantity.SelectedItem.Value);
                else
                {
                    string strScript = "<script>";
                    strScript += "alert('Sản phẩm chưa cập nhật giá!');";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
            }
        }
        private void Show_File_HTML()
        {
            try
            {
                int _newsID = Utils.CIntDef(Session["news_id"]);
                liHtml.Text = pro_detail.Show_File_HTML(_newsID);
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

        public string Getprice(object price)
        {
            return fun.Getprice(price);
        }
        #endregion

        protected void lnkAddyeuthich_Click(object sender, EventArgs e)
        {
            set_ProductsLiked();
        }
        public void set_ProductsLiked()
        {
            string url = Request.RawUrl;
            if (!String.IsNullOrEmpty(url))
            {
                string[] a = url.Split('?');
                if (!checkck.Listcookie_like().Contains(_sNews_Seo_Url))
                {
                    setck.Addcookie(_sNews_Seo_Url);
                    string strScript = "<script>";
                    strScript += "alert('Đã thêm vào yêu thích!');";
                    strScript += "window.location='" + a[0] + "';";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
                else
                {
                    string strScript = "<script>";
                    strScript += "alert(' Bạn đã thích sản phẩm này!');";
                    strScript += "window.location='" + a[0] + "';";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
            }
        }
    }
}