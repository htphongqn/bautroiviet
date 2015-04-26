<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteVI.Master" AutoEventWireup="true" CodeBehind="cart-result.aspx.cs" Inherits="THVDev.vi_vn.cart_result" %>
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


    <div class="box">
              <div class="box_Tab_main"><h1 class="title_page">Giỏ hàng của bạn</h1></div>
              <div class="box_ct" id="cart_page">                
               <asp:Repeater ID="Rpgiohang" runat="server" OnItemCommand="Rpgiohang_ItemCommand" OnItemDataBound="Rpgiohang_OnItemDataBound">
                    <ItemTemplate>
                    <!--Item cart-->
                    <div class="item_cart"> 
                    <a target="_parent" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>">
                    <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" class="img_cart" /></a>
                      <div class="detail_cart fl">
                        <div class="cell name">
                          <div> <span><%# Eval("NEWS_TITLE") %></span></div>
                        </div>
                        <div class="cell unit"><span id="soldprice_1757" class="new"><%# String.Format("{0:0,0 VNĐ}", Eval("Basket_Price")).Replace(",", ".")%></span></div>
                      </div>
                      <div class="item_cart_col_last fr">
                        <div class="cell amount">
                          <!-- so luong -->
                          Số lượng:
                          <asp:DropDownList ID="ddlQty" runat ="server">
                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                <asp:ListItem Text="7" Value="7"></asp:ListItem>                    
                                <asp:ListItem Text="8" Value="8"></asp:ListItem>                    
                                <asp:ListItem Text="9" Value="9"></asp:ListItem>                    
                                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                            </asp:DropDownList>
                            <input type="hidden" value='<%# Eval("NEWS_ID") %>' id="newsid" runat="server" />
                        </div>
                        <asp:LinkButton ID="lnkRemove" runat="server" CommandName="Remove" class="close fr" CommandArgument='<%# Eval("news_id") %>'></asp:LinkButton>
                        </div>
                    </div>
                    <!--end Item cart-->
                        </ItemTemplate>
                    </asp:Repeater>
                <div class="foo-cart">
                  <div class="total-cart">
                    <p style="text-align: right"> Tổng tiền:<asp:Label ID="Lbtotal" runat="server" Text=""></asp:Label> </p>
                  </div>
                </div>
                <div class="button_cart">
                <a class=" btn_web btn_payment fr" href="/thanh-toan.html">Thanh toán</a> 
                <a class="btn_web btn_payment fr" href="/trang-chu.html">Tiếp tục mua hàng</a>
                <asp:LinkButton ID="Lbcapnhap" runat="server" CssClass="btn_web btn_payment fr" OnClick="Lbcapnhap_Click">Cập nhật giỏ hàng</asp:LinkButton> 
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
