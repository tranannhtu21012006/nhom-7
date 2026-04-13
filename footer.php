<footer class="footer">
    <div class="container">

        <div class="footer-item">
            <h4>SPORT NEWS</h4>
            <p>Trang tin thể thao cập nhật nhanh nhất</p>
        </div>

        <div class="footer-item">
            <h5>Liên hệ</h5>
            <p>Email: Webtintuc@gmail.com</p>
            <p>Hotline: 0123 456 789</p>
        </div>

        <div class="footer-item">
            <h5>Địa chỉ</h5>
            <p>TP.HCM, Việt Nam</p>
        </div>

    </div>
</footer>
<div id="loginModal" class="login-modal">

<div class="login-box">

<span class="close-btn"
onclick="closeLogin()">

×

</span>

<h4>Đăng nhập</h4>

<form method="POST"
action="index.php?action=handleLogin">

<input
type="text"
name="username"
placeholder="Username"
required>

<input
type="password"
name="password"
placeholder="Password"
required>

<button>
Đăng nhập
</button>

<br><br>

<a href="index.php?action=register">

Chưa có tài khoản?
Đăng ký

</a>

</form>

</div>

</div>

<script>

function openLogin()
{
    document
    .getElementById("loginModal")
    .style.display = "block";
}

function closeLogin()
{
    document
    .getElementById("loginModal")
    .style.display = "none";
}


window.onclick = function(event)
{
    var modal =
    document.getElementById("loginModal");

    if (event.target == modal)
    {
        modal.style.display = "none";
    }
}


document.addEventListener(
"keydown",
function(event)
{
    if (event.key === "Escape")
    {
        closeLogin();
    }
});

</script>
<?php if(isset($_GET['error'])): ?>

<script>

openLogin();

</script>

<?php endif; ?>

<script src="public/js/admin.js"></script>
</body>
</html>