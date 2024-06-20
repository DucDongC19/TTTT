<?php 
session_start();
include'sql/card.funcion.php';
include'sql/connect.php';
$cats = mysqli_query($conn,"SELECT * FROM category"); 
$customer = mysqli_query($conn,"SELECT *FROM customer");
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Nội Thất MyHome</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="img/my home ico.jpg">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">	
    <link rel="stylesheet" href="css/nivo-slider.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">	
    <style type="text/css" media="screen">
        label {
            display: inline-block;
        }
        input[type="text"], input[type="password"] {
            display: inline-block;
            
        }
        label.error {
            display: inline-block;
            color:red;
            
        }
    </style>
    <script src="js/vendor/modernizr-2.6.2.min.js"></script>
</head>
<body class="index-2">
<!-- TOPMENU: -->
<div id="topmenu">
    <div class="topmenu_nav">
        <ul class="ul_nav">
            <?php
            if (isset($_SESSION["name"]))
            {
                ?>
                <li><a href="khachhang.php">Chào <?=$_SESSION["name"]?></a></li>
                <li><a href="logout.php">Đăng xuất</a></li>
                <?php
            }
            else
            {
                ?>
                <li><a href="register.php">Đăng ký</a></li>
                <li><a href="login-reg.php">Đăng nhập</a></li>
                <?php
            }
            ?>
        </ul>
    </div>
</div>

<section class="header-middle">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
            <!-- LOGO -->
                <div class="col-xs-12 col-sm-12 col-md-3 col-lg-2">
                    <div class="logo">
                        <a href="index.php"><img src="img/logo1.png" alt="myhome logo" /></a>
                    </div>
                </div>
                
                <div class="categorys-product-search">
                    <form action="search.php" method="GET" class="search-form-cat" >
                        <div class="search-product form-group">
                            <input type="text" class="form-control search-form" name="ten_sp" placeholder="Nhập Tên Sản Phẩm ... " required="" />
                            <button class="search-button" type="submit">
                                <i class="fa fa-search"></i>
                            </button>                             
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<header class="main-menu-area">
    <div class="container">
        <div class="row">
            <!-- SHOPPING-CART -->
            <?php 
            $gio_hang = isset($_SESSION['gio-hang']) ? $_SESSION['gio-hang'] : [];
            ?>
            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 pull-right shopingcartarea">
                <div class="shopping-cart-out pull-right">
                    <div class="shopping-cart">
                        <a class="shop-link" href="shop-cart.php" title="View my shopping cart">
                            <i class="fa fa-shopping-cart cart-icon"></i>
                            <b>Giỏ Hàng</b>
                            <span class="ajax-cart-quantity"><?php echo tong_so_luong();?></span>
                        </a>
                
                        <div class="shipping-cart-overly" id="cart-mini">
                            <?php foreach ($gio_hang as $gh) { ?>                            
                                <div class="shipping-item">
                                    <a href="xu-ly-gio-hang.php?id=<?php echo $gh['id'];?>&action=delete" class="cart_quantity_delete">   <span class="cross-icon"><i class="fa fa-times-circle"></i></span> </a> 
                                    <div class="shipping-item-image">
                                    <a href=""><img width="50px" src="uploads/<?php echo $gh['image']; ?>" alt="shopping image" /></a>
                                </div>

                                <div class="shipping-item-text">
                                    <span> <?php echo $gh['quantity']; ?><span class="pro-quan-x">x</span> <a href="#" class="pro-cat"><?php echo $gh['name']; ?></a></span>
                                    <span class="pro-quality"><a href="#"></a></span>
                                    <p><?php echo number_format($gh['price']); ?>VNĐ</p>
                                </div>
                            </div>
                            <?php }?>
                        
                            <div class="shipping-total-bill">
                                <div class="total-shipping-prices">
                                    <span class="shipping-total"><?php echo number_format(tongtien()); ?></span>
                                    <span>Tổng Tiền</span>
                                </div>                                      
                            </div>
                            <div class="shipping-checkout-btn">
                                <a href="thanhtoan.php">Thanh Toán Ngay <i class="fa fa-chevron-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  

            <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 no-padding-right menuarea">
                <div class="mainmenu">
                    <nav>
                        <ul class="list-inline mega-menu">
                            <li class="active"><a href="index.php">Trang Chủ</a></li>
                            <li><a href="product.php">Sản Phẩm</a>
                                <div class="drodown-mega-menu">
                                    <div class="left-mega col-xs-6">
                                        <?php 
                                        foreach ($cats as $cat) {
                                        ?>
                                        <div class="mega-menu-list">
                                            <a class="mega-menu-title" href="category.php?id=<?php echo $cat['id'] ?>""><?php echo $cat['name']; ?></a>
                                                
                                        </div>
                                        <?php  } ?>
                                    </div>
                                </div>
                            </li>

                            <li>
                                <a href="">Liên Hệ</a>

                            </li>
                            <li>
                                <a href="">Giới Thiệu</a>							
                            </li>
                            <li>
                                <a href="">Tin Tức</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12 mobile-menu-area">
                <div class="mobile-menu hidden-md hidden-lg" id="mob-menu">
                    <span class="mobile-menu-title">MENU</span>
                    <nav>
                        <ul>
                            <li><a href="index.php">Trang Chủ</a></li>   
                            <li><a href="product.php">Sản Phẩm</a>
                                <ul>
                                    <?php foreach ($cats as $cat) {
                                    ?>
                                    <li>
                                        
                                    <a href=""><?php echo $cat['name']; ?></a>
                                            
                                        </li>
                                    <?php } ?>
                                </ul>	

                            </li>

                            <li><a href="about.php">Giới Thiệu</a>

                            </li>
                            <li><a href="contact.php">Liên Hệ</a></li>
                            <li><a href="">Tin Tức</a></li>
                        </ul>
                    </nav>
                </div>						
            </div>
        </div>				
    </div>
</header>
