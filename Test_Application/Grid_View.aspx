<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="YourNamespace.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Information</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             
            <asp:GridView ID="GridViewUserInfo" runat="server" AutoGenerateColumns="False">
                <Columns>

                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" />
                    <asp:BoundField DataField="ContactNo" HeaderText="Contact No" />
                    <asp:BoundField DataField="Age" HeaderText="Age" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" />

                </Columns>

            </asp:GridView>
        </div>
    </form>
</body>
</html>
