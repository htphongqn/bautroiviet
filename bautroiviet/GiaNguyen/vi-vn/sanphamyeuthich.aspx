<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteVI.Master" AutoEventWireup="true" CodeBehind="sanphamyeuthich.aspx.cs" Inherits="THVDev.vi_vn.sanphamyeuthich" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">
<div class="thirteen columns" id="main_content">
      <div class="inner_col">
        <!--List Products-->
        <div class="box">
          <h1 class="box_Tab"><asp:Label ID="lbTitle" runat="server" Text="Danh sách sản phẩm yêu thích"></asp:Label></h1>
          <div class="list_products">
            <ul>
              <asp:Repeater ID="Rplistnews" runat="server" onitemcommand="Rplistnews_ItemCommand">
                <ItemTemplate>
                <li class="four columns">
                <div class="product_item"> <a class="img_P" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>"> 
                <img alt="<%# Eval("NEWS_TITLE") %>" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"> </a>
                  <h3 class="product_name"><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>"><%# Eval("NEWS_TITLE") %></a></h3>
                  <div class="price"><%# Getprice(Eval("NEWS_PRICE1"))%></div>
                  <asp:LinkButton ID="lnkCart" runat="server" Text="Mua hàng" CssClass="addtocart_btn" CommandName="AddCart" CommandArgument='<%# Eval("NEWS_SEO_URL") %>'></asp:LinkButton>
                  </div>
              </li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
          </div>
        </div>
        <!--End List Products-->
        <div class="cf"></div>
      <div class="pagination"><asp:Literal ID="ltrPage" runat="server"></asp:Literal> </div>
      </div>
    </div>
</asp:Content>
