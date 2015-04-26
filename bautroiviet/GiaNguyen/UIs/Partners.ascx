<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Partners.ascx.cs" Inherits="THVDev.UIs.Partners" %>

<div class="box">
        <div class="box_Tab_home"><span>ĐỐI TÁC</span></div>
        <div id="sl_logo_partner">
          <ul>

            <asp:Repeater ID="Rpbanner" runat="server">
            <ItemTemplate>
                <li>
                    <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"))%></li>
            </ItemTemplate>
        </asp:Repeater>

          </ul>
          <div class="cf"></div>
          <a id="prev_partner" class="prev" href="#">&lt;</a> <a id="next_partner" class="next" href="#">&gt;</a> </div>
      </div>