<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Test_Application.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Information Form using GridView</title>
</head>
<body>
    <form id="form1" runat="server">

        <div>
            
            <table>
               <tr>
                   <td>
                       <asp:Label Text="ID" visible="false" runat="server"></asp:Label>
                   </td>    
                   <td>
                       <asp:TextBox ID="ID" runat="server" Visible="false"></asp:TextBox>
                   </td>
               </tr>

                <tr>
                <td><label>Name</label></td>
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
                <td><label >Contact No</label></td>
                <td>
                   <asp:TextBox ID="ContactNo" runat="server"></asp:TextBox>

                </td>
            </tr>

            <tr>
                <td><label >Age</label></td>
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
                    <asp:Button ID="ButtonSave" Text="Save" OnClick="Button_Click" runat="server" />
                    <asp:Button ID="ButtonUpdate" Visible="false" Text="Update" OnClick="ButtonUpdateClick" runat="server" />
<%--                    <asp:Button ID="Button1" Visible="false" Text="Save" OnClientClick="fhhfhf()" runat="server" />--%>
                <asp:Button ID="ButtonNextPage" runat="server" Text="Next Page" OnClick="NextPage" />

                </td>

            </tr>
            
            
            </table>
                
        </div>

        <div>


            <h2>User Information Form using GridView</h2>
            <asp:GridView ID="GridViewUserInfo" runat="server" OnRowDataBound="GridViewUserInfo_RowDataBound"
                  OnRowCommand="GridViewUserInfo_DeleteRow"
                AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="653px"  >
                <AlternatingRowStyle BackColor="White" />
                <Columns>

                    <asp:TemplateField HeaderText="ID" Visible="False" >
                        <ItemTemplate>
                            <asp:Label ID="lblID"  runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtID" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address">
                        <ItemTemplate>
                            <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ContactNo">
                        <ItemTemplate>
                            <asp:Label ID="lblContactNo" runat="server" Text='<%# Eval("ContactNo") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtContactNo" runat="server" Text='<%# Bind("ContactNo") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Age">
                        <ItemTemplate>
                            <asp:Label ID="lblAge" runat="server" Text='<%# Eval("Age") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gender">
                        <ItemTemplate>
                            <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGender" runat="server" Text='<%# Bind("Gender") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subject">
                        <ItemTemplate>
                            <asp:Label ID="lblSubject" runat="server" Text='<%# Eval("Subject") %>'></asp:Label>
                        </itemtemplate>
                        <edititemtemplate>
                            <asp:TextBox ID="txtSubject" runat="server" Text='<%# Bind("Subject") %>'></asp:TextBox>
                        </edititemtemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteRow"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                                CommandName="UpdateRow" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     
                   
                     



                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
        </div>
    </form>

 </body>
</html>
