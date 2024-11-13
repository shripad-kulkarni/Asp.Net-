<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GeneratePdf.aspx.cs" Inherits="Test_Application.GeneratePdf" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html>
<head>
    <title>Invoice</title>
    <style>
        /* Add your CSS styles for the invoice here */
        /* Example styles */
        body {
            font-family: Arial, sans-serif;
        }
        .invoice-header {
            text-align: center;
            margin-bottom: 20px;
        }
        /* Add more styles for other sections of the invoice */
    </style>
</head>
<body>
    <div class="invoice-header">
        <h1>Invoice</h1>
        <p>Invoice Number: #InvoiceNumber#</p>
        <p>Date: #InvoiceDate#</p>
        <!-- Add other details like customer information, items, totals, etc. -->
    </div>

    <!-- Add more sections and details as needed -->

</body>
</html>

