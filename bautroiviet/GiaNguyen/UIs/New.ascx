<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="New.ascx.cs" Inherits="THVDev.UIs.New" %>
<%@ Register Src="Toolbar.ascx" TagName="Toolbar" TagPrefix="uc2" %>
<uc2:Toolbar ID="Toolbar1" runat="server" />
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
        <div class="box_ct" id="detail_news">
        <h1 class="h1Title"><asp:Label ID="lbNewsTitle" runat="server" Text="" /></h1>
        <div id="info_g">
            <p class="date"><asp:Label ID="lbDate" runat="server" Text="" /></p>
            <p><asp:Literal ID="liHtml" runat="server"></asp:Literal></p>
        </div>
        <div class="function">
            <div class="addthis_toolbox addthis_default_style like_face">
                <a class="addthis_button_preferred_1"></a><a class="addthis_button_preferred_2">
                </a><a class="addthis_button_preferred_3"></a><a class="addthis_button_preferred_4">
                </a><a class="addthis_button_compact"></a><a class="addthis_counter addthis_bubble_style">
                </a>
                <script type="text/javascript">
                    var addthis_config = { "data_track_addressbar": true };
                    addthis_config = addthis_config || {};
                    addthis_config.data_track_addressbar = false;
                </script>
                <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-50d418ab2d45f0aa"></script>
            </div>
            <div class="toolbar">
                <a id="hplSendEmail" href="#" class="email" runat="server">Gửi email</a> <a href="#"
                    id="hplPrint" target="_blank" runat="server" class="print">Bản In</a> <a href="#"
                        id="hplFeedback" runat="server" class="opinion">Phản hồi</a></div>
        </div>
        <!--Other News-->
            <div class="other_news_sub" id="dvOtherNews" runat="server">
                <h3 class="other_newsT">Tin bài khác</h3>
                <ul>
                    <asp:Repeater ID="RpNewsOther" runat="server">
                    <ItemTemplate>
                        <li><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>">
                            <%# Eval("NEWS_TITLE") %>
                            <span class="date">(Ngày đăng <%# getDate(Eval("NEWS_PUBLISHDATE"))%>)</span> </a></li>
                    </ItemTemplate>
                </asp:Repeater>
                </ul>
                <a id="hplViewmore" runat="server" class="view_all" href="">Xem tất cả &raquo;</a>
            </div>
        <!--Other News-->
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