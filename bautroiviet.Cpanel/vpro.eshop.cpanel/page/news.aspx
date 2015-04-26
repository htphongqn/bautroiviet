<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="news.aspx.cs" Inherits="vpro.eshop.cpanel.page.news" %>
<%@ Register Src="../Calendar/pickerAndCalendar.ascx" TagName="pickerAndCalendar"
    TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Tin tức - Sản phẩm | Vpro.Eshop </title>
    <script src="../Jquery/jquery.min.1.7.2.js" type="text/javascript"></script>
    <script src="../Jquery/JqueryCollapse/jquery.collapse.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        new jQueryCollapse($("#seo"), {
            query: 'div h2'
        });

        new jQueryCollapse($("#dvPrice"), {
            query: 'div h2'
        });

        function ParseText(objsent) {
            ParseUrl(objsent, document.getElementById('MainContent_txtSeoUrl'));
            document.getElementById('MainContent_txtSeoTitle').value = objsent.value;
            document.getElementById('MainContent_txtSeoKeyword').value = objsent.value;
        }
        function ParseDesc(objsent) {
            document.getElementById('MainContent_txtSeoDescription').value = objsent.value;
        }
        function ParseTextEn(objsent) {
            ParseUrl(objsent, document.getElementById('MainContent_txtSeoUrlEn'));
            document.getElementById('MainContent_txtSeoTitleEn').value = objsent.value;
            document.getElementById('MainContent_txtSeoKeywordEn').value = objsent.value;
        }
        function ParseDescEn(objsent) {
            document.getElementById('MainContent_txtSeoDescriptionEn').value = objsent.value;
        }
    </script>
    <script type="text/javascript" language="javascript">
				<!--
        function ToggleAll(e, action) {
            if (e.checked) {
                CheckAll();
            }
            else {
                ClearAll();
            }
        }

        function CheckAll() {
            var ml = document.forms[0];
            var len = ml.elements.length;
            for (var i = 1; i < len; i++) {
                var e = ml.elements[i];

                if (e.name.toString().indexOf("chkSelect") > 0)
                    e.checked = true;
            }
            ml.MainContent_GridItemList_toggleSelect.checked = true;
        }

        function ClearAll() {
            var ml = document.forms[0];
            var len = ml.elements.length;
            for (var i = 1; i < len; i++) {
                var e = ml.elements[i];
                if (e.name.toString().indexOf("chkSelect") > 0)
                    e.checked = false;
            }
            ml.MainContent_GridItemList_toggleSelect.checked = false;
        }

        function selectChange() {
            var radioButtons = document.getElementsByName("rblType");
            for (var x = 0; x < radioButtons.length; x++) {
                if (radioButtons[x].checked) {
                    if (radioButtons[x].value == 1)
                    { CheckAll(); }
                }
            }

        }

        function ToggleAll1(e, action) {
            if (e.checked1) {
                CheckAll1();
            }
            else {
                ClearAll1();
            }
        }

        function CheckAll1() {
            var ml = document.forms[0];
            var len = ml.elements.length;
            for (var i = 1; i < len; i++) {
                var e = ml.elements[i];

                if (e.name.toString().indexOf("chkSelect1") > 0)
                    e.checked1 = true;
            }
            ml.MainContent_DataGridSize_toggleSelect.checked1 = true;
        }

        function ClearAll1() {
            var ml = document.forms[0];
            var len = ml.elements.length;
            for (var i = 1; i < len; i++) {
                var e = ml.elements[i];
                if (e.name.toString().indexOf("chkSelect1") > 0)
                    e.checked1 = false;
            }
            ml.MainContent_DataGridSize_toggleSelect.checked1 = false;
        }

        function selectChange() {
            var radioButtons = document.getElementsByName("rblType");
            for (var x = 0; x < radioButtons.length; x++) {
                if (radioButtons[x].checked1) {
                    if (radioButtons[x].value == 1)
                    { CheckAll(); }
                }
            }

        }
        function get() {
            var pri1 = $("#<%=txtPriceSub.ClientID %>").val();
            var pri2 = $('#<%=TextBox1.ClientID %>').val();
            var s = pri1 - (pri1 * pri2 / 100);
            var t2 = document.getElementById("<%=txtgiamgia.ClientID %>");
            t2.value = s;
            
        }               
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="icon_function_parent">
        <%--        <div class="icon_function_Child">
            <asp:LinkButton ID="lbtHelp" runat="server">
				<img src="../Images/ICON_Help.jpg" width="30" height="30" style="border: 0px" /><div>
					Trợ giúp</div>
            </asp:LinkButton>
        </div>--%>
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
            <a href="news_list.aspx">
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
            <tr id="trNewsFunction" runat="server">
                <td colspan="3" align="left">
                    <div id="icon_function_news">
                        <div class="icon_function_items">
                            <a href="#" id="hplCatNews" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />Chọn
                                chuyên mục </a>
                        </div>
                        <%--                        <div class="icon_function_items">
                            <a href="#" id="hplCatProducts" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />
                                <asp:Label ID="lbCatNews" runat="server" Text="Chọn món ăn "></asp:Label></a>
                        </div>--%>
                        <div class="icon_function_items">
                            <a href="#" id="hplEditorHTMl" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />Soạn
                                tin HTML </a>
                        </div>
                        <div class="icon_function_items">
                            <a href="#" id="hplNewsAtt" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />File
                                đính kèm </a>
                        </div>
                        <div class="icon_function_items">
                            <a href="#" id="hplAlbum" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />Album
                                hình </a>
                        </div>
                        <div class="icon_function_items">
                            <a href="#" id="hplComment" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />Thông
                                tin phản hồi</a>
                        </div>
                        <%--<div class="icon_function_items">
                            <a href="#" id="bplNewsCopy" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />Sao
                                chép</a>
                        </div>--%>
                    </div>
                </td>
            </tr>
            <%-- <tr>
				<td height="5" colspan="3" align="left">
				</td>
			</tr>--%>
            <tr>
                <td colspan="3" align="left">
                    <asp:Label CssClass="user" ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
            <tr style="height: 20px;">
                <th valign="top" class="left">
                    Loại thông tin
                </th>
                <td height="25">
                    <asp:RadioButtonList ID="rblNewsType" runat="server" RepeatColumns="5" AutoPostBack="True"
                        OnSelectedIndexChanged="rblNewsType_SelectedIndexChanged">
                        <asp:ListItem Text="Tin tức" Value="0" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Sản phẩm" Value="1"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr id="trCat" runat="server">
                <th valign="top" class="left">
                    Chuyên mục
                </th>
                <td>
                    <asp:DropDownList ID="ddlCategory" runat="server" Width="500px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user"></span>Mã
                </th>
                <td>
                    <input type="text" name="txtCode" id="txtCode" runat="server" style="width: 500px;" />                    
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    <span class="user">*</span>Tiêu đề
                </th>
                <td>
                    <input type="text" name="txtTitle" id="txtTitle" runat="server" style="width: 500px;"
                        onkeyup="ParseText(this);" onblur="ParseText(this);" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập tên tiêu đề"
                        Text="Vui lòng nhập tiêu đề" ControlToValidate="txtTitle" CssClass="errormes"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    Mô tả
                </th>
                <td>
                    <textarea id="txtDesc" runat="server" style="width: 500px;" onkeyup="ParseDesc(this);"
                        onblur="ParseDesc(this);"></textarea>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    Liên kết
                </th>
                <td>
                    <input type="text" name="txtUrl" id="txtUrl" runat="server" style="width: 425px;" />
                    <span>
                        <asp:DropDownList ID="ddlTarget" runat="server">
                        </asp:DropDownList>
                    </span>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    Website
                </th>
                <td>
                    <input type="text" name="txtUrl" id="txtWebsite" runat="server" style="width: 500px;" />                    
                </td>
            </tr>            
            <tr style="height: 20px;">
                <th valign="top" class="left">
                    Cho phép phản hồi
                </th>
                <td height="25">
                    <asp:RadioButtonList ID="rblFeefback" runat="server" RepeatColumns="5">
                        <asp:ListItem Text="Không" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Có" Selected="True" Value="1"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <%--<tr>
                <th valign="top" class="left">
                    Lượt truy cập
                </th>
                <td>
                    <asp:Label ID="lblCount" runat="server" EnableViewState="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <th valign="top" class="left">
                    Gửi email
                </th>
                <td>
                    <asp:Label ID="lblSendEmail" runat="server" EnableViewState="false"></asp:Label>
                </td>
            </tr>--%>
        </table>
        <div id="dvOption" style="width: 650px;" data-collapse>
            <h3 class="collapse">
                Thông tin hiển thị</h3>
            <div>
                <table width="auto" border="0">
                    <tr style="height: 20px;">
                        <th valign="top" class="left">
                            Hiển thị
                        </th>
                        <td height="25">
                            <asp:RadioButtonList ID="rblStatus" runat="server" RepeatColumns="5">
                                <asp:ListItem Text="Không" Value="0"></asp:ListItem>
                                <asp:ListItem Selected="True" Text="Có" Value="1"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr style="height: 20px;">
                        <th valign="top" class="left">
                            Hiển thị trang chủ
                        </th>
                        <td height="25">
                            <asp:RadioButtonList ID="rblNewsPeriod" runat="server" RepeatColumns="5">
                                <asp:ListItem Selected="True" Text="N/A" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Nổi bật" Value="2"></asp:ListItem>   
                                <asp:ListItem Text="Mới" Value="3"></asp:ListItem>
                                <asp:ListItem Text="Khuyến mãi" Value="4"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr style="height: 20px;">
                        <th valign="top" class="left">
                            Hiển thị trong chi tiết
                        </th>
                        <td height="25">
                            <asp:RadioButtonList ID="rblShowDetail" runat="server" RepeatColumns="5">
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
                            <input type="text" name="txtOrder" id="txtOrder" runat="server" onkeyup="this.value=formatNumeric(this.value);"
                                onblur="this.value=formatNumeric(this.value);" maxlength="4" style="width: 500px;"
                                value="1" />
                        </td>
                    </tr>
                    <tr>
                        <th valign="top" class="left">
                            Thứ tự trang chủ
                        </th>
                        <td>
                            <input type="text" name="txtOrderPeriod" id="txtOrderPeriod" runat="server" onkeyup="this.value=formatNumeric(this.value);"
                                onblur="this.value=formatNumeric(this.value);" maxlength="4" style="width: 500px;"
                                value="1" />
                        </td>
                    </tr>
                    <tr>
                        <th valign="top" class="left">
                            Lượt xem
                        </th>
                        <td>
                            <input type="text" name="txtCount" id="txtCount" runat="server" onkeyup="this.value=formatNumeric(this.value);"
                                onblur="this.value=formatNumeric(this.value);" maxlength="6" style="width: 500px;"
                                value="1" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="dvPrice" style="width: 650px;" data-collapse runat="server">
            <h3 class="collapse open">
                Thông tin sản phẩm</h3>
            <div>
                <table width="auto" border="0">                    
                    <tr>
                        <th valign="top" class="left">
                            Giá Cũ
                        </th>
                        <td>                        
                            <input type="text" name="txtPriceSub" id="txtPriceSub" runat="server" onkeyup="this.value=formatNumeric(this.value);"
                                onblur="this.value=formatNumeric(this.value);" maxlength="20" style="width: 500px;"
                                value="0" />
                        </td>
                    </tr>
                    <tr>
                        <th valign="top" class="left">
                            % Giảm
                        </th>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" onchange="get();" onkeyup="this.value=formatNumeric(this.value);"
                                onblur="this.value=formatNumeric(this.value);"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <th valign="top" class="left">
                            Giá giảm
                        </th>
                        <td>
                            <input type="text" name="txtgiamgia" id="txtgiamgia" runat="server"  onkeyup="this.value=formatNumeric(this.value);"
                                onblur="this.value=formatNumeric(this.value);" maxlength="20" style="width: 500px;"
                                value="0" />
                        </td>
                    </tr>
                    <tr style="display:none">
                        <th valign="top" class="left">
                            <span class="user"></span>Ngày kết thúc
                        </th>
                        <td>
                            <uc1:pickerAndCalendar ID="ucDelineDate" runat="server" />
                        </td>
                    </tr>
                     <tr style="display:none" >
                        <th valign="top" class="left">
                            Số lượng bán
                        </th>
                        <td>
                            <input type="text" name="txtUrl" id="txtSoluongban" runat="server" style="width: 500px;" />                    
                        </td>
                    </tr>
                    <tr style="display:none">
                        <th valign="top" class="left">
                            Khu vực
                        </th>
                        <td>
                            <asp:DropDownList ID="ddlCity" runat="server" style="width: 490px;" DataTextField="PROP_NAME" DataValueField="PROP_ID"></asp:DropDownList>                
                        </td>
                    </tr>
                    <tr>
                        <th valign="top" class="left">
                            Bảo hành
                        </th>
                        <td>
                            <input type="text" name="txtUrl" id="txtBaohanh" runat="server" style="width: 500px;" />                    
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="seo" style="width: 650px;" data-collapse>
            <h3 class="collapse">
                SEO Parameters</h3>
            <div>
                <table width="auto" border="0">
                    <tr>
                        <th valign="top" class="left">
                            <span class="user">*</span>SEO Title
                        </th>
                        <td>
                            <input type="text" name="txtSeoTitle" id="txtSeoTitle" runat="server" style="width: 500px;" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập tên nhóm"
                                Text="Vui lòng nhập Seo Title" ControlToValidate="txtSeoTitle" CssClass="errormes"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <th valign="top" class="left">
                            <span class="user">*</span>SEO URL
                        </th>
                        <td>
                            <input type="text" name="txtSeoUrl" id="txtSeoUrl" runat="server" style="width: 500px;" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Vui lòng nhập tên nhóm"
                                Text="Vui lòng nhập Seo Url" ControlToValidate="txtSeoUrl" CssClass="errormes"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <th valign="top" class="left">
                            SEO Keyword
                        </th>
                        <td>
                            <textarea id="txtSeoKeyword" runat="server" style="width: 500px;"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th valign="top" class="left">
                            SEO Description
                        </th>
                        <td>
                            <textarea id="txtSeoDescription" runat="server" style="width: 500px;"></textarea>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="dvImage" style="width: 650px;" data-collapse>
            <h3 class="collapse">
                Thông tin hình ảnh</h3>
            <div>
                <table width="auto" border="0">
                    <%-- <tr id="trUploadImage1" runat="server">
                        <th valign="top" class="left">
                            Hình minh họa nhỏ(160x160)px
                        </th>
                        <td>
                            <input id="fileImage1" type="file" name="fileImage1" size="50" runat="server" style="width: 500px;">
                        </td>
                    </tr>
                  <tr id="trImage1" runat="server">
                        <th valign="top" class="left">
                            <asp:ImageButton ID="btnDelete1" runat="server" ImageUrl="../images/delete_icon.gif"
                                BorderWidth="0" Width="13px" OnClick="btnDelete1_Click" ToolTip="Xóa hình minh họa này"
                                Style="height: 11px"></asp:ImageButton>
                        </th>
                        <td>
                            <asp:HyperLink runat="server" ID="hplImage1" Target="_blank"></asp:HyperLink><br />
                            <img id="Image1" runat="server" />
                        </td>
                    </tr>
                    <tr id="trUploadImage2" runat="server">
                        <th valign="top" class="left">
                            Hình chi tiết (400x300)px
                        </th>
                        <td>
                            <input id="fileImage2" type="file" name="fileImage2" size="50" runat="server" style="width: 500px;" />
                        </td>
                    </tr>
                    <tr id="trImage2" runat="server">
                        <th valign="top" class="left">
                            <asp:ImageButton ID="btnDelete2" runat="server" ImageUrl="../images/delete_icon.gif"
                                BorderWidth="0" Width="13px" ToolTip="Xóa hình chi tiết này" OnClick="btnDelete2_Click">
                            </asp:ImageButton>
                        </th>
                        <td>
                            <asp:HyperLink runat="server" ID="hplImage2" Target="_blank"></asp:HyperLink><br />
                            <img id="Image2" runat="server" alt="" />
                        </td>
                    </tr>--%>
                    <tr id="trUploadImage3" runat="server">
                        <th valign="top" class="left">
                            Hình chi tiết lớn
                        </th>
                        <td>
                            <input id="fileImage3" type="file" name="fileImage3" size="50" runat="server" style="width: 500px;" />
                        </td>
                    </tr>
                    <tr id="trImage3" runat="server">
                        <th valign="top" class="left">
                            <asp:ImageButton ID="btnDelete3" runat="server" ImageUrl="../images/delete_icon.gif"
                                BorderWidth="0" Width="13px" ToolTip="Xóa hình chi tiết này" OnClick="btnDelete3_Click"
                                Style="height: 11px"></asp:ImageButton>
                        </th>
                        <td>
                            <asp:HyperLink runat="server" ID="hplImage3" Target="_blank"></asp:HyperLink><br />
                            <img id="Image3" runat="server" alt="" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="dvProductDetails" style="width: 650px;" data-collapse runat="server">
            <%--<h3 class="collapse">
                Thông tin chi tiết sản phẩm</h3>  --%>
            <%-- <table width="auto" border="0">
                    <tr>
                        <th valign="top" class="left">
                            Tình trạng
                        </th>
                        <td>
                            <input type="text" name="txtStatus" id="txtStatus" runat="server" style="width: 500px;" />
                        </td>
                    </tr>
                    <tr>
                        <th valign="top" class="left">
                            Bảo hành
                        </th>
                        <td>
                            <input type="text" name="txtWarranty" id="txtWarranty" runat="server" style="width: 500px;" />
                        </td>
                    </tr>
                    <tr>
                        <th valign="top" class="left">
                            Nhà nhập khẩu
                        </th>
                        <td>
                            <input type="text" name="txtOrigin" id="txtOrigin" runat="server" style="width: 500px;" />
                        </td>
                    </tr>
                    <tr>
                        <th valign="top" class="left">
                            Hãng sản xuất
                        </th>
                        <td>
                            <input type="text" name="txtManufacture" id="txtManufacture" runat="server" style="width: 500px;" />
                        </td>
                    </tr>
                    <tr>
                        <th valign="top" class="left">
                            Khối lượng (gram)
                        </th>
                        <td>
                            <input type="text" name="txtPrice" id="txtWeight" runat="server" onkeyup="this.value=formatNumeric(this.value);"
                                onblur="this.value=formatNumeric(this.value);" maxlength="20" style="width: 500px;"
                                value="0" />
                        </td>
                    </tr>
                </table>--%>
        </div>
    </div>
</asp:Content>
