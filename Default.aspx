<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AJAXTesting._Default" %>

<%@ Register Src="~/MaskedField.ascx" TagPrefix="uc1" TagName="MaskedField" %>
<%@ Register Src="~/GenericControl.ascx" TagPrefix="uc1" TagName="GenericControl" %>


<!DOCTYPE HTML>
<html>
<head><title>AJAX Testing</title></head>
<body>

    <form id="frmPage" runat="server" method="post">
        <asp:UpdateProgress ID="UpdateProgress1" runat="server"></asp:UpdateProgress>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="false" EnablePartialRendering="true" AsyncPostBackTimeout="360000"></asp:ScriptManager>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <div id="divTest" class="jumbotron">
            <h1>Update Panel Testing</h1>
            <p class="lead">Testing an update panel loading that does not kick off Page_Load.</p>
            <p>
                <asp:Label ID="lblPageLoaded" runat="server" Text="Label"></asp:Label>
            </p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Force Reload" />
        </div>

        <div class="row">
            <div class="col-md-4">
                <h2>Update Panel on the Page</h2>
                <p>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional" OnUnload="UpdatePanel1_Unload">
                        <ContentTemplate>
                            <asp:Label runat="server" Text="*********" ID="lblText" Width="70px"></asp:Label>
                            <asp:LinkButton ID="lnkButton" runat="server" OnClick="lnkButton_Click" Text="<i class='fa fa-eye'></i>"></asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="lnkButton" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text="Content in Other Panel"></asp:TextBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </p>
            </div>
            <div class="col-md-4">
                <h2>Update Panel on a User Control</h2>
                <p>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <uc1:MaskedField runat="server" ID="MaskedField" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <p>
                    </p>
            </div>
            <div class="col-md-4">
                <h2>Update Panel on a Control within a Control</h2>
                <p>
                    <uc1:GenericControl runat="server" ID="GenericControl" />
            </div>
        </div>
    </form>
</body>
</html>
