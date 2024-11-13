<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registration2.aspx.cs" Inherits="Test_Application.Registration2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Insert Data using AJAX in ASP.NET</title>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
     <div class="container mt-5">
        <div class="card">
            <div class="card-header">
                <h3>Registration Form</h3>
            </div>
            <div class="card-body">
                <input type="hidden" id="ID" class="form-control">
                
                <div class="form-group">
                    <label for="Name">Name</label>
                    <input type="text" id="Name" class="form-control" placeholder="Enter your name">
                </div>

                <div class="form-group">
                    <label for="Address">Address</label>
                    <input type="text" id="Address" class="form-control" placeholder="Enter your address">
                </div>

                <div class="form-group">
                    <label for="ContactNo">Contact No</label>
                    <input type="text" id="ContactNo" class="form-control" placeholder="Enter your contact number">
                </div>

                <div class="form-group">
                    <label for="Age">Age</label>
                    <input type="text" id="Age" class="form-control" placeholder="Enter your age">
                </div>

                <div class="form-group">
                    <label for="GenderRadioButtonList">Gender</label>
                    <div id="GenderRadioButtonList" class="form-control">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="Gender" id="GenderMale" value="Male">
                            <label class="form-check-label" for="GenderMale">Male</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="Gender" id="GenderFemale" value="Female">
                            <label class="form-check-label" for="GenderFemale">Female</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="Gender" id="GenderOther" value="Other">
                            <label class="form-check-label" for="GenderOther">Other</label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="SubjectDropDownList">Subject List</label>
                    <select id="SubjectDropDownList" class="form-control">
                        <option value="C">C</option>
                        <option value="C#">C#</option>
                        <option value="C++">C++</option>
                    </select>
                </div>

                <div class="form-group">
                    <button id="Button_Save" class="btn btn-primary" onclick="loadData();">Save</button>
                    <button id="ButtonUpdate" class="btn btn-secondary" style="display: none;">Update</button>
                    <button id="ButtonNextPage" class="btn btn-info">Next Page</button>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
             <h2>User Information </h2>
        </div>
        <div class="card-body">

     <div id="dataContainer"></div>

            </div>
        </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <script type="text/javascript">
         function loadData() {
             var userDataList = [];

             // Collecting data (example with one user, adjust as needed)
             <%--var userData = {
                 Name: $('#<%= Name.ClientID %>').val(),
                 Address: $('#<%= Address.ClientID %>').val(),
                 ContactNo: $('#<%= ContactNo.ClientID %>').val(),
                 Age: $('#<%= Age.ClientID %>').val(),
                  
             };--%>

             <%--var Name = $('#<%= Name.ClientID %>').val();
             var Address = $('#<%= Address.ClientID %>').val();
            var  ContactNo = $('#<%= ContactNo.ClientID %>').val();
            var Age = $('#<%= Age.ClientID %>').val();--%>

             var name = $('#Name').val();
             var address = $('#Address').val();
             var contactNo = $('#ContactNo').val();
             var age = $('#Age').val();
             var gender = $('input[name=GenderRadioButtonList]:checked').val();
             var subject = $('#SubjectDropDownList').val();

            /* userDataList.push(userData);*/

             $.ajax({
                 type: "POST",
                 url: "Registration2.aspx/InsertData",
                 data: '{Name: "' + name + '",Address: "' + address + '",Contact: "' + contactNo + '",Age: "' + age + '" }',
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (response) {
                     toastr.success('Data Saved successfully');
                     fetchData();
                 },
                 error: function (xhr, status, error) {
                     alert('Error saving data: ' + error);
                 }
             });

             return false; // Prevent the default form submission
         }

         $(document).ready(function () {
             fetchData(); // Call fetchData on page load

             
         });

         function fetchData() {
             $.ajax({
                 type: "POST",
                 url: "Registration2.aspx/GetData",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (response) {
                     var dataTable = response.d;
                     var tableHtml = "<table class='table table-bordered'><thead><tr>";
                     tableHtml += "<th>Name</th><th>Address</th><th>Contact No</th><th>Age</th><th>Gender</th><th>Subject</th></tr></thead><tbody>";

                     $.each(dataTable, function (index, item) {
                         tableHtml += "<tr>" +
                             "<td>" + item.Name + "</td>" +
                             "<td>" + item.Address + "</td>" +
                             "<td>" + item.ContactNo + "</td>" +
                             "<td>" + item.Age + "</td>" +
                             "<td>" + item.Gender + "</td>" +
                             "<td>" + item.Subject + "</td>" +
                             "<td><button class='btn btn-primary' onclick='editRow(" + index + ")'>Edit</button></td>" +
                             "</tr>";
                     });

                     tableHtml += "</tbody></table>";
                     $('#dataContainer').html(tableHtml);
                 },
                 error: function (xhr, status, error) {
                     alert('Error fetching data: ' + error);
                 }
             });
         }

         function editRow(index) {
             // You can fetch the row data from the server or directly use the data in the table
             // Assuming dataTable is still available globally
             var row = dataTable[index]; // Adjust this if dataTable is not available globally

             // Populate the form with the row data
             $('#Name').val(row.Name);
             $('#Address').val(row.Address);
             $('#ContactNo').val(row.ContactNo);
             $('#Age').val(row.Age);
             $('input[name=GenderRadioButtonList][value=' + row.Gender + ']').prop('checked', true);
             $('#SubjectDropDownList').val(row.Subject);

             // Set a hidden field or similar to indicate which row is being edited
             $('#editIndex').val(index);
         }
     </script>

</asp:Content>
