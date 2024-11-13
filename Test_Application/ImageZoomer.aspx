<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ImageZoomer.aspx.cs" Inherits="Test_Application.ImageZoomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <style>
* {box-sizing: border-box;}

.img-zoom-container {
  position: relative;
}

.img-zoom-lens {
  position: absolute;
  border: 1px solid #d4d4d4;
  /*set the size of the lens:*/
  width: 40px;
  height: 40px;
}

.img-zoom-result {
  border: 1px solid #d4d4d4;
  /*set the size of the result div:*/
  width: 600px;
  height: 600px;
}
</style>
<script>
    function imageZoom(imgID, resultID) {
        var img = document.getElementById(imgID);
        var result = document.getElementById(resultID);
        var lens;

        /* Create lens and insert it */
        lens = document.createElement("DIV");
        lens.setAttribute("class", "img-zoom-lens");
        img.parentElement.insertBefore(lens, img);

        /* Calculate the ratio between result DIV and lens */
        var cx = result.offsetWidth / lens.offsetWidth;
        var cy = result.offsetHeight / lens.offsetHeight;

        /* Set background properties for the result DIV */
        result.style.backgroundImage = "url('" + img.src + "')";
        result.style.backgroundSize = (img.width * cx) + "px " + (img.height * cy) + "px";

        /* Show the lens and result on mouseenter */
        img.addEventListener("mouseenter", function () {
            lens.style.display = "block";
            result.style.display = "block";
        });

        /* Hide the lens and result on mouseleave */
        img.addEventListener("mouseleave", function () {
            lens.style.display = "none";
            result.style.display = "none";
        });

        /* Move the lens and zoom result on mousemove */
        img.addEventListener("mousemove", moveLens);
        lens.addEventListener("mousemove", moveLens);
        img.addEventListener("touchmove", moveLens);
        lens.addEventListener("touchmove", moveLens);

        function moveLens(e) {
            var pos = getCursorPos(e);
            var x = pos.x - (lens.offsetWidth / 2);
            var y = pos.y - (lens.offsetHeight / 2);

            /* Prevent the lens from being positioned outside the image */
            if (x > img.width - lens.offsetWidth) { x = img.width - lens.offsetWidth; }
            if (x < 0) { x = 0; }
            if (y > img.height - lens.offsetHeight) { y = img.height - lens.offsetHeight; }
            if (y < 0) { y = 0; }

            /* Set the position of the lens */
            lens.style.left = x + "px";
            lens.style.top = y + "px";

            /* Display what the lens "sees" */
            result.style.backgroundPosition = "-" + (x * cx) + "px -" + (y * cy) + "px";
        }

        function getCursorPos(e) {
            var a = img.getBoundingClientRect();
            var x = e.clientX - a.left;
            var y = e.clientY - a.top;
            return { x: x, y: y };
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="img-zoom-container">
  <img id="myimage" src="Photo.jpg" width="300" height="240">
  <div id="myresult" class="img-zoom-result"></div>
</div>

   <script>
       // Initiate zoom effect:
       imageZoom("myimage", "myresult");
   </script>
</asp:Content>
