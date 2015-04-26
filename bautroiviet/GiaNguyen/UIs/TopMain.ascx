<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopMain.ascx.cs" Inherits="THVDev.UIs.TopMain" %>
<%@ Register src="~/UIs/topbar.ascx" tagname="topbar" tagprefix="uc1" %>
<%@ Register src="~/UIs/Slide.ascx" tagname="Slide" tagprefix="uc1" %>

<div class="top_main">
      <!-- Main Menu-->
      <div class="all_categories fl">
        <div class="show_menu">
          <div class="tab_cate"><span>DANH MỤC SẢN PHẨM<i class="arr_down"></i></span></div>
          <!--Main Menu-->
          <ul style="display: block; height: 342px" class="nav_menu">
            <asp:Repeater ID="rptMenuLeft" runat="server">
                <ItemTemplate>
                    <li class="m_li">
                        <i class="icon_cate"><img alt="" src="<%#Getimages_Cat(Eval("cat_id"),Eval("CAT_IMAGE1"))%>" /></i>
                        <a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>" class="t_menu">
                            <%#Eval("cat_name")%>
                        </a>
                      <div class="list_categories">
                        <div class="subcatwrapper"> 
                            <span class="image_Cate"><img alt="" src="<%#Getimages_Cat(Eval("cat_id"),Eval("CAT_IMAGE2"))%>" /></span>
                            <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                                <ItemTemplate>
                                  <div class="pc_menu">
                                    <p><a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>">                               
                                    <%#Eval("cat_name")%>
                                    </a></p>
                                    <asp:Repeater ID="Repeater2" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                                        <HeaderTemplate>
                                            <ul>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <li>
                                                <a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>">
                                                <%#Eval("cat_name")%>
                                                </a>
                                            </li>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </ul>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                    <div class="cf"> </div>
                                  </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        </div>
                      </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>            
          </ul>
        </div>
      </div>
      <!--end Main Menu-->

      <!--Right Top Main-->
      <div id="right_top_main" class="fr">
        <uc1:topbar ID="topbar1" runat="server" />
        <div id="homebanners">
          <!--Slide Banner-->
          <uc1:Slide ID="Slide1" runat="server" />
          <!--end Slide Banner-->
        </div>
      </div>
      <!--End Right Top Main-->
    </div>