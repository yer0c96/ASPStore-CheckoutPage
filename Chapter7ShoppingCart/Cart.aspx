<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <img src="Images/banner.jpg" alt="banner" />
    <form id="form1" runat="server">
        <h1>Your shopping cart</h1>
        <asp:ListBox ID="lstCart" runat="server"></asp:ListBox>
        <div id="cartButtons">
            <asp:Button ID="btnRemove" runat="server" Text="Remove Item" OnClick="btnRemove_Click" />
            <asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" OnClick="btnEmpty_Click" />
        </div>
        <div id="shopButtons">
            <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" PostBackUrl="~/Order.aspx"/>
            <asp:Button ID="btnCheckout" runat="server" Text="Check Out" OnClick="btnCheckout_Click"/>
        </div>
        <p id="message">
            <asp:Label ID="lblMessage" runat="server" EnableViewState="false"></asp:Label>
        </p>
    </form>
</body>
</html>
