<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckOut.aspx.cs" Inherits="CheckOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch07: Shopping Cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.2.3.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header class="jumbotron"><%-- image set in site.css --%></header>
    <main>
        <form id="form1" runat="server" class="form-horizontal" 
            defaultfocus="txtEmail" defaultbutton="btnCheckOut">
  
            <h1>Check Out Page</h1>

            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                CssClass="text-danger summary"
                HeaderText="Please correct these entries:" ForeColor="Red"/>
            <h3>Contact Information</h3>
            <div class="form-group">
                <label class="control-label col-sm-3">Email Address:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                        ErrorMessage="Email address" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtEmail" ForeColor="Red">Required</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                        ErrorMessage="Email address" CssClass="text-danger"
                        Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ControlToValidate="txtEmail" ForeColor="Red">Must be a valid email address</asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">Email Re-entry:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtEmail2" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvEmail2" runat="server" 
                        ErrorMessage="Email re-entry" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtEmail2" ForeColor="Red">Required</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvEmail2" runat="server" 
                        ErrorMessage="Email re-entry" CssClass="text-danger" Display="Dynamic"
                        ControlToValidate="txtEmail2" ControlToCompare="txtEmail" ForeColor="Red">Must match first email address</asp:CompareValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">First Name:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>  
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                        ErrorMessage="First name" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtFirstName" ForeColor="Red">Required</asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">Last Name:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                        ErrorMessage="Last name" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtLastName" ForeColor="Red">Required</asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">Phone Number:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" 
                        ErrorMessage="Phone number" CssClass="text-danger"
                        Display="Dynamic" ControlToValidate="txtPhone" ForeColor="Red">Required</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" 
                        ErrorMessage="Phone number" CssClass="text-danger"
                        Display="Dynamic" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                        ControlToValidate="txtPhone" ForeColor="Red">Use this format: 123-456-7890</asp:RegularExpressionValidator>
                </div>
            </div>
            <h3>Billing Address</h3>
            <div class="form-group">
                <label class="control-label col-sm-3">Address:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvStreetAddress" runat="server" 
                        ErrorMessage="Billing address" Text="Required"
                        CssClass="text-danger" Display="Dynamic" 
                        ControlToValidate="txtAddress" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">City:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                        ErrorMessage="Billing city" Text="Required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtCity" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">State:</label>
                <div class="col-sm-5">
                    <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" 
                        AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
                        DataTextField="StateName" DataValueField="StateCode">
                        <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [StateCode], [StateName] FROM [States] ORDER BY [StateCode]"></asp:SqlDataSource>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvState" runat="server" 
                        ErrorMessage="Billing state" Text="Required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="ddlState" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">Zip code:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtZip" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvZip" runat="server" 
                        ErrorMessage="Billing zip code" Text="Required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtZip" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <h3>Shipping Address</h3>
            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-9"> 
                    <asp:CheckBox ID="chkSameAsBilling" runat="server"
                        AutoPostBack="true" 
                        OnCheckedChanged="chkSameAsBilling_CheckedChanged" />
                    <label>Same as billing address</label>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">Address:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtShipAddress" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvShipAddress" runat="server" 
                        ErrorMessage="Shipping address" Text="Required"
                        CssClass="text-danger" Display="Dynamic" 
                        ControlToValidate="txtShipAddress" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">City:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtShipCity" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvShipCity" runat="server" 
                        ErrorMessage="Shipping city" Text="Required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtShipCity" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">State:</label>
                <div class="col-sm-5">
                    <asp:DropDownList ID="ddlShipState" runat="server" CssClass="form-control" 
                        AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
                        DataTextField="StateName" DataValueField="StateCode">
                        <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvShipState" runat="server" 
                        ErrorMessage="Shipping state" Text="Required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="ddlShipState" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">Zip code:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtShipZip" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvShipZip" runat="server" 
                        ErrorMessage="Shipping zip code" Text="Required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtShipZip" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <h3>Opptional Data</h3>
        <div class="form-group">
            <div class="col-sm-12">
                <label>Please let me know about:</label>
                <asp:CheckBoxList ID="cblAboutList" runat="server" RepeatColumns="2">
                    <asp:ListItem Value="New" Selected="True">New Products</asp:ListItem>
                    <asp:ListItem Value="Special">Special offers</asp:ListItem>
                    <asp:ListItem Value="Revisions">New Editions</asp:ListItem>
                    <asp:ListItem Value="Local">Local events</asp:ListItem>
                </asp:CheckBoxList>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-12">
                <label>Please contact me via:</label>
                <asp:RadioButtonList ID="rblContactVia" runat="server" RepeatDirection="Horizontal" style="height: 28px">
                    <asp:ListItem Selected="True">Twitter</asp:ListItem>
                    <asp:ListItem>Facebook</asp:ListItem>
                    <asp:ListItem Value="text">Text Message</asp:ListItem>
                    <asp:ListItem>Email</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-12">
                <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" CssClass="btn" OnClick="btnCheckOut_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" CssClass="btn" CausesValidation="false" OnClick="btnCancel_Click"/>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn" PostBackUrl="~/Order.aspx" CausesValidation="false">Continue Shopping</asp:LinkButton>
            </div>
        </div>
        </form>
    </main>

</div>
</body>
</html>
