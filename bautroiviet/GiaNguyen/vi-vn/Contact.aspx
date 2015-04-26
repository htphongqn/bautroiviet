<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteVI.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="THVDev.Contact" %>
<%@ Register src="~/UIs/Path.ascx" tagname="Path" tagprefix="uc1" %>
<%@ Register src="~/UIs/TopMainSub.ascx" tagname="TopMainSub" tagprefix="uc1" %>
<%@ Register src="~/UIs/Partners.ascx" tagname="Partners" tagprefix="uc1" %>
<%@ Register src="~/UIs/SidebarL.ascx" tagname="SidebarL" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
 <link href="/vi-vn/Styles/contact.css" rel="stylesheet" type="text/css" />
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



<div class="box">
    <div class="box_Tab_main">
    <h1 class="title_page"><asp:Literal ID="lbTitle" runat="server"></asp:Literal></h1>
    </div>
    <div class="box_ct">
    <div id="info_contact">
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    </div>
    <!--Form Contact-->
    <div class="form_web" id="contactus">
        <div class="row_contact">
        <label class="left_row"> Họ tên:<span class="required">*</span></label>
        <div class="right_row">
            <input type="text" class="inputbox" id="Txtname" runat="server">
            <br>
            <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Chưa nhập họ tên"
                    ControlToValidate="Txtname" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                    </div>
                    </div>
                    <div class="row_contact">
            <label class="left_row"> Địa chỉ:</label>
            <div class="right_row">
            <input type="text" class="inputbox" id="Txtaddress" runat="server">
            </div>
        </div>
        <div class="row_contact">
            <label class="left_row"> Điện thoại:<span class="required">*</span></label>
            <div class="right_row">
            <input type="text" class="inputbox" id="Txtphone" runat="server">
            <br>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập số điện thoại"
                    ControlToValidate="Txtphone" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row_contact">
            <label class="left_row"> Email:<span class="required">*</span></label>
            <div class="right_row">
            <input type="text" class="inputbox" id="txtEmail" runat="server">
            <br>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập email"
                    ControlToValidate="txtEmail" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row_contact">
            <label class="left_row"> Tiêu đề:<span class="required">*</span></label>
            <div class="right_row">
            <input type="text" class="inputbox" id="txttitle" runat="server">
            <br>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập tiêu đề"
                    ControlToValidate="txttitle" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row_contact">
            <label class="left_row"> Nội dung liên hệ:<span class="required">*</span></label>
            <div class="right_row">
            <textarea cols="45" rows="8" id="txtContent" runat="server"></textarea>
            <br>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập nội dung"
                    ControlToValidate="txtContent" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row_contact">
            <label class="left_row"> Mã an toàn:<span class="required">*</span></label>
            <div class="right_row">
            <input type="text" style="float: left; width: 150px; margin-right: 10px" class="inputbox"
                    id="txtCapcha" runat="server">
            <br>
            <br>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa nhập mã bảo vệ"
                    ControlToValidate="txtCapcha" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
            <div style="background-color: White; width: 160px;" class="left">
                <asp:Image ID="Image1" runat="server" ImageUrl="/vi-vn/CImage.aspx" Width="170px" />
            </div>
            </div>
        </div>
        <div class="row_contact"> 
            <asp:LinkButton ID="Lbthanhtoan" runat="server" CssClass="btn_web send_cmt" OnClick="Lbthanhtoan_Click"
    ValidationGroup="G40">Gửi</asp:LinkButton>
            <a href="javascript:void(0)" onclick="reset();" class="btn_web send_cmt reset_btn"> Làm lại</a>
            <div style="text-align: center">
          <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                ShowSummary="False" ValidationGroup="G40" />
          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="Email Định Dạng Chưa Đúng" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ForeColor="Red" ValidationGroup="G40"></asp:RegularExpressionValidator>
          <br />
          <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Txtphone"
                ErrorMessage="Số điện thoại định dạng chưa đúng" SetFocusOnError="True" ValidationExpression="^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d$"
                ForeColor="Red" ValidationGroup="G40"></asp:RegularExpressionValidator>
          <asp:Label ID="lblresult" runat="server" ForeColor="Red"></asp:Label>
        </div>
        </div>
        </div>
    </div>
    <!--End Form Contact-->                
    </div>

  <script type="text/javascript">
      function reset() {
          var name = document.getElementById("<%= Txtname.ClientID %>");
          var email = document.getElementById("<%= txtEmail.ClientID %>");
          var add = document.getElementById("<%= Txtaddress.ClientID %>");
          var desc = document.getElementById("<%= txtContent.ClientID %>");
          var phone = document.getElementById("<%= Txtphone.ClientID %>");
          var title = document.getElementById("<%= txttitle.ClientID %>");
          var capcha = document.getElementById("<%= txtCapcha.ClientID %>");
          name.value = email.value = add.value = desc.value = phone.value = title.value = capcha.value = "";
      }
    </script>



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
