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
using System.Configuration;

namespace THVDev.vi_vn
{
    public partial class Payment : System.Web.UI.Page
    {
        #region Declare
        Payment_cart pay = new Payment_cart();
        Cart_result rscart = new Cart_result();
        clsFormat fm = new clsFormat();
        SendMail sm = new SendMail();
        Config cf = new Config();
        Account acc = new Account();
        int cusID = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            var _configs = cf.Config_meta();

            if (_configs.ToList().Count > 0)
            {
                if (!string.IsNullOrEmpty(_configs.ToList()[0].CONFIG_FAVICON))
                    ltrFavicon.Text = "<link rel='shortcut icon' href='" + PathFiles.GetPathConfigs() + _configs.ToList()[0].CONFIG_FAVICON + "' />";
            }

            HtmlHead header = base.Header;
            HtmlMeta headerDes = new HtmlMeta();
            HtmlMeta headerKey = new HtmlMeta();
            headerDes.Name = "Description";
            headerKey.Name = "Keywords";

            header.Title = "Thanh toán";
            Guid _guid = (Guid)Session["news_guid"];
            if (!pay.Check_Cart(_guid))
            {
                Response.Redirect("/trang-chu.html", false);
            }
            if (HttpContext.Current.Session["User_ID"] != null)
            {
                cusID = Utils.CIntDef(HttpContext.Current.Session["User_ID"]);
                var itemCus = acc.getById(cusID);
                txtFullname.Value = itemCus.CUSTOMER_FULLNAME;
                txtAddress.Value = itemCus.CUSTOMER_ADDRESS;
                txtPhone.Value = itemCus.CUSTOMER_PHONE1;
                txtEmail.Value = itemCus.CUSTOMER_EMAIL;
            }
        }

        public void Finish()
        {
            try
            {
                Guid _guid = (Guid)Session["News_guid"];

                //Thông tin lưu vào bảng đặt hàng
                int _iPaymentID = Utils.CIntDef(ddlPayment.SelectedValue);
                string _sName = txtFullname.Value;
                string _sEmail = txtEmail.Value;
                string _sAddress = txtAddress.Value;
                string _sDesc = txtDesc.Value;
                DateTime _dateDate = DateTime.Now;
                string _sEmailCC = string.Empty;
                string _sPhone = txtPhone.Value;
                string _hinhtuc = ddlPayment.SelectedItem.Text;
                string _webname = ConfigurationManager.AppSettings["EmailDisplayName"];
                string _url = ConfigurationManager.AppSettings["URLWebsite"];
                var _ccMail = cf.Getemail(3);
                if (_ccMail.ToList().Count > 0)
                {
                    _sEmailCC = _ccMail.ToList()[0].EMAIL_TO;
                }
                int? tempcusID = null;
                if (cusID == 0)
                    tempcusID = null;
                else
                    tempcusID = cusID;
                if (pay.Payment_cart_rs(_guid, rscart.Total_Amount(_guid), _sEmail, _sName, _sPhone, _sAddress, _iPaymentID, _hinhtuc, _sDesc, _webname, _url, tempcusID))
                {
                    sm.SendEmailSMTP("Thông báo: Bạn đã đặt hàng thành công", _sEmail, _sEmailCC, "", pay._Mailbody, true, false);
                    pay.Delete_basket(_guid);
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Thông báo: Xác nhận thành công. Cảm ơn bạn đã mua hàng tại cửa hàng của chúng tôi!');document.location='" + ResolveClientUrl("/trang-chu.html") + "';</script>");
                }
                else Response.Write("<script LANGUAGE='JavaScript' >alert('Lỗi!');document.location='" + ResolveClientUrl("/trang-chu.html") + "';</script>");


            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        protected void Lbthanhtoan_Click(object sender, EventArgs e)
        {
            if (Utils.CIntDef(ddlPayment.SelectedValue) == 0)
            {
                string strScript = "<script>";
                strScript += "alert('Thông báo: Vui lòng chọn hình thức mua hàng!');";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
            }
            else
            {
                Finish();
            }
        }
    }
}