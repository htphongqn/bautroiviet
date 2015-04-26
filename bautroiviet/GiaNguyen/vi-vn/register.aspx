<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteVI.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="THVDev.vi_vn.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="../vi-vn/Ajax/login.js" type="text/javascript"></script>
<asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">
<div class="thirteen columns" id="main_content">
      <div class="inner_col">
        <!--Thong tin tai khoan-->
        <link rel="stylesheet" href="/vi-vn/Styles/account.css" type="text/css">
        <div class="box" id="register">
          <h1 class="box_Tab">Đăng ký tài khoản</h1>
          <div class="inner_user_info">
          <asp:Label ID="Labelerrors" runat="server" Text="" ForeColor="Red"></asp:Label>
            <div class="inner_2col">
              <h3> Thông tin tài khoản </h3>
              <div class="profile-row"> <span class="left"><span class="required">*</span>Email:</span>
                <div class="text">
                  <input type="text" class="input-txt" id="txtEmail" runat="server">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập Email"
                    ControlToValidate="txtEmail" Display="None" ForeColor="Red" ValidationGroup="G401">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="Email Định Dạng Chưa Đúng" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ForeColor="Red" ValidationGroup="G401" Display="None">*</asp:RegularExpressionValidator>
                </div>
              </div>
              <div class="profile-row"> <span class="left"><span class="required">*</span>Mật khẩu:</span>
                <div class="text">
                  <input type="password" class="input-txt" id="txtPassword" runat="server">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập mật khẩu"
                    ControlToValidate="txtPassword" Display="None" ForeColor="Red" ValidationGroup="G401">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="profile-row"> <span class="left"><span class="required">*</span>Nhập lại mật khẩu:</span>
                <div class="text">
                  <input type="password" class="input-txt" id="txtConfirmPassword" runat=server>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập xác nhận mật khẩu"
                    ControlToValidate="txtConfirmPassword" Display="None" ForeColor="Red" ValidationGroup="G401">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ValidationGroup="G401"
                    ErrorMessage="Xác nhận mật khẩu chưa đúng" ForeColor="Red" Display="None">*</asp:CompareValidator>
                </div>
              </div>
              <h3 style="margin-top: 15px"> Thông tin cá nhân </h3>
              <div class="profile-row"> <span class="left"><span class="required">*</span>Họ tên:</span>
                <div class="text">
                  <input type="text" class="input-txt" id="Txtname" runat="server">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập họ tên"
                    ControlToValidate="Txtname" Display="None" ForeColor="Red" ValidationGroup="G401">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="profile-row"> <span class="left"><span class="required">*</span>Số điện thoại:</span>
                <div class="text">
                  <input type="text" class="input-txt" id="Txtphone" runat="server" >
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa nhập điện thoại"
                    ControlToValidate="Txtphone" Display="None" ForeColor="Red" ValidationGroup="G401">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="profile-row"> <span class="left"><span class="required">*</span>Địa chỉ:</span>
                <div class="text">
                  <input type="text" class="input-txt" id="TxtAddress" runat="server" >
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Chưa nhập địa chỉ"
                    ControlToValidate="TxtAddress" Display="None" ForeColor="Red" ValidationGroup="G401">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="profile-row"> <span class="left">Ngày sinh:</span>
                <!--DatePicker Plugin-->
                <link rel="stylesheet" href="/vi-vn/Styles/BeatPicker.min.css" />
                <script src="/vi-vn/Scripts/BeatPicker.min.js"></script>
                <div class="text">
                  <input type="text" data-beatpicker="true" data-beatpicker-position="['right','*']" data-beatpicker-module="clear" data-beatpicker-format="['DD','MM','YYYY'],separator:'/'" class="date depDate hasDatepicker input-txt" id="txtNgaysinh" name="flights-checkin" runat="server" />
                </div>
              </div>
              <div class="profile-row"> <span class="left"><span class="required">*</span>Tỉnh/Thành phố:</span>
                <div class="text">
                <asp:DropDownList ID="ddlCity" runat="server" CssClass="input-txt" AppendDataBoundItems="true" DataTextField="PROP_NAME" DataValueField="PROP_ID">
                <asp:ListItem Value="0" Text="--Chọn Tỉnh/Thành phố--"></asp:ListItem>
              </asp:DropDownList>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Chưa chọn Tỉnh/Thành phố"
                    ControlToValidate="ddlCity" Display="None" ForeColor="Red" InitialValue="0" ValidationGroup="G401">*</asp:RequiredFieldValidator>
                  
                </div>
              </div>
              <div class="profile-row"> <span class="left">Mã xác nhận:</span>
                <div class="text"> <asp:Image ID="Image1" runat="server" ImageUrl="/vi-vn/CImage.aspx" Width="170px" /> </div>
              </div>
              <div class="profile-row"> <span class="left"><span class="required">*</span>Nhập mã xác nhận:</span>
                <div class="text">
                  <input type="text" class="input-txt" id="TxtCapcha" runat="server">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Chưa nhập mã chuổi"
                    ControlToValidate="TxtCapcha" Display="None" ForeColor="Red" ValidationGroup="G401">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="profile-row button_account"> 
              <asp:LinkButton ID="btnDangky" runat="server" CssClass="btn_web" 
                  Text="Đăng ký" ValidationGroup="G401" onclick="btnDangky_Click"></asp:LinkButton>
          <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                ShowSummary="False" ValidationGroup="G401" />  
              </div>
            </div>
          </div>
        </div>
        <!--End Thong tin tai khoan-->
      </div>
    </div>
</asp:Content>
