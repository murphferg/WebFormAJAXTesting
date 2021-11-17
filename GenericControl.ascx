<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GenericControl.ascx.cs" Inherits="AJAXTesting.GenericControl" %>
<%@ Register Src="~/MaskedField.ascx" TagPrefix="uc1" TagName="MaskedField" %>
<h3>Generic Control</h3>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate><uc1:MaskedField runat="server" ID="MaskedField" ControlType="Label" /></ContentTemplate>
</asp:UpdatePanel>

