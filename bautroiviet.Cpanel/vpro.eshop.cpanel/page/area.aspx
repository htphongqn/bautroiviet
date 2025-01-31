﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="area.aspx.cs" Inherits="vpro.eshop.cpanel.page.area" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Khu vực | Vpro.Eshop </title>
    <script src="../Jquery/jquery.min.1.7.2.js" type="text/javascript"></script>
    <script src="../Jquery/JqueryCollapse/jquery.collapse.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        new jQueryCollapse($("#seo"), {
            query: 'div h2'
        });

        function ParseText(objsent) {
            ParseUrl(objsent, document.getElementById('MainContent_txtSeoUrl'));
            document.getElementById('MainContent_txtSeoTitle').value = objsent.value;
            document.getElementById('MainContent_txtSeoKeyword').value = objsent.value;
            //document.getElementById('MainContent_txtSeoDescription').value = objsent.value;
        }
        function ParseTextEn(objsent) {
            ParseUrl(objsent, document.getElementById('MainContent_txtSeoUrlEn'));
            document.getElementById('MainContent_txtSeoTitleEn').value = objsent.value;
            document.getElementById('MainContent_txtSeoKeywordEn').value = objsent.value;
            //document.getElementById('MainContent_txtSeoDescription').value = objsent.value;
        }
        function ParseDesc(objsent) {
            document.getElementById('MainContent_txtSeoDescription').value = objsent.value;
        }
        function ParseDescEn(objsent) {
            document.getElementById('MainContent_txtSeoDescriptionEn').value = objsent.value;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="icon_function_parent">
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
            <a href="area_list.aspx">
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
                <td colspan="3" align="left">
                    <asp:Label CssClass="user" ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    Cấp cha
                </th>
                <td>
                    <asp:DropDownList ID="ddlCategory" runat="server" Width="500px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    Mã
                </th>
                <td>
                    <input type="text" name="txtCode" id="txtCode" runat="server" style="width: 500px;" />
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Khu vực
                </th>
                <td>
                    <input type="text" name="txtName" id="txtName" runat="server" style="width: 500px;"
                        onkeyup="ParseText(this);" onblur="ParseText(this);" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập tên khu vực"
                        Text="Vui lòng nhập tên khu vực" ControlToValidate="txtName" CssClass="errormes"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    Mô tả
                </th>
                <td>
                    <textarea id="txtDesc" rows="3" cols="5" runat="server" style="width: 500px;" onkeyup="ParseDesc(this);"
                        onblur="ParseDesc(this);"></textarea>
                </td>
            </tr>
            <tr style="height: 20px;">
                <th valign="top" class="left">
                    Hiển thị
                </th>
                <td height="25">
                    <asp:RadioButtonList ID="rblActive" runat="server" RepeatColumns="5">
                        <asp:ListItem Text="Không" Value="0"></asp:ListItem>
                        <asp:ListItem Selected="True" Text="Có" Value="1"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    Thứ tự
                </th>
                <td>
                    <input type="text" name="txtOrder" id="txtOrder" runat="server" onblur="this.value=formatNumeric(this.value);"
                        maxlength="4" style="width: 500px;" value="1" onkeyup="this.value=formatNumeric(this.value);" />
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    Phí vận chuyển (tính theo 1gr)
                </th>
                <td>
                    <input type="text" name="txtShippingFee" id="txtShippingFee" runat="server" onblur="this.value=formatNumeric(this.value);"
                        maxlength="18" style="width: 500px;" value="0" onkeyup="this.value=formatNumeric(this.value);" />
                </td>
            </tr>
             <tr>
                <th valign="top" class="left">
                    Phí giao hàng (tính theo 1gr)
                </th>
                <td>
                    <input type="text" name="txtHomeFee" id="txtHomeFee" runat="server" onblur="this.value=formatNumeric(this.value);"
                        maxlength="18" style="width: 500px;" value="0" onkeyup="this.value=formatNumeric(this.value);" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
