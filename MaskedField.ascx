<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MaskedField.ascx.cs" Inherits="AJAXTesting.MaskedField" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional" OnUnload="UpdatePanel1_Unload">
    <ContentTemplate>
        <asp:Label runat="server" Text="*********" ID="lblText" Width="70px"></asp:Label><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:LinkButton ID="lnkButton" runat="server" OnClick="lnkButton_Click" CausesValidation="false" ValidateRequestMode="Disabled"><i class='fa fa-eye-slash'></i></asp:LinkButton>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="lnkButton" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>

<script>
    function pageLoad() {
        if (true) {
            console.log("MaskedField pageLoad");
        }
    }
</script>