<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="Test_Application.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

       <div style="display: flex;">
    <div style="flex: 1;">
            <asp:Table ID="table" runat="server">

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="custName" runat="server">Select Customer Name</asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple">
                            <asp:ListItem Text="Option 1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Option 2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Option 2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Option 3" Value="3"></asp:ListItem>
                        </asp:ListBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblTempName" runat="server">Template Name</asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtTempName" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblMessage" runat="server">Message</asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblImage" runat="server">Image</asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Image ID="Image" runat="server" />
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="buttonSave" runat="server" Text="Save" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
         </div>

            <div style="flex: 1;">
            <asp:GridView ID="MessageGridView" runat="server" AutoGenerateColumns="false">
                <Columns>
                    
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date">
                        <ItemTemplate>
                            <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDate" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Message">
                        <ItemTemplate>
                            <asp:Label ID="lblMessage" runat="server" Text='<%# Eval("Message") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMessage" runat="server" Text='<%# Bind("Message") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Label ID="lblImage" runat="server" Text='<%# Eval("Image") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtImage" runat="server" Text='<%# Bind("Image") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>

         </div>
        </div>
    </form>
</body>
</html>

