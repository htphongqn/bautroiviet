﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="extensionfiles.aspx.cs" Inherits="vpro.eshop.cpanel.page.extensionfiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Dạng mở rộng file | Vpro.Eshop</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="icon_function_parent">
        <div class="icon_function_Child">
            <asp:LinkButton ID="lbtHelp" runat="server">
                <img src="../Images/ICON_Help.jpg" width="30" height="30" style="border: 0px" /><div>
                    Trợ giúp</div>
            </asp:LinkButton>
        </div>
        <div class="icon_function_Child" id="dvDelete" runat="server">
            <asp:LinkButton ID="lbtDelete" runat="server" OnClick="lbtDelete_Click" OnClientClick="return confirm('Bạn có chắc chắn xóa không?');"
                CausesValidation="false">
                <img src="../Images/ICON_DELETE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Xóa</div>
            </asp:LinkButton>
        </div>
        <div class="icon_function_Child">
            <asp:LinkButton ID="lbtSaveNew" runat="server" OnClick="lbtSaveNew_Click">
                <img src="../Images/ICON_ADD.jpg" width="30" height="30" style="border: 0px" /><div>
                    Lưu và thêm mới</div>
            </asp:LinkButton>
        </div>
        <div class="icon_function_Child">
            <asp:LinkButton ID="lbtSave" runat="server" OnClick="lbtSave_Click"><img src="../Images/ICON_SAVE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Lưu</div></asp:LinkButton>
        </div>
        <div class="icon_function_Child">
            <a href="#" onclick="javascript:document.location.reload(true);">
                <img src="../Images/ICON_UPDATE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Cập nhật</div>
            </a>
        </div>
        <div class="icon_function_Child">
            <a href="extensionfiles_list.aspx">
                <img src="../Images/ICON_RETURN.jpg" width="30" height="30" style="border: 0px" />
                <div>
                    Quay lại</div>
            </a>
        </div>
    </div>
    <!--icon_function_parent-->
    <div id="field">
        <table width="auto" border="0">
            <tr>
                <td height="5" colspan="3" align="left">
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Tên dạng mở rộng
                </th>
                <td>
                    <input type="text" name="txtName" id="txtName" runat="server" style="width: 500px;" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập tên tiền tệ"
                        Text="Vui lòng nhập tên tiền tệ" ControlToValidate="txtName" CssClass="errormes"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    Mô tả
                </th>
                <td>
                    <input type="text" name="txtDesc" id="txtDesc" runat="server" style="width: 500px;" />
                </td>
            </tr>
            <tr id="trUploadImage1" runat="server">
                <th valign="top" class="left">
                    Icon (24px x 24px)
                </th>
                <td>
                    <input id="fileImage1" type="file" name="fileImage1" size="50" runat="server" style="width: 500px;">
                </td>
            </tr>
            <tr id="trImage1" runat="server">
                <th valign="top" class="left">
                    <asp:ImageButton ID="btnDelete1" runat="server" ImageUrl="../images/delete_icon.gif"
                        BorderWidth="0" Width="13px" OnClick="btnDelete1_Click" ToolTip="Xóa hình minh họa này">
                    </asp:ImageButton>
                </th>
                <td>
                    <asp:HyperLink runat="server" ID="hplImage1" Target="_blank"></asp:HyperLink><br />
                    <img id="Image1" runat="server" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
