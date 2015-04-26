<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteVI.Master" AutoEventWireup="true" CodeBehind="userinfo.aspx.cs" Inherits="THVDev.vi_vn.userinfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">
<div class="thirteen columns" id="main_content">
      <div class="inner_col">
        <!--Thong tin tai khoan-->
        <link rel="stylesheet" href="/vi-vn/Styles/account.css" type="text/css">
        <div class="box">
          <h1 class="box_Tab">Thông tin tài khoản</h1>
          <div class="inner_user_info">
            <div class="inner_2col">
              <div class="profile-row"> <span class="left">Họ tên:</span>
                <div class="text">
                  <input type="text" id="txtFullName" runat="server" name="txt_ho_ten" class="input-txt" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập họ tên!"
                ControlToValidate="txtFullName" Display="None" ForeColor="Red" ValidationGroup="G403"></asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="profile-row"> <span class="left">Ngày sinh:</span>
                <!--DatePicker Plugin-->
                <link rel="stylesheet" href="/vi-vn/Styles/BeatPicker.min.css" />
                <script src="/vi-vn/Scripts/BeatPicker.min.js"></script>
                <div class="text">
                  <input type="text" data-beatpicker="true" data-beatpicker-position="['right','*']" data-beatpicker-module="clear" data-beatpicker-format="['DD','MM','YYYY'],separator:'/'" class="date depDate hasDatepicker input-txt" id="txtNgaysinh" runat="server" name="flights-checkin" />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập ngày sinh!"
                ControlToValidate="txtNgaysinh" Display="None" ForeColor="Red" ValidationGroup="G403"></asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="profile-row"> <span class="left">Số điện thoại:</span>
                <div class="text">
                  <input type="text" class="input-txt" id="Txtphone" runat="server">       
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập số điện thoại!"
                ControlToValidate="Txtphone" Display="None" ForeColor="Red" ValidationGroup="G403"></asp:RequiredFieldValidator>          
                </div>
              </div>
              <div class="profile-row"> <span class="left">Email:</span>
                <div class="text"> <asp:Literal ID="lbEmail" runat="server"></asp:Literal></div>
              </div>
              <div class="profile-row"><span class="left">Yahoo:</span>
                <div class="text">
                  <input type="text" class="input-txt" id="txtYahoo" runat="server" >
                </div>
              </div>
              <div class="profile-row"> <span class="left">Skype:</span>
                <div class="text">
                  <input type="text" class="input-txt" id="TxtSkype" runat="server" >
                </div>
              </div>
              <div class="profile-row"> <span class="left">Facebook:</span>
                <div class="text">
                  <input type="text" class="input-txt" id="TxtFacebook" runat="server"/>
                </div>
              </div>
              <div class="profile-row button_account">
                <div class="input"> <a onclick="window.history.go(-1); return false;" class="btn_web">Quay lại</a>
                <asp:LinkButton ID="lnkCapnhat" runat="server" CssClass="btn_web" Text="Cập nhật" 
                        ValidationGroup="G403" onclick="lnkCapnhat_Click"></asp:LinkButton>

                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" ShowMessageBox="True"
                ShowSummary="False" ValidationGroup="G403" />
                </div>
              </div>
            </div>
            <!--bleft end-->
            <div class="clearfix"> </div>
            <div class="box_Tab_main">
              <h2 class="title_page">Thay đổi mật khẩu</h2>
            </div>
            <div class="inner_2col">
              <div class="profile-row"> <span class="left">Mật khẩu:</span>
                <div class="text">
                  <input type="password" class="input-txt" id="txtPassword" runat="server">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa nhập Mật khẩu!"
                ControlToValidate="txtPassword" Display="None" ForeColor="Red" ValidationGroup="G407"></asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="profile-row"> <span class="left">Nhập lại mật khẩu:</span>
                <div class="text">
                  <input type="password" class="input-txt" id="txtConfirmPassword"  runat="server">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập xác nhận mật khẩu!"
                ControlToValidate="txtConfirmPassword" Display="None" ForeColor="Red" ValidationGroup="G407"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ValidationGroup="G407"
                    ErrorMessage="Xác nhận mật khẩu chưa đúng" ForeColor="Red" Display="None">*</asp:CompareValidator>
                </div>
              </div>
              <div class="profile-row button_account"> 
              <asp:LinkButton ID="lnkDoimatkhau" runat="server" CssClass="btn_web" 
                      Text="Đổi mật khẩu" ValidationGroup="G407" onclick="lnkDoimatkhau_Click"></asp:LinkButton> 
                      <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                ShowSummary="False" ValidationGroup="G407" />
                      </div>
            </div>
          </div>
        </div>
        <!--End Thong tin tai khoan-->
      </div>
    </div>
</asp:Content>
