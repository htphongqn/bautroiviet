using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using GiaNguyen.Components;
using Model;

namespace THVDev.vi_vn
{
    public partial class userinfo : System.Web.UI.Page
    {
        Account acc = new Account();

        clsFormat fm = new clsFormat();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["USER_ID"] != null)
                {
                    Load_CustomerInfo();
                }
                else
                {
                    Response.Write("<script>alert('Bạn cần đăng nhập để quản lý tài khoản!');location.href='/trang-chu.html'</script>");
                }
            }
        }
        private void Load_CustomerInfo()
        {
            int userId = Utils.CIntDef(Session["USER_ID"]);
            var item = acc.getById(userId);
            if (item != null)
            {
                txtFullName.Value = item.CUSTOMER_FULLNAME;
                DateTime birthday = Utils.CDateDef(item.CUSTOMER_BIRTHDAY, DateTime.MinValue);
                txtNgaysinh.Value = "";
                if (birthday != DateTime.MinValue)
                    txtNgaysinh.Value = birthday.ToString("dd/MM/yyyy");
                Txtphone.Value = item.CUSTOMER_PHONE1;
                lbEmail.Text = item.CUSTOMER_EMAIL;

                txtYahoo.Value = item.CUSTOMER_FIELD1;
                TxtSkype.Value = item.CUSTOMER_FIELD2;
                TxtFacebook.Value = item.CUSTOMER_FIELD3;
            }
        }
        protected void lnkCapnhat_Click(object sender, EventArgs e)
        {
            int userId = Utils.CIntDef(Session["USER_ID"]);
            DateTime birthday = DateTime.ParseExact(txtNgaysinh.Value, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            int result = acc.updateCustomerNTV(userId, txtFullName.Value, birthday, Txtphone.Value, lbEmail.Text, txtYahoo.Value, TxtSkype.Value, TxtFacebook.Value);
            if (result == 1)
            {
                var item = acc.getById(userId);
                acc.Load_All_Cuss(item.CUSTOMER_EMAIL);
                Response.Write("<script>alert('Cập nhật thông tin thành công!');location.href='/thong-tin-ca-nhan.html'</script>");
            }
            else if (result == 0)
            {
                Response.Write("<script>alert('Lỗi cập nhật thông tin, hãy thử lại!');</script>");
            }
        }

        protected void lnkDoimatkhau_Click(object sender, EventArgs e)
        {
            string _pass = fm.MaHoaMatKhau(txtPassword.Value);
            var result = acc.Doimatkhau(Utils.CIntDef(Session["USER_ID"]), _pass);
            if (result == 1)
            {
                Response.Write("<script>alert('Đổi mật khẩu thành công!');location.href='/thong-tin-ca-nhan.html'</script>");
            }
            else if (result == 0)
            {
                Response.Write("<script>alert('Lỗi đổi mật khẩu, hãy thử lại!');</script>");
            }
        }
    }
}