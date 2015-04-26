<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Slide.ascx.cs" Inherits="THVDev.UIs.Slide" %>

<div class="slider theme-default">
    <div id="slider" class="nivoSlider">           
        <asp:Repeater ID="rptSilde" runat="server">
        <ItemTemplate>
                <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"))%>
        </ItemTemplate>
    </asp:Repeater>
            
    </div>
    </div>