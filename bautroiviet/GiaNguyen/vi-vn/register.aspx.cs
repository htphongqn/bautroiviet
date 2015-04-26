using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;
using GiaNguyen.Components;
using System.Web.UI.HtmlControls;

namespace THVDev.vi_vn
{
    public partial class register : System.Web.UI.Page
    {
        #region Declare
        Account acc = new Account();
        clsFormat fm = new clsFormat();
        SendMail send = new SendMail();
        Userinfo user = new Userinfo();
        Config cf = new Config();
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

            header.Title = "Đăng ký";

            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Utils.CStrDef(HttpContext.Current.Session["User_ID"])))
                {
                    Response.Redirect("/trang-chu.html");
                }
                Loadcity();
            }
        }
        public void Loadcity()
        {
            ddlCity.DataTextField = "PROP_NAME";
            ddlCity.DataValueField = "PROP_ID";
            ddlCity.DataSource = user.Loadcity();
            ddlCity.DataBind();
        }
        protected void btnDangky_Click(object sender, EventArgs e)
        {
            try
            {

                string _sbody = string.Empty;
                string _email = txtEmail.Value;
                string _fullname = Txtname.Value;
                string _pass = fm.MaHoaMatKhau(txtPassword.Value);
                string _sCodeActive = fm.TaoChuoiTuDong(15);
                if (this.TxtCapcha.Value == this.Session["CaptchaImageText"].ToString())
                {
                    if (acc.Check_email(txtEmail.Value))
                    {
                        Labelerrors.Text = "Email đã có người sử dụng!";
                        return;
                    }
                    DateTime ngaysinh = DateTime.ParseExact(txtNgaysinh.Value, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                    if (acc.Register(_fullname, ngaysinh, TxtAddress.Value, Txtphone.Value, ddlCity.SelectedValue, _pass, _email))
                    {
                        string strScript = "<script>";
                        strScript += "alert(' Đăng ký thành công!');";
                        strScript += "window.location='/trang-chu.html';";
                        strScript += "</script>";
                        Page.RegisterClientScriptBlock("strScript", strScript);
                    }
                    else
                    {
                        Labelerrors.Text = "Lỗi, Vui lòng thử lại!";
                    }
                }
                else
                {
                    Labelerrors.Text = "Mã xác nhận không đúng!";
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}