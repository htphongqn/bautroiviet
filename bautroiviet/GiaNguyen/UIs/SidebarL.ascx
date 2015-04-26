<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SidebarL.ascx.cs" Inherits="THVDev.UIs.SidebarL" %>

<div id="sidebar" class="fl">
    <!--Support Online-->
    <div class="box">
    <div class="tab_side">Hỗ trợ trực tuyến</div>
    <div class="box_ct nobor" id="support_online">
        <div class="htdt"> <span class="htdt-t">Điện thoại</span>
        <asp:Repeater ID="Rphotline" runat="server">
            <ItemTemplate>
                <p><span style="font-weight: bold;color: #444;font-size: 12px;margin-right: 3px;"><%# Eval("ONLINE_DESC")%></span>: 
                <span style="color: red;"><%# Eval("ONLINE_FIELD2")%></span></p>
            </ItemTemplate>
        </asp:Repeater>
        </div>
    </div>
    </div>
    <!--end Support Online-->
    <div class="box ads ads_right_home">
    <asp:Repeater ID="Rpbanner" runat="server">
        <ItemTemplate>
                <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"))%>
        </ItemTemplate>
    </asp:Repeater>
    </div>
</div>