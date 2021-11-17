<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AJAXTesting._Default" %>

<%@ Register Src="~/MaskedField.ascx" TagPrefix="uc1" TagName="MaskedField" %>
<%@ Register Src="~/GenericControl.ascx" TagPrefix="uc1" TagName="GenericControl" %>


<!DOCTYPE HTML>
<html>
<head><title>AJAX Testing</title>

    <script src="Scripts/MaskedField.js"></script>
</head>
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
            <input type="text" oninput="alert('yo')" />
        </div>

        <div class="row">
            <div class="col-md-6">
                <h2>Update Panel on a User Control</h2>
                <p>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <uc1:MaskedField runat="server" ID="MaskedField" ControlType="Label" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <p>
                    </p>
            </div>
            <div class="col-md-6">
                <h2>Update Panel on a Control within a Control</h2>
                <p>
                    <uc1:GenericControl runat="server" ID="GenericControl" />
            </div>
        </div>
    </form>
</body>
</html>
