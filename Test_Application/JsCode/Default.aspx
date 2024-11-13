<%--<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Test_Application.JsCode.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
    <script>
        let data = [];

        function addRow() {
            const name = document.getElementById('name').value;
            const age = document.getElementById('age').value;

            if (name && age) {
                data.push({ name: name, age: age, selected: false });
                renderTable();
                clearInputs();
            } else {
                alert('Please enter both name and age.');
            }
        }

        function renderTable() {
            const table = document.getElementById('dataTable');
            table.innerHTML = '';

            data.forEach((row, index) => {
                const newRow = table.insertRow();

                const checkboxCell = newRow.insertCell(0);
                checkboxCell.innerHTML = `<input type="checkbox" ${row.selected ? 'checked' : ''} onchange="toggleSelect(${index})">`;

                const nameCell = newRow.insertCell(1);
                nameCell.innerHTML = row.name;

                const ageCell = newRow.insertCell(2);
                ageCell.innerHTML = row.age;

                const deleteCell = newRow.insertCell(3);
                deleteCell.innerHTML = `<button onclick="deleteRow(${index})">Delete</button>`;
            });
        }

        function toggleSelect(index) {
            data[index].selected = !data[index].selected;
        }

        function deleteSelectedRows() {
            data = data.filter(row => !row.selected);
            renderTable();
        }

        function deleteRow(index) {
            data.splice(index, 1);
            renderTable();
        }

        function clearInputs() {
            document.getElementById('name').value = '';
            document.getElementById('age').value = '';
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <input type="text" id="name" placeholder="Enter name" />
        <input type="text" id="age" placeholder="Enter age" />
        <button type="button" onclick="addRow()">Add Row</button>
        <button type="button" onclick="deleteSelectedRows()">Delete Selected Rows</button>
        <br /><br />
        <table>
            <thead>
                <tr>
                    <th>Select</th>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="dataTable"></tbody>
        </table>
    </div>
</asp:Content>--%>


<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Test_Application.JsCode.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 16px;
        }
        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 16px;
            width: calc(33% - 32px);
            box-sizing: border-box;
            position: relative;
        }
        .card h3 {
            margin-top: 0;
        }
        .card .actions {
            position: absolute;
            bottom: 16px;
            right: 16px;
        }
        .card input[type="checkbox"] {
            margin-right: 8px;
        }
        .card-label {
            margin-right: 8px;
        }
        .summary {
            margin-top: 16px;
            font-weight: bold;
        }
        /* Modal Styles */
        .modal {
            display: none; 
            position: fixed; 
            z-index: 1; 
            left: 0;
            top: 0;
            width: 100%; 
            height: 100%; 
            overflow: auto; 
            background-color: rgba(0,0,0,0.4); 
            padding-top: 60px; 
        }
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto; 
            padding: 20px;
            border: 1px solid #888;
            width: 80%; 
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <input type="text" id="productName" placeholder="Enter product name" />
        <input type="text" id="price" placeholder="Enter price" />
        <label>
            <input type="checkbox" id="inStock" />
            In Stock
        </label>
        <button type="button" onclick="addProduct()">Add Product</button>
        <button type="button" onclick="deleteSelectedProducts()">Delete Selected Products</button>
        <button type="button" onclick="saveOrder()">Save Order</button>
        <br /><br />
        <div id="cardContainer" class="card-container"></div>
        <div id="summary" class="summary">Total Price of Selected Products: $0.00</div>
    </div>
    
    <!-- Modal -->
    <div id="orderModal" class="modal">
        <div class="modal-content" id="modalContent">
            <span class="close" onclick="closeModal()">&times;</span>
            <!-- Content will be dynamically inserted here -->
        </div>
    </div>

    <script>
        let products = [];

        function addProduct() {
            const productName = document.getElementById('productName').value;
            const price = parseFloat(document.getElementById('price').value);
            const inStock = document.getElementById('inStock').checked;

            if (productName && !isNaN(price)) {
                products.push({ productName: productName, price: price, inStock: inStock, selected: false });
                renderCards();
                clearInputs();
            } else {
                alert('Please enter both product name and a valid price.');
            }
        }

        function renderCards() {
            const container = document.getElementById('cardContainer');
            container.innerHTML = '';

            products.forEach((product, index) => {
                const card = document.createElement('div');
                card.className = 'card';

                card.innerHTML = `
                    <input type="checkbox" ${product.selected ? 'checked' : ''} onchange="toggleSelect(${index})">
                    <span class="card-label">Select</span>
                    <h3>${product.productName}</h3>
                    <p><strong>Price:</strong> $${product.price.toFixed(2)}</p>
                    <p><strong>In Stock:</strong> ${product.inStock ? 'Yes' : 'No'}</p>
                    <div class="actions">
                        <button onclick="deleteProduct(${index})">Delete</button>
                    </div>
                `;

                container.appendChild(card);
            });

            updateSummary();
        }

        function toggleSelect(index) {
            products[index].selected = !products[index].selected;
            updateSummary();
        }

        function deleteSelectedProducts() {
            products = products.filter(product => !product.selected);
            renderCards();
        }

        function deleteProduct(index) {
            products.splice(index, 1);
            renderCards();
        }

        function updateSummary() {
            const totalPrice = products
                .filter(product => product.selected)
                .reduce((sum, product) => sum + product.price, 0);

            const summary = document.getElementById('summary');
            summary.innerHTML = `Total Price of Selected Products: $${totalPrice.toFixed(2)}`;
        }

        function clearInputs() {
            document.getElementById('productName').value = '';
            document.getElementById('price').value = '';
            document.getElementById('inStock').checked = false;
        }

        function saveOrder() {
            const selectedProducts = products.filter(product => product.selected);
            if (selectedProducts.length > 0) {
                const modal = document.getElementById('orderModal');
                const modalContent = document.getElementById('modalContent');
                const orderList = document.createElement('ul');
                const totalPrice = selectedProducts.reduce((sum, product) => sum + product.price, 0).toFixed(2);

                if (modalContent) {
                    orderList.innerHTML = selectedProducts.map(product => `
                        <li>${product.productName} - $${product.price.toFixed(2)}</li>
                    `).join('');

                    modalContent.innerHTML = `
                        <span class="close" onclick="closeModal()">&times;</span>
                        <h2>Order Summary</h2>
                    `;
                    modalContent.appendChild(orderList);
                    modalContent.innerHTML += `<p><strong>Total Price:</strong> $${totalPrice}</p>`;

                    modal.style.display = 'block';
                } else {
                    console.error('Modal content not found.');
                }
            } else {
                alert('No products selected for the order.');
            }
        }

        function closeModal() {
            document.getElementById('orderModal').style.display = 'none';
        }
    </script>
</asp:Content>

