<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        body{
            font-family:Verdana,sans-serif;margin:0;
        }
        *{box-sizing: border-box;}
        .row>.column{/*行>列时*/
            padding:0px;
        }
        .row:after{/*行元素的目的是保持列（column）元素不会溢出到其他行，
                    使用清除浮动的方法来确保行元素中的每个元素保持在行元素中。*/
            content:"";
            display:table;
            clear:both;
        }
        .column{
            float:left;
            width:25%;
        }
        /* 弹窗背景 */
        .modal{
            display:none;
            position:fixed;
            z-index: 1;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: black;
        }
        /* 弹窗内容 */
        .modal-content {
            position: relative;
            /*位置被设置为 relative 的元素，可将其移至相对于其正常位置的地方，
            因此 "left:20" 会将元素移至元素正常位置左边 20 个像素的位置*/
            background-color: #fefefe;
            margin: auto;
            padding: 0;
            width: 90%;
            max-width: 1200px;
        }
        /* 关闭按钮 */
        .close {
            color: white;
            position: absolute;
            top: 10px;
            right: 25px;
            font-size: 35px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: #999;
            text-decoration: none;
            cursor: pointer;
        }
        .mySlides {
            display: none;
        }
        .cursor {
            cursor: pointer
        }
        /* 上一页 & 下一页 按钮 */
        .prev,
        .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            margin-top: -50px;
            color: white;
            font-weight: bold;
            font-size: 20px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            user-select: none;
            -webkit-user-select: none;
        }
        /* 定位下一页按钮到右侧 */
        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }
        /* 鼠标移动上去修改背景色为黑色 */
        .prev:hover,
        .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }
        /* 页数(1/3 etc) */
        .numbertext {
            color: #f2f2f2;
            font-size: 12px;
            padding: 8px 12px;
            position: absolute;
            top: 0;
        }
        img {
            margin-bottom: -4px;
        }

        .caption-container {
            text-align: center;
            background-color: black;
            padding: 2px 16px;
            color: white;
        }
        .demo {
            opacity: 0.6;
        }

        .active,
        .demo:hover {
            opacity: 1;
        }

        img.hover-shadow {
            transition: 0.3s
        }

        .hover-shadow:hover {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)
        }



    </style>
</head>
<body>
       <h2 style="text-align:center">徐冷狗</h2>
<div class="row">
    <div class="column">
        <img src="../img/1.jpg" style="width:380px;height:235px;" onclick="openModal();
         currentSlide(1)" class="hover-shadow cursor">
    </div>
    <div class="column">
        <img src="../img/2.jpg" style="width:380px;height:235px;" onclick="openModal();
         currentSlide(2)" class="hover-shadow cursor">
    </div>
    <div class="column">
        <img src="../img/3.jpg" style="width:380px;height:235px;" onclick="openModal();
         currentSlide(3)" class="hover-shadow cursor">
    </div>
    <div class="column">
        <img src="../img/4.jpg" style="width:380px;height:235px;;" onclick="openModal();
         currentSlide(4)" class="hover-shadow cursor">
    </div>

</div>
<div id="myModal" class="modal">
    <span class="close cursor" onclick="closeModal()">&times;</span>
    <div class="modal-content">

    <div class="mySlides">
        <div class="numbertext">1/4</div>
        <img src="../img/1.jpg" style="width:100%;height:380px;">
    </div>
        <div class="mySlides">
            <div class="numbertext">1/4</div>
            <img src="../img/2.jpg" style="width:100%;height:380px;">
        </div>
        <div class="mySlides">
            <div class="numbertext">1/4</div>
            <img src="../img/3.jpg" style="width:100%;height:380px;">
        </div>
        <div class="mySlides">
            <div class="numbertext">1/4</div>
            <img src="../img/4.jpg" style="width:100%;height:380px;">
        </div>
        <a class="prev" onclick="plusSlides(-1)"> &#10094;</a>
        <a class="next" onclick="plusSlides(1)"> &#10095;</a>
        <div class="caption-container">
            <p id="caption"></p>
        </div>

        <div class="column">
            <img class="demo cursor" src="../img/1.jpg" style="width:100%"
                 onclick="currentSlide(1)" alt="Nature and sunrise">
        </div>
        <div class="column">
            <img class="demo cursor" src="../img/2.jpg" style="width:100%"
                 onclick="currentSlide(2)" alt="Trolltunga, Norway">
        </div>
        <div class="column">
            <img class="demo cursor" src="../img/3.jpg" style="width:100%"
                 onclick="currentSlide(3)" alt="Mountains and fjords">
        </div>
        <div class="column">
            <img class="demo cursor" src="../img/4.jpg" style="width:100%"
                 onclick="currentSlide(4)" alt="Northern Lights">
        </div>
</div>

</div>

</body>
</html>
<script>
    function openModal() {
        document.getElementById('myModal').style.display = "block";
    }

    function closeModal() {
        document.getElementById('myModal').style.display = "none";
    }

    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("demo");
        var captionText = document.getElementById("caption");
        if (n > slides.length) {slideIndex = 1}
        if (n < 1) {slideIndex = slides.length}
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex-1].style.display = "block";
        dots[slideIndex-1].className += " active";
        captionText.innerHTML = dots[slideIndex-1].alt;
    }
</script>
