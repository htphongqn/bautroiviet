<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Products1.ascx.cs" Inherits="THVDev.UIs.Products1" %>
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
        <div id="sidebar" class="fl">
          <!--Cate Left-->
          <!--end Cate Left-->
          <!--Filter Follow Designs-->
          <!--Filter Follow Designs-->
          <!--Trade Mark-->
          <div class="most-viewed" id="filter_trademark">
            <h3>Hãng sản xuất</h3>
            <ul class="list_field">
              <li class="multiselect__item">
                <input type="checkbox" id="checkboxfilter__brand--2good">
                <label for="checkboxfilter__brand--2good"><span></span>2GOOD</label>
              </li>
              
            </ul>
          </div>
          <!--end Trade Mark-->
          <!--Accessories Warranty-->
          <div class="most-viewed" id="filter_warranty">
            <h3>Bảo hành</h3>
            <ul class="list_field">
              <li title="2good" data-url="/tivi-video-am-thanh/2good/" data-count="4" data-name="2GOOD" data-key="filter__brand--2good" class="multiselect__item">
                <input type="checkbox" id="checkboxfilter__warranty--2good">
                <label for="checkboxfilter__warranty--2good"><span></span>Không có</label>
              </li>
              

            </ul>
          </div>
          <!--end Accessories Warranty-->
          <!--Type Accessories-->
          
          <!--end Type Accessories-->
          <!--Resolution-->
          
          <!--end Resolution-->
          <!--Filter Price-->
          <div class="most-viewed" id="search_price">
            <h3>Theo giá trị</h3>
            <ul class="list_field">
              <li title="2good" data-url="/tivi-video-am-thanh/2good/" data-count="4" data-name="2GOOD" data-key="filter__brand--2good" class="multiselect__item">
                <input type="checkbox" id="checkboxfilter__price--2good">
                <label for="checkboxfilter__price--2good"><span></span>Dưới  500.000đ</label>
              </li>

            </ul>
          </div>
          <!--end Filter Price-->
          <!--Filter Follow Number of Lights-->
          
          <!--end Filter Follow Number of Lights-->
          <!--Filter Follow Type of Chip-->
          
          <!--end Filter Follow Type of Chip-->
        </div>
        <!--end Sidebar-->
        <!--Main Columns-->
        <div id="main_col" class="fl">
          <div class="inner_col_l">
          <uc1:Path ID="Path1" runat="server" />



<div class="box">
    <div class="box_Tab_main"><h1 class="title_page"><asp:Label ID="lbTitle" runat="server"></asp:Label></h1></div>
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
                    <div class="info_price"><%# Getprice(Eval("NEWS_PRICE1"))%></div>
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