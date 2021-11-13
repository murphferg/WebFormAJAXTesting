<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MaskedField.ascx.cs" Inherits="AJAXTesting.MaskedField" %>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<asp:UpdatePanel ID="UpdatePanel1" runat="server" >
    <ContentTemplate>
        <asp:Label ID="lblText" runat="server" Text="*********" Width="70px"></asp:Label>
        <asp:TextBox ID="txtField" runat="server" Visible="true" Enabled="false" Text="*********" data-lnkbutton-id="" data-is-masked="true" data-unmask-timeout=""></asp:TextBox>
        <asp:LinkButton  ID="lnkButton" runat="server" OnClick="lnkButton_Click" ><i class='fa fa-eye fa-2x'></i></asp:LinkButton>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="lnkButton" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>
