<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteVI.Master" AutoEventWireup="true" CodeBehind="quanlydonhang.aspx.cs" Inherits="THVDev.vi_vn.quanlydonhang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">
<div class="thirteen columns" id="main_content">
      <div class="inner_col">
        <!--Thong tin tai khoan-->
        <link rel="stylesheet" href="Styles/account.css" type="text/css">
        <div class="box">
          <h1 class="box_Tab">Quản lý đơn hàng</h1>
          <div class="defaultContent box_ct MyAccountContent">
            <ul class="AccountOrderStatusList">
              
              <asp:Repeater ID="rptProductsmaster" runat="server" >
                <ItemTemplate>
                    <li>
                    <div class="fr" style="clear: right;">
                      <div class="OrderButton"> <a href='<%# getLink(DataBinder.Eval(Container.DataItem, "ORDER_ID")) %>'>Chi tiết đơn hàng</a> </div>
                    </div>
                    <h3> Đơn hàng <%# DataBinder.Eval(Container.DataItem, "ORDER_CODE")%> </h3>
                    <div class="Order-Item">
                      <p class="Meta"> <span class="key">Ngày đặt</span>: <span class="value"> <%# getPublishDate(DataBinder.Eval(Container.DataItem, "ORDER_PUBLISHDATE"))%> </span></p>
                      <p> <span class="key">Trạng thái đơn hàng</span>: <span class="value"><strong style="color: #F00;"><%# getOrderStatus(DataBinder.Eval(Container.DataItem, "ORDER_STATUS"))%> </strong></span></p>
                      <p> <span class="key">Trị giá đơn hàng</span>: <span class="value"><em class="ProductPrice"><%# GetMoney(DataBinder.Eval(Container.DataItem, "ORDER_TOTAL_ALL"))%> </em></span> </p>
                      <p> <span class="key">Phương thức thanh toán</span>: <span class="value"><%# getOrderPayment(DataBinder.Eval(Container.DataItem, "ORDER_PAYMENT"))%> </span> </p>
                      <p style="display: none;"> <span class="key">Trạng thái thanh toán</span>: <span class="value">Chờ thanh toán</span> </p>
                      <p class="Order-List"> <span class="key">Đơn hàng bao gồm</span>: </p>
                      <ul class="OrderItemList">
                        <li> <%# getListProductNameOrderDetail(DataBinder.Eval(Container.DataItem, "ORDER_ID"))%>  </li>
                      </ul>
                    </div>
                  </li>
                </ItemTemplate>
              </asp:Repeater>
            </ul>
          </div>

          <div class="inner_user_info" runat="server" id="idItems">
        <div style="text-align: center;padding: 10px 0 5px 0;font-size: 15px;font-weight: 700;">
            <p>
                Chi tiết đơn hàng<br>
                Mã: <u><asp:Literal ID="liCode" runat="server"></asp:Literal></u>
            </p>
        </div>
        <link href="/vi-vn/Styles/process_payment.css" rel="stylesheet" type="text/css" />
        <div id="cart_page_user">
            <div class="row_th_cart">
                <h3 class="th_table_cart fl" style="width: 15%;font-size:14px;"> Hình ảnh </h3>
                <h3 class="th_table_cart fl" style="width: 40%;font-size:14px;"> Tên Sản Phẩm </h3>
                <h3 class="th_table_cart fl" style="width: 15%;font-size:14px;"> Giá Bán </h3>
                <h3 class="th_table_cart fl" style="width: 10%;font-size:14px;"> Số Lượng </h3>
                <h3 class="th_table_cart fl" style="width: 20%;font-size:14px;"> Thành Tiền </h3>
            </div>
      </div>
      <asp:Repeater ID="rptProducts" runat="server" >
        <ItemTemplate>
      <!--Item Cart-->
      <div class="item_cart fl"> 
        <a href='<%# GetLink(Eval("ESHOP_NEW.NEWS_URL"),Eval("ESHOP_NEW.NEWS_SEO_URL"),1) %>' target='_parent' class='img_cart fl'>
            <img src='<%# GetImageT(Eval("ESHOP_NEW.NEWS_ID"),Eval("ESHOP_NEW.NEWS_IMAGE3")) %>' alt='' width='100' height='100' />
        </a>
        <div class="cell name" style="text-align: center;">
            <div><span style="font-size:120%;"><a href="<%# GetLink(Eval("ESHOP_NEW.NEWS_URL"),Eval("ESHOP_NEW.NEWS_SEO_URL"),1) %>"><%# Eval("ESHOP_NEW.NEWS_TITLE")%></a></span></div>
        </div>
        <div class="cell unit">  <span class="new" id="soldprice_1757" style="font-size:110%;"><%# String.Format("{0:0,0 VNĐ}", Eval("ITEM_PRICE")).Replace(",", ".")%></span></div>
        <div class="cell amount">
          <!-- so luong -->
            <div><span style="font-size:110%;font-size: 130%;font-weight: 700;line-height: 65px;"><%# Eval("ITEM_QUANTITY")%></span></div>
          <!-- -->
        </div>
        <div class="cell total" id="dealtotal_1757" style="font-size:110%;"><%# String.Format("{0:0,0 VNĐ}", Convert.ToInt32(Eval("ITEM_PRICE")) * Convert.ToInt32(Eval("ITEM_QUANTITY"))).Replace(",", ".")%></div>
      </div>
      <!--end Item Cart-->
        </ItemTemplate>
      </asp:Repeater>
        <div class="foo-cart">
            <div class="total-cart" style="width: 300px;padding: 0px 23px;">
                <p style="display: block;padding:0;"> Phí vận chuyển:<span id="Span1" style="font-size:120%;"><asp:Literal ID="lblFreeShip" runat="server"></asp:Literal></span></p>
                <p style="display: block;padding:0;"> Tổng tiền:<span id="total-money" style="font-size:120%;"><asp:Literal ID="lblTotalMoney" runat="server"></asp:Literal></span></p>
            </div>
          </div>
        </div>

        </div>
        <!--End Thong tin tai khoan-->
      </div>
    </div>
</asp:Content>
