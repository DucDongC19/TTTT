<?php include('header.php');
      include('sql/connect.php');

?>
<?php include('slider.php');?>

<section class="main-content-section">
    <div class="container">
        <div class="row">
            <?php 
                $newProduct =   mysqli_query($conn,"SELECT * FROM product Where status = 1 ORDER BY created DESC LIMIT 6");
            ?>
            <div class="col-xs-12">
                <div class="row">
                    <div class="left-title-area">
                        <h2 class="left-title">Sản Phẩm Nổi Bật</h2>
                    </div>
                    <?php foreach ($newProduct as $pronp) {?>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 laster-shop-item">
                            <div class="laster-thumb">
                                <img src="uploads/<?php echo $pronp['image'] ?>">
                                <span class="tz-shop-meta">
                                    <a href="chitietsp.php?id=<?php echo $pronp['id']; ?>" class="tzheart">
                                    <i class="fa-solid fa-eye"></i>
                                    </a>
                                    <a href="xu-ly-gio-hang.php?id=<?php echo $pronp['id'];?>&action=add" class="tzshopping add-cart">
                                        <i class="fa fa-shopping-cart" onclick="alert('Thêm vào giỏ hàng thành công')"></i>
                                    </a>
                                </span> 
                            </div>
                            <h6><a href=""><?php echo $pronp['name'];   ?></a></h6>
                            <small ><?php echo number_format($pronp['price']);  ?> <sup> đ</sup> </small>
                        </div>
                    <?php  } 
                    ?>
                </div>
            </div>
        </div>
    </div>
</section>	        

<section class="main-content-section-full-column">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="featured-products-area">
                    <div class="left-title-area">
                        <h2 class="left-title">Sản Phẩm Khuyến Mãi</h2>
                    </div>
                    <?php 
                        $productnb = mysqli_query($conn,"SELECT * FROM product WHERE status = 1 AND sale_price > 0 ORDER BY created LIMIT 9");
                    ?>
                    <div class="row" style="margin-bottom: 50px;">
                        <?php foreach ($productnb as $np) {
                            ?>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 laster-shop-item">
                                <div class="laster-thumb">
                                    <img src="uploads/<?php echo $np['image'] ?>">
                                    <?php if ($np['sale_price'] > 0)  :?>
                                    <?php endif; ?>
                                    <span class="tz-shop-meta">
                                        <a href="chitietsp.php?id=<?php echo $np['id']; ?>" class="tzheart">
                                            <i class="fa-solid fa-eye"></i>
                                        </a>
                                        <a href="xu-ly-gio-hang.php?id=<?php echo $np['id'];?>&action=add" class="tzshopping add-cart">
                                            <i class="fa fa-shopping-cart"></i>
                                        </a>
                                    </span>
                                </div>
                                <h6><a href=""><?php echo $np['name']; ?></a></h6>
                                <?php if ($np['sale_price'] > 0) :  ?>                             
                                
                                <small>
                                    <em><?php echo number_format($np['price']); ?><sup> đ</sup></em>
                                    <?php echo number_format($np['sale_price']); ?> <sup> đ</sup>
                                </small>
                                    <?php else: ?>
                                        <small><?php echo number_format($np['price']); ?><sup> đ</sup></small>
                                    <?php endif; ?>
                            </div>
                        <?php  } ?>

                    </div>
                
            </div>						
        </div>
    </div>
</section>

<?php include'footer.php'; ?>

