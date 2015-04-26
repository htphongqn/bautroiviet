<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SidebarR.ascx.cs" Inherits="THVDev.UIs.SidebarR" %>

<div id="sidebar" class="fr">
          <div class="box ads ads_right_home">
          
          <asp:Repeater ID="Rpbanner" runat="server">
            <ItemTemplate>
                    <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"))%>
            </ItemTemplate>
        </asp:Repeater>
           
          </div>
        </div>