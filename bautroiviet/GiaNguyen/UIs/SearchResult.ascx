<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchResult.ascx.cs" Inherits="THVDev.UIs.SearchResult" %>
<%@ Register src="~/UIs/Path.ascx" tagname="Path" tagprefix="uc1" %>
<%@ Register src="~/UIs/TopMainSub.ascx" tagname="TopMainSub" tagprefix="uc1" %>
<%@ Register src="~/UIs/Partners.ascx" tagname="Partners" tagprefix="uc1" %>
<%@ Register src="~/UIs/SidebarL.ascx" tagname="SidebarL" tagprefix="uc1" %>

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
    <div class="box_Tab_main"><h1 class="title_page"><asp:Label ID="lbTitle" runat="server" Text="Tìm kiếm"></asp:Label></h1></div>
    <div class="box_ct">
    <div class="list_products">
        <ul>
        <asp:Repeater ID="Rplistnews" runat="server" onitemcommand="Rplistnews_ItemCommand">
            <ItemTemplate>                
                <li>
                <!--Start Product-->
                <div class="product"> 
                <a class="img_product" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>">
                <img alt="<%# Eval("NEWS_TITLE") %>" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" /></a>
                    <h3 class="product_name"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><%# Eval("NEWS_TITLE") %></a></h3>
                    <div class="info_price"><%# Convert.ToDecimal(Eval("NEWS_PRICE2")) > 0 ? Getprice(Eval("NEWS_PRICE2")) : Getprice(Eval("NEWS_PRICE1"))%></div>
                    <div class="icon_P reduce">-<%# Eval("NEWS_PRICE3")%>%</div>
                    <div class="addtocart">
                    <asp:LinkButton ID="LinkButton1" runat="server" Text="Mua ngay" CommandName="AddCart" CommandArgument='<%# Eval("NEWS_SEO_URL") %>'></asp:LinkButton>
                    </div>
                    <a href="javascript:voi(0)" class="link_contact"><i>Liên hệ để có giá tốt hơn</i></a></div>
                <!--End Product-->
                </li>
            </ItemTemplate>
        </asp:Repeater>

        </ul>
        <div class="pagination"><asp:Literal ID="ltrPage" runat="server"></asp:Literal> </div>
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