<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteVI.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="THVDev.Default" %>
<%@ Register src="~/UIs/Partners.ascx" tagname="Partners" tagprefix="uc1" %>
<%@ Register src="~/UIs/SidebarR.ascx" tagname="SidebarR" tagprefix="uc1" %>
<%@ Register src="~/UIs/TopMain.ascx" tagname="TopMain" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">
    <!--Top Main-->
    <uc1:TopMain ID="TopMain1" runat="server" />
    <!--End Top Main -->

    <!--Main Content-->
    <div id="main" class="cf">
      <!--Tab Products 01-->
      <div class="box">
        <div id="tabs-container">
          <div class="tab_home">
            <ul class="tabs_menu">
              <li class="active" rel="tab-1"><span>Sản phẩm mới</span></li>
              <li rel="tab-2"><span>Sản phẩm nổi bật</span></li>
              <li rel="tab-3"><span>Sản phẩm khuyến mãi</span></li>
            </ul>
            <%--<a href="/san-pham.html" class="view_allP"><i>Xem tất cả</i></a>--%>
            </div>
          <div class="tab_container">
            <div id="tab-1" class="tab_content">
              <!--Slide Products-->
              <div id="new_products" class="sl_products">
                <ul class="carousel">
                  <asp:Repeater ID="Rplistnews_moi" runat="server" onitemcommand="Rplistnews_ItemCommand">
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
                          <a href="" class="link_contact"><i>Liên hệ để có giá tốt hơn</i></a></div>
                        <!--End Product-->
                      </li>
                    </ItemTemplate>
                </asp:Repeater>
                </ul>
                <div class="cf"></div>
                <a class="prev_slide" href="#">&lt;</a> <a class="next_slide" href="#">&gt;</a> </div>
              <!--end Slide Products-->
            </div>
            <div id="tab-2" class="tab_content">
              <!--Slide Products-->
              <div id="popular_products" class="sl_products">
                <ul class="carousel">
                  <asp:Repeater ID="Rplistnews_noibat" runat="server" onitemcommand="Rplistnews_ItemCommand">
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
                          <a href="" class="link_contact"><i>Liên hệ để có giá tốt hơn</i></a></div>
                        <!--End Product-->
                      </li>
                    </ItemTemplate>
                </asp:Repeater>

                </ul>
                <div class="cf"></div>
                <a class="prev_slide" href="#">&lt;</a> <a class="next_slide" href="#">&gt;</a> </div>
              <!--end Slide Products-->
            </div>
            <div id="tab-3" class="tab_content">
              <!--Slide Products-->
              <div id="saleoff_products" class="sl_products">
                <ul class="carousel">
                  <asp:Repeater ID="Rplistnews_khuyenmai" runat="server" onitemcommand="Rplistnews_ItemCommand">
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
                          <a href="" class="link_contact"><i>Liên hệ để có giá tốt hơn</i></a></div>
                        <!--End Product-->
                      </li>
                    </ItemTemplate>
                </asp:Repeater>

                </ul>
                <div class="cf"></div>
                <a class="prev_slide" href="#">&lt;</a> <a class="next_slide" href="#">&gt;</a> </div>
              <!--end Slide Products-->
            </div>
          </div>
        </div>
      </div>
      <!--End Tab Products 01-->
      <!--Row Home-->
      <div class="box row_home">
      <h1 title="Doanh Nghiệp TMDV CN Bầu Trời Việt" class="name_web">Doanh Nghiệp TMDV CN Bầu Trời Việt</h1>
        <!--Left Cate Home-->
        <div id="main_col" class="fl">
          <div class="inner_col_r">
            <asp:Repeater ID="rptMenuCats" runat="server">
                <ItemTemplate>
                  <!--Category Home-->
                <div class="box">
                    <div class="box_Tab_home">
                    <a class="main_cate" href="<%#GetLink_Cat(Eval("cat_url"),Eval("cat_seo_url"),1)%>">
                        <h2><%#Eval("cat_name")%></h2>
                    </a>
                    <ul class="link_tab_cate fr">
                    <%--<li><a href="#" class="link_tab_ajaxcate active">Camera AHD</a></li>
                    <li><a href="#" class="link_tab_ajaxcate">Camera Analog</a></li>
                    <li><a href="#" class="link_tab_ajaxcate">Camera IP</a></li>
                    <li><a href="#" class="link_tab_ajaxcate">Camera HDCVI</a></li>--%>
                    <a href="<%#GetLink_Cat(Eval("cat_url"),Eval("cat_seo_url"),1)%>" class="view_allP"><i>Xem tất cả</i></a>
                    </ul>
                    </div>
                    <div class="box_ct_home">
                    <div class="list_products">
                    <asp:Repeater ID="Repeater1" runat="server" onitemcommand="Rplistnews_ItemCommand" DataSource='<%# Loadlist_productByCatId(Eval("Cat_ID")) %>'>
                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>
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
                                  <a href="" class="link_contact"><i>Liên hệ để có giá tốt hơn</i></a></div>
                                <!--End Product-->
                              </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                    </div>
                  </div>
                </div>
                <!--End Category Home-->
                </ItemTemplate>
            </asp:Repeater>
          </div>
        </div>
        <!--end Left Cate Home-->
        <!--Sidebar-->
        <uc1:SidebarR ID="SidebarR1" runat="server" />
        <!--end Sidebar-->
      </div>
      <!--end Row Home-->
      <!--Slide Partners-->
      <uc1:Partners ID="Partners1" runat="server" />
      <!--End Slide Partners-->
    </div>
    <!--End Main Content-->
    </div>
</asp:Content>
