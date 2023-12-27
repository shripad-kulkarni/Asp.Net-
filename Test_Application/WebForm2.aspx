<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Test_Application.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Insert Data using AJAX in ASP.NET</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        function loadData() {

            var name = $('#<%= Name.ClientID %>').val();
            var address = $('#<%= Address.ClientID %>').val();
            var contactno = $('#<%= ContactNo.ClientID %>').val();
            var age = $('#<%= Age.ClientID %>').val();
            var gender = $('#<%= GenderRadioButtonList.ClientID %>').val();
            var subject = $('#<%= SubjectDropDownList.ClientID %>').val();
             
            
             
            $.ajax({
                type: "POST",
                url: "WebForm2.aspx/InsertData",
                data: "{name:" + name + "}",
               // data: JSON.stringify({ name: name, address: address, contactno: contactno, age: age, gender: gender, subject: subject }),
                contentType: "application/json;char-set=utf-8",
                dataType: "json",
                async: true,
                success: function Success(data) {
                    console.log(response.d);
                },
                error: function (xhr, status, error) {
                 
                    console.error(error);
                }

            });
            return false;
        }
    </script>
</head>
<body>
    <form id="form2" runat="server">

        <div>

            <table>
                <tr>
                    <td>
                        <asp:Label Text="ID" Visible="false" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="ID" runat="server" Visible="false"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Name</label></td>
                    <td>
                        <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Address</label>
                    </td>
                    <td>
                        <asp:TextBox ID="Address" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Contact No</label></td>
                    <td>
                        <asp:TextBox ID="ContactNo" runat="server"></asp:TextBox>

                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Age</label></td>
                    <td>
                        <asp:TextBox ID="Age" runat="server"></asp:TextBox>

                    </td>
                </tr>
                    


                <tr>
                    <td>
                        <label>Gender</label></td>
                    <td>
                        <asp:RadioButtonList ID="GenderRadioButtonList" runat="server">
                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Subject List</label></td>
                    <td>
                        <asp:DropDownList ID="SubjectDropDownList" runat="server">
                            <asp:ListItem Text="C" Value="C"></asp:ListItem>
                            <asp:ListItem Text="C#" Value="C#"></asp:ListItem>
                            <asp:ListItem Text="C++" Value="C++"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>
                        <%--<asp:Button ID="ButtonSave" Text="Save" OnClick="Button_Click" runat="server" />
                        <asp:Button ID="ButtonUpdate" Visible="false" Text="Update" OnClick="ButtonUpdateClick" runat="server" />--%>
                        <asp:Button ID="Button_Save"   Text="Save" runat="server" OnClientClick="loadData();"  />
                         

                    </td>

                </tr>


            </table>

        </div>
    </form>
</body>
</html>
