<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteVI.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="THVDev.vi_vn.Payment" %>
<%@ Register src="~/UIs/Path.ascx" tagname="Path" tagprefix="uc1" %>
<%@ Register src="~/UIs/TopMainSub.ascx" tagname="TopMainSub" tagprefix="uc1" %>
<%@ Register src="~/UIs/Partners.ascx" tagname="Partners" tagprefix="uc1" %>
<%@ Register src="~/UIs/SidebarL.ascx" tagname="SidebarL" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
    <link href="/vi-vn/Styles/detail_product.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">


<!--Top Main-->
    <uc1:TopMainSub ID="TopMainSub1" runat="server" />
    <!--End Top Main -->
    
    <!--Main Content-->
    <div id="main" class="cf">
      <!--Row Home-->
      <div class="box row_home">
        <!--Sidebar-->
        <uc1:SidebarL ID="SidebarL1" runat="server" />
        <!--end Sidebar-->
        <!--Main Columns-->
        <div id="main_col" class="fl">
          <div class="inner_col_l">
          <uc1:Path ID="Path1" runat="server" />



    <div class="box" id="payment_page">
        <div class="box_Tab_main"><h1 class="title_page">Thanh toán</h1></div>
        <div class="box_ct form_web">
        <div class="row_account">
            <label class="item_title">Hình thức thanh toán:<span class="required">*</span></label>
            <asp:DropDownList ID="ddlPayment" runat="server" class="inputbox">
                <asp:ListItem Value="0">--- Chọn hình thức thanh toán ---</asp:ListItem>
                <asp:ListItem Value="1">Thanh toán trước (Đối với khách hàng ở Tỉnh)</asp:ListItem>
                <asp:ListItem Value="2">Thanh toán khi nhận hàng</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa chọn hình thức thanh toán"
                ControlToValidate="ddlPayment" Display="None" ForeColor="Red" ValidationGroup="G8"
                InitialValue="0"></asp:RequiredFieldValidator>
        </div>
        <div class="row_account">
            <label class="item_title"> Họ tên:<span class="required">*</span></label>
            <input class="inputbox" type="text" name="txtFullname" id="txtFullname" runat="server" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập họ tên!"
                ControlToValidate="txtFullname" Display="None" ForeColor="Red" ValidationGroup="G8"></asp:RequiredFieldValidator>
        </div>
        <div class="row_account">
            <label class="item_title"> Địa chỉ:<span class="required">*</span></label>
            <input class="inputbox" type="text" name="formAddress" id="txtAddress" runat="server" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập địa chỉ!"
                ControlToValidate="txtAddress" Display="None" ForeColor="Red" ValidationGroup="G8"></asp:RequiredFieldValidator>
        </div>
        <div class="row_account">
            <link rel="stylesheet" href="/vi-vn/Styles/BeatPicker.min.css" />
            <script src="/vi-vn/Scripts/BeatPicker.min.js"></script>
            <label class="item_title"> Thời gian giao:</label>
            <input type="text" data-beatpicker="true" data-beatpicker-position="['bottom','*']" data-beatpicker-module="clear" data-beatpicker-format="['DD','MM','YYYY'],separator:'/'" class="date depDate hasDatepicker inputbox fl" id="txtThoihanDate" name="flights-checkin" />
        </div>
        <div class="row_account">
            <label class="item_title">Số Điện thoại:<span class="required">*</span></label>
            <input class="inputbox" type="text" name="formPhone" id="txtPhone" runat="server"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập số điện thoại!"
                ControlToValidate="txtPhone" Display="None" ForeColor="Red" ValidationGroup="G8"></asp:RequiredFieldValidator>
        </div>
        <div class="row_account">
            <label class="item_title"> Email:</label>
            <input class="inputbox" type="text" name="formEmail" id="txtEmail" runat="server"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Chưa nhập email!"
                ControlToValidate="txtEmail" Display="None" ForeColor="Red" ValidationGroup="G8"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="<Email Định Dạng Chưa Đúng" ForeColor="Red" SetFocusOnError="True" Display="None"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="G8"></asp:RegularExpressionValidator>
        </div>
        <div class="row_account" style="width: 100%">
            <label class="item_title">Ghi chú:</label>
            <textarea type="text" rows="10" cols="45" name="txtDesc" id="txtDesc" runat="server" class="inputbox"
                ></textarea>
        </div>
        <div class="row_account text">               
                
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn_web btn_payment fl"
                OnClick="Lbthanhtoan_Click" ValidationGroup="G8">Thanh toán</asp:LinkButton>
        <a class="btn_web btn_payment reset_btn fl" onclick="reset();" href="javascript:void(0)"> Làm lại</a> 
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                ShowSummary="False" ValidationGroup="G8" />
            <script type="text/javascript">
                function reset() {
                    var name = document.getElementById("<%= txtFullname.ClientID %>");
                    var add = document.getElementById("<%= txtAddress.ClientID %>");
                    var phone = document.getElementById("<%= txtPhone.ClientID %>");
                    var email = document.getElementById("<%= txtEmail.ClientID %>");
                    var desc = document.getElementById("<%= txtDesc.ClientID %>");
                    name.value = email.value = add.value = desc.value = phone.value = "";
                }
            </script>
        </div>
        </div>
    </div>


    
     </div>
        </div>
        <!--end Main Columns-->
      </div>
      <!--end Row Home-->
      <!--Slide Partners-->
      <uc1:Partners ID="Partners1" runat="server" />
      <!--End Slide Partners-->
    </div>
    <!--End Main Content-->
</asp:Content>
