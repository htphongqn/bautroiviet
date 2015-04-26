<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="THVDev.UIs.Header" %>
   


    <div id="header">
            <asp:Repeater ID="Rplogo" runat="server">
            <ItemTemplate>
                <%# Getbanner(Eval("BANNER_TYPE"),Eval("BANNER_FIELD1"), Eval("BANNER_ID"), Eval("BANNER_FILE"))%>
            </ItemTemplate>
        </asp:Repeater>
    </div>