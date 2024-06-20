<?php 
    ob_start(); 
    include'header.php';
?>

<?php
    if (isset($_POST['dangnhap'])) {
        $email = $_POST['email'];
        $password =$_POST['password'];
        $password = md5($password);
        //Kiểm tra tên đăng nhập có tồn tại không
        
        $query = mysqli_query($conn,"SELECT * FROM customer WHERE email='$email' AND password = '$password'");
        if (mysqli_num_rows($query) == 0) {
            echo '<script language="javascript">alert("Tên Đăng Nhập Không Tồn Tại Vui Lòng Thử Lại");
            window.location="login-reg.php";</script>';
            exit;
        }
        
        //Lấy mật khẩu trong database ra
        $row = mysqli_fetch_array($query);
        
        //So sánh 2 mật khẩu có trùng khớp hay không
        if ($password != $row['password']) {
            echo '<script language="javascript">alert("Mật Khẩu Không Đúng");
                window.location="login-reg.php";</script>';
        }
        $_SESSION['id'] = $row['id'];
        $_SESSION['name'] = $row['name'];
        $_SESSION['email'] = $row['email'];
        $_SESSION['phone'] = $row['phone'];
        $_SESSION['address'] = $row['address'];
        $_SESSION['birthday'] = $row['birthday'];
        $_SESSION['gender'] = $row['gender'];
        header('location: index.php');
    
    }
?>

<section class="tzlogin-wrap">
    <div class="container">
        <div class="login-form">
            
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <h3 class="tz-title-bold-5">Đăng Nhập</h3>

                <form id="tzlogin" class="shopform" method="POST">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <label>Email </label>
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                            <input type="email" name="email" value="">
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <label>Mật Khẩu </label>
                        </div>

                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                            <input type="password" name="password" value="">
                        </div>
                    </div>

                    <div class="submit-form">
                        <button type="submit" name="dangnhap"><span>Đăng Nhập</span></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
   
<?php include'footer.php'; ?>