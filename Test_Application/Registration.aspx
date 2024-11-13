<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Test_Application.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="card">
            <div class="card-header">
                <h3>Registration Form</h3>
            </div>
            <div class="card-body">
                <asp:Label Text="ID" visible="false" runat="server"></asp:Label>
                <asp:TextBox ID="ID" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                
                <div class="form-group">
                    <label for="Name">Name</label>
                    <asp:TextBox ID="Name" runat="server" CssClass="form-control" placeholder="Enter your name"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="Address">Address</label>
                    <asp:TextBox ID="Address" runat="server" CssClass="form-control" placeholder="Enter your address"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="ContactNo">Contact No</label>
                    <asp:TextBox ID="ContactNo" runat="server" CssClass="form-control" placeholder="Enter your contact number"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="Age">Age</label>
                    <asp:TextBox ID="Age" runat="server" CssClass="form-control" placeholder="Enter your age"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="GenderRadioButtonList">Gender</label>
                    <asp:RadioButtonList ID="GenderRadioButtonList" runat="server" RepeatDirection="Horizontal" CssClass="form-control">
                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                        <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>

                <div class="form-group">
                    <label for="SubjectDropDownList">Subject List</label>
                    <asp:DropDownList ID="SubjectDropDownList" runat="server" CssClass="form-control">
                        <asp:ListItem Text="C" Value="C"></asp:ListItem>
                        <asp:ListItem Text="C#" Value="C#"></asp:ListItem>
                        <asp:ListItem Text="C++" Value="C++"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <asp:Button ID="ButtonSave" Text="Save" OnClick="Button_Click" runat="server" CssClass="btn btn-primary" />
                    <asp:Button ID="ButtonUpdate" Visible="false" Text="Update" OnClick="ButtonUpdateClick" runat="server" CssClass="btn btn-secondary" />
                    <asp:Button ID="ButtonNextPage" runat="server" Text="Next Page" OnClick="NextPage" CssClass="btn btn-info" />
                </div>
            </div>
        </div>

    <div class="card">
            <div class="card-header">
                 <h2>User Information Form using GridView</h2>
            </div>
            <div class="card-body">
                <asp:GridView ID="GridViewUserInfo" runat="server" OnRowDataBound="GridViewUserInfo_RowDataBound"
      OnRowCommand="GridViewUserInfo_DeleteRow"
    AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="653px"  >
    <AlternatingRowStyle BackColor="White" />
    <Columns>

        <asp:TemplateField HeaderText="ID" Visible="False" >
            <ItemTemplate>
                <asp:Label ID="lblID"  runat="server" Text='<%# Eval("Registration_ID") %>'></asp:Label>
            </ItemTemplate>
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
                <asp:Label ID="lblContactNo" runat="server" Text='<%# Eval("Contact") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtContactNo" runat="server" Text='<%# Bind("Contact") %>'></asp:TextBox>
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
        </div>
   

</asp:Content>
