using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;

namespace THVDev.vi_vn
{
    public partial class quanlydonhang : System.Web.UI.Page
    {
        Account ac = new Account();
        Propertity per = new Propertity();
        Function fun = new Function();
        int _count = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadHistory();

            LoadGridItems();
        }

        public void LoadHistory()
        {
            int _idUser = Utils.CIntDef(Session["USER_ID"]);
            if (Session["USER_ID"] != null)
            {
                var AllList = ac.loadHistory(_idUser);

                if (AllList.ToList().Count > 0)
                {
                    rptProductsmaster.DataSource = AllList;
                    rptProductsmaster.DataBind();
                }
            }
            else
            {
                string strScript = "<script>";
                strScript += "alert('Thông báo: Bạn chưa đăng nhập ');";
                strScript += "window.location='/';";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
            }
        }

        private void LoadGridItems()
        {
            try
            {
                int _m_id_order = Utils.CIntDef(Request.QueryString["id"]);
                var AllList = per.Load_OrderItems(_m_id_order);

                if (per.get_countOrder(_m_id_order) > 0)
                {
                    rptProducts.DataSource = AllList;
                    rptProducts.DataBind();
                    idItems.Visible = true;
                    liCode.Text = per.get_OrderCode(_m_id_order);
                    if (per.get_ListOrder(_m_id_order).Count > 0)
                    {
                        lblFreeShip.Text = per.get_ListOrder(_m_id_order)[0].ORDER_SHIPPING_FEE.Value.ToString("###,##0 đ");
                        lblTotalMoney.Text = per.get_ListOrder(_m_id_order)[0].ORDER_TOTAL_ALL.Value.ToString("###,##0 đ");
                    }
                }
                else { idItems.Visible = false; }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        #region funtion
        public string getListProductNameOrderDetail(object orderId)
        {
            int _m_id_order = Utils.CIntDef(orderId);
            var AllList = per.Load_OrderItems(_m_id_order);
            string s = "";
            if (AllList != null && AllList.ToList().Count > 0)
            {
                for (int i = 0; i < AllList.ToList().Count; i++)
                {
                    s += AllList.ToList()[i].ESHOP_NEW.NEWS_TITLE + "<br />";
                }

            }
            return s;
        }
        public string getPublishDate(object obj_date)
        {
            return string.Format("{0:dd-MM-yyyy}", obj_date);
        }

        public string getLink(object obj_id)
        {
            return "danh-sach-don-hang.html?id=" + Utils.CStrDef(obj_id);
        }
        public string getOrder()
        {
            _count = _count + 1;
            return _count.ToString();
        }
        public string getOrderStatus(object obj_status)
        {
            switch (Utils.CIntDef(obj_status))
            {
                case 0:
                    return "<font color='#FF0000'>Chưa xử lý</font>";
                case 1:
                    return "<font color='#0c5cd4'>Liên hệ khách hàng</font>";
                case 2:
                    return "<font color='#0c5cd4'>Giao hàng</font>";
                case 3:
                    return "<font color='#529214'>Thành công</font>";
                case 4:
                    return "<font color='#c4670c'>Thất bại</font>";
                default:
                    return "Chưa xử lý";
            }
        }
        public string getOrderPayment(object obj_payment)
        {
            switch (Utils.CIntDef(obj_payment))
            {
                case 1:
                    return "<font color='#0c5cd4'>Thanh toán bằng tiền mặt</font>";
                case 2:
                    return "<font color='#529214'>Thanh toán tại ngân hàng</font>";
                default:
                    return "Khác";
            }
        }
        public string GetMoney(object obj_value)
        {
            return string.Format("{0:#,#} đ", obj_value).Replace(',', '.');
        }
        public string GetNewsTitle(object Title)
        {
            try
            {
                return Utils.CStrDef(Title);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
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
        #endregion
    }
}