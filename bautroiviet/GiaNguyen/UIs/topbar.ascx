<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="topbar.ascx.cs" Inherits="THVDev.UIs.topbar" %>

<div class="topbar">
    <%--<asp:Panel ID="pnanel1" runat="server" DefaultButton="Lbsearch">--%>
    <div class="search_form">  
        <input type="text" onblur="javscript:if (this.value == '') this.value = 'Tìm kiếm theo tên hoặc mã sản phẩm...';" onfocus="javascript:if (this.value == 'Tìm kiếm theo tên hoặc mã sản phẩm...') this.value = '';" value="Tìm kiếm theo tên hoặc mã sản phẩm..." name="keyword" id="q" runat="server" class="inputSearch" />  
        <asp:Button ID="Lbsearch" runat="server" CssClass="btn" OnClick="Lbsearch_Click" Text="Tìm kiếm"></asp:Button>    
    </div>
    <%--</asp:Panel>--%>
    <div class="cart_head"> 
    <a href="/gio-hang.html"><span class="icon_cart"></span>
    <span class="quantity"><asp:Literal ID="lbCountCart" runat="server" Text="0"></asp:Literal></span>
    <b>Giỏ hàng</b></a></div>
</div>