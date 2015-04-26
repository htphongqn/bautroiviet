<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Product.ascx.cs" Inherits="THVDev.UIs.Product" %>
<%@ Register src="~/UIs/Path.ascx" tagname="Path" tagprefix="uc1" %>
<%@ Register src="~/UIs/TopMainSub.ascx" tagname="TopMainSub" tagprefix="uc1" %>
<%@ Register src="~/UIs/Partners.ascx" tagname="Partners" tagprefix="uc1" %>
<%@ Register src="~/UIs/SidebarL.ascx" tagname="SidebarL" tagprefix="uc1" %>

<script type="text/javascript">
    $(function () {
        // duyệt toàn bộ các div có class là smart_deal 
        $(".time_div").each(function () {

            CountDown($(this).attr('id'));
        });
    });

    function CountDown(id) {
        $id = id.replace('time_div_', '');
        $totalSecond = $("#deal-timeleft-" + $id).attr('curtime');
        $totalDay1 = $totalSecond / 86400;
        $totalHour1 = ($totalSecond - (parseInt($totalDay1) * 86400)) / 3600;
        $totalMinute1 = ($totalSecond - (parseInt($totalDay1) * 86400) - (parseInt($totalHour1) * 3600)) / 60;
        $totalSecond1 = ($totalSecond - (parseInt($totalDay1) * 86400) - (parseInt($totalHour1) * 3600) - (parseInt($totalMinute1) * 60))

        $("#deal-timeleft-" + $id).attr('curtime', --$totalSecond);
        // GAN THOI GIAN VAO LABEL 

        $(".getngay_" + $id).html(parseInt($totalDay1));
        $(".getgio_" + $id).html(parseInt($totalHour1));
        $(".getphut_" + $id).html(parseInt($totalMinute1));
        $(".getgiay_" + $id).html(parseInt($totalSecond1));

        if ($totalSecond > -1) {
            setTimeout("CountDown('" + id + "')", 1000);
//            document.getElementById("showTime1").style.display = 'none';
        }
        else {
            $("#" + id).html('Đã hết thời gian....'); //Ẩn deal khi hết thời gian
            //            $("#muangay").each(function () {
            //                $(this).attr("data-oldhref", $(this).attr("onclick"));
            //                $(this).removeAttr("onclick");
            //            });

////            document.getElementById("showTime").style.display = 'none';
////            document.getElementById("price1").style.display = 'none';
////            document.getElementById("price2").style.display = 'none';
////            document.getElementById("sanphamconban").style.display = 'none';
        }
    } 
</script>

<div class="box row_home">
        <uc1:Path ID="Path1" runat="server" />



<!--Detail Products-->
        <div class="box">
          <div class="box_ct" id="detail_page">
            <link href="/vi-vn/Styles/detail_product.css" rel="stylesheet" type="text/css" />
            <div class="pro_left fl">
              <div class="zoom-section">
                <div class="zoom-small-image">                
                <asp:Repeater ID="Rpimg_l" runat="server">
                    <ItemTemplate>
                    <a href='<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>' class = 'cloud-zoom' id='zoom1' rel="adjustX: 10, adjustY:-4" title="">
                <img class="mainImage" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" alt='' title="" style="max-width:100%" /></a>
                    </ItemTemplate>
                </asp:Repeater>
                </div>
                <div class="zoom-desc">
                  <ul>
                    <asp:Repeater ID="Rpimg_small" runat="server">
                    <ItemTemplate>
                    <li> <a href='<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>' class='cloud-zoom-gallery' title='Red' rel="useZoom: 'zoom1', smallImage: '<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>' "><img class="zoom-tiny-image" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" alt = ""/></a> </li>
                    </ItemTemplate>
                </asp:Repeater>
                    
                  </ul>
                  <div class="cf"></div>
                  <a id="prev_thumb" class="prev" href="#">&lt;</a> <a id="next_thumb" class="next" href="#">&gt;</a> </div>
              </div>
              <div class="cf">
                <asp:Literal ID="Lbface" runat="server"></asp:Literal>
              </div>
            </div>
            <!--end: #dp-thumb-->
            <div id="dtp_info" class="fl">
              <h1 class="h1Title"><asp:Literal ID="lbProductName" runat="server"></asp:Literal></h1>
              <div class="dtp_status"> <span class="tt_dtp">Giá mới:</span> <b class="new_price"><asp:Literal ID="lbPriceNew" runat="server" Text="0"></asp:Literal><small>/Cái</small></b></div>
              <div class="dtp_status" id="divgiagoc" runat="server"> <span class="tt_dtp">Giá gốc:</span> <b class="old_price"><asp:Literal ID="lbPriceOld" runat="server" Text="0"></asp:Literal><small>/Cái</small></b></div>
              <div class="dtp_status" id="divtietkiem" runat="server"> <span class="tt_dtp">Tiết kiệm được:</span> <b class="save_percent"><asp:Literal ID="lbTietkiem" runat="server"></asp:Literal> <span>(<asp:Literal ID="lbTietkiemphantram" runat="server" Text="0"></asp:Literal>%)</span></b> </div>
              <div class="dtp_status short_des_dtp"><asp:Literal ID="lbDes" runat="server"></asp:Literal></div>
              <div class="dtp_status"> <span class="tt_dtp">Mã sản phẩm:</span> <asp:Literal ID="lbProductID" runat="server"></asp:Literal> </div>
              <div class="dtp_status"> <span class="tt_dtp">BẢO HÀNH:</span> <asp:Literal ID="lbBaohanh" runat="server"></asp:Literal> </div>
              <div class="dtp_status" style="display:none"> <span class="tt_dtp">Khu vực bán:</span> <asp:Literal ID="lbKhuvuban" runat="server"></asp:Literal> </div>
              <div class="dtp_status" style="display:none"> <span class="tt_dtp">Còn khuyến mại:</span> 
                <%--<span class="countdown_section"><span class="countdown_amount">16</span><br />
                <b>Ngày</b></span> <span class="countdown_section"><span class="countdown_amount">22</span><br />
                <b>Giờ</b></span> <span class="countdown_section"><span class="countdown_amount">19</span><br />
                <b>Phút</b></span> <span class="countdown_section"><span class="countdown_amount">50</span><br />
                <b>Giây</b></span> --%>
                <asp:Repeater ID="rptProductTime" runat="server">
                    <ItemTemplate>
                    <div id="showTime">
                    <div class="time_div" id="time_div_<%#Eval("News_id") %>">
                      <span class="f_bold cl_black_4 time_auto hasCountdown" id="deal-timeleft-<%#Eval("News_id") %>" 
                      curtime="<%#Getgiay(Eval("NEWS_SENDDATE")) %>">
                      <span class="unit_time getngay_<%#Eval("NEWS_ID") %>"></span>
                        <span>ngày</span>
                      <span class="sep sep_first">:</span>
                      <span class="unit_time getgio_<%#Eval("NEWS_ID") %>"></span>
                        <span>giờ</span>
                      <span class="sep">:</span>
                      <span class="unit_time getphut_<%#Eval("NEWS_ID") %>"></span>
                        <span>phút</span>
                      <span class="sep">:</span>
                      <span class="unit_time getgiay_<%#Eval("NEWS_ID") %>"></span>
                        <span>giây</span>
                      </span> </div>
                  </div>
                  </ItemTemplate>
                </asp:Repeater>

                </div>


              <div class="dtp_status short_des_dtp"><span class="tt_dtp">Số lượng mua</span>
                <asp:DropDownList ID="ddlQuantity" runat="server">
                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
                    <asp:ListItem Value="4" Text="4"></asp:ListItem>
                    <asp:ListItem Value="5" Text="5"></asp:ListItem>
                    <asp:ListItem Value="6" Text="6"></asp:ListItem>
                    <asp:ListItem Value="7" Text="7"></asp:ListItem>
                    <asp:ListItem Value="8" Text="8"></asp:ListItem>
                    <asp:ListItem Value="9" Text="9"></asp:ListItem>
                    <asp:ListItem Value="10" Text="10"></asp:ListItem>
                </asp:DropDownList>
              </div>
              <div class="dtp_status">
              <asp:LinkButton ID="lnkAddCart" runat="server" CssClass="btn_web btn_addtocart" OnClick="Lbaddtocart_Click">Mua ngay</asp:LinkButton></div>
            </div>
            <!--end Info Detail Product-->
            <div class="ads ads_right_dt fr"> 
            <asp:Repeater ID="rptbannerhotro" runat="server">
                <ItemTemplate>
                        <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"))%>
                </ItemTemplate>
            </asp:Repeater>
            </div>
          </div>
        </div>
        <!--end Detail Product-->
        <!--Main Columns-->
        <div id="main_col" class="fl">
          <div class="inner_col_r">
            <div class="box">
              <div class="tt_Tab"><span>Mô tả</span></div>
              <div class="box_ct info_g">
                <asp:Literal ID="liHtml" runat="server"></asp:Literal>
                <div class="cf"></div>
                <div class="tab_side" style="text-align: left; padding-left: 10px"><span>Bình luận</span></div>
                <div class="box_ct nobor">
                    <div id="fb-root"></div>
                    <script>    (function (d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0];
                            if (d.getElementById(id)) return;
                            js = d.createElement(s); js.id = id;
                            js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&appId=1578997885661619&version=v2.3";
                            fjs.parentNode.insertBefore(js, fjs);
                        } (document, 'script', 'facebook-jssdk'));</script>
                        <%--<div class="fb-comments" data-href="https://www.facebook.com/laptrinhvienvietnam2013?ref=hl" data-numposts="5" data-colorscheme="light"></div>--%>

                        <asp:Literal ID="lbCommentFace" runat="server"></asp:Literal>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!--end Main Columns-->
        <!--Sidebar-->
        <div id="sidebar" class="fr">          
          <!--List Products-->
          <div class="box">
            <div class="tab_side">Sản phẩm cùng danh mục</div>
            <div class="box_ct" id="other_products">
              <ul>
                <asp:Repeater ID="RplistproductCungloai" runat="server">
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
                        <!--End Product-->
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
              </ul>
            </div>
          </div>
          <!--End List Products-->
        </div>
        <!--end Sidebar-->


        </div>