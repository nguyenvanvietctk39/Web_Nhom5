function TopNavClick() {
    var x = document.getElementById("Topnav");
    if (x.className === "navbar") {
        x.className += " responsive";
    } else {
        x.className = "navbar";
    }
}
var Modaldangnhap = document.getElementById('modaldangnhap');
window.onclick = function (event) {
    if (event.target == Modaldangnhap) {
        Modaldangnhap.style.display = "none";
    }
}

var slideIndex = 0;
$(document).ready(function number() {
    showSlides(slideIndex);
    slideIndex++;
    setTimeout(number, 3000);//7000=7giay
});

function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("myslide");    
    if (n > slides.length) {
        slideIndex = 1;
    }
    if (n < 1) {
        slideIndex = slides.length
    }
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    if (slideIndex > slides.length) {
        slideIndex = 1;
    }
    slides[slideIndex - 1].style.display = "block";    
}
function prevAndnextSlide(n) {
    showSlides(slideIndex += n);
}
$('#modaldangnhap').keypress(function (event) {
    var keycode = (event.keyCode ? event.keyCode : event.which);
    if (keycode == '13') {
        Login();
    }
});
$("#msg").hide();
function Login() {
    var data = $("#loginForm").serialize();
    $.ajax({
        type: "get",
        url: "/Login/DangNhap",
        data: data,
        success: function (result) {
            if (result == "Fail") {
                $("#loginForm")[0].reset();
                $("#msg").show();
            }
            else {
                window.location.reload();
            }

        }
    })
}