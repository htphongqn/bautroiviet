<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="THVDev.UIs.Footer" %>

<div id="footer" class="cf">
      <!--Footer Menu-->
      <div id="menu_Foo">
        <ul>
          <asp:Repeater ID="Rpmenu_footer" runat="server">
            <ItemTemplate>
            <li>
                <a href="<%#GetLink_Cat(Eval("cat_url"),Eval("cat_seo_url"),1)%>">                               
                <%#Eval("cat_name")%>
                </a>                                
            </li>
            </ItemTemplate>
        </asp:Repeater>
        </ul>
      </div>
      <!--end Footer Menu-->
      <!--Footer Column-->
      <div class="box" id="footer_columns">
        <ul id="list_col_footer">
          <asp:Repeater ID="rptMenuDuoi" runat="server">
            <ItemTemplate>
                <li class="col_foo">
                    <div class="col_F_ct">
                      <h3 class="title_col_footer">
                        <a href="<%#GetLink_Cat(Eval("cat_url"),Eval("cat_seo_url"),1)%>">                               
                        <%#Eval("cat_name")%>
                        </a>
                      </h3>
                        <asp:Repeater ID="Repeater2" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                        <HeaderTemplate>
                            <ul class="list_menu_footer">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <a href="<%#GetLink_Cat(Eval("cat_url"),Eval("cat_seo_url"),1)%>">                               
                                    <%#Eval("cat_name")%>
                                </a>
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                    </div>
                </li>
            </ItemTemplate>
        </asp:Repeater>
        </ul>
      </div>
      <!--end Footer Column-->
      <!--Footer Bottom-->
      <div id="footer_bottom" class="cf">
        <asp:Literal ID="Literal_Info" runat="server"></asp:Literal>
      </div>
      <!--end Footer Bottom-->
    </div>