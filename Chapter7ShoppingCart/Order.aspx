<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
        <img src="Images/banner.jpg" alt="Banner" />
    <form id="form1" runat="server">
        <span>Please select a product</span>
        <asp:DropDownList ID="ddlProducts" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ProductID" Height="21px" Width="96px"></asp:DropDownList>
            
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProductID], [Name], [ShortDescription], [LongDescription], [ImageFile], [UnitPrice] FROM [Products]"></asp:SqlDataSource>
        <br />
        <br />
        <asp:Label ID="lblName" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblShortDescription" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblLongDescription" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblUnitPrice" runat="server"></asp:Label>
        <br />
        <br />

        <label id="lblQuantitiy">Quantity&nbsp;</label>
        <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btnAdd" runat="server" Text="Add To Cart" OnClick="btnAdd_Click" />
        
        <asp:Button ID="btnCart" runat="server" PostBackUrl="~/Cart.aspx" Text="Go To Cart" />
        <br />
        <asp:Image ID="imgProduct" runat="server" />
        <br />
     <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Quantity is required" ControlToValidate="txtQuantity" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Quantity must range from 1 to 1000" ControlToValidate="txtQuantity" ForeColor="Red" Type="Integer" MaximumValue="1000" MinimumValue="1"></asp:RangeValidator>
    --%></form>
</body>
</html>
