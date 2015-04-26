<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="News.ascx.cs" Inherits="THVDev.UIs.News" %>
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
        <div class="box_Tab_main"><h1 class="title_page"><asp:Label ID="lbTitle" runat="server"></asp:Label></h1></div>
        <div class="box_ct" id="list_news">
        <ul>
            
            <asp:Repeater ID="Rplistnews" runat="server">
                <ItemTemplate>
                <li> 
                <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>">
                <img class="img_general" alt="<%# Eval("NEWS_TITLE") %>" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" /></a>
                <h2><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>" class="news_title"><%# Eval("NEWS_TITLE") %></a></h2>
                <p><%# Eval("NEWS_DESC")%></p>
                <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>" class="view_more">Chi tiết &raquo;</a> </li>
                </ItemTemplate>
            </asp:Repeater>  

        </ul>
        <div class="pagination"><asp:Literal ID="ltrPage" runat="server"></asp:Literal> </div>
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