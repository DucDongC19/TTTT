<?php include 'header.php'; ?>
<?php include 'sql/connect.php'; ?>
<?php 
    $gio_hang = isset($_SESSION['gio-hang']) ? $_SESSION['gio-hang'] : [];

?>
<?php 
    $id = $_GET['id'];
    $p = mysqli_query($conn,"SELECT * FROM product WHERE id = $id");
    $ctsp = mysqli_fetch_assoc($p);
    $idc = $ctsp['category_id'];
    $anh = mysqli_query($conn,"SELECT * FROM pro_img WHERE pro_id = $id");
?>

<div id="tz-wp-content" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

    <div id="tz-shop-content" class="row">
        <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
            <div id="slider" class="flexslider">
                <ul class="slides">
                    <?php foreach ($anh as $a) {
                        
                        ?>
                    <li>
                        <img src="uploads/<?php echo $a['link']; ?>" alt=""/>
                    </li>

                    <?php } ?>
                </ul>
            </div>
            <div id="carousel">
                <ul class="slides">
                    <?php foreach ($anh as $anhcon) {
                        
                    ?>
                    
                        <li>
                        <img src="uploads/<?php echo $anhcon['link'];  ?>" />
                    </li>
                <?php } ?>
                    
                </ul>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="tzshop-summary">
                <h3><?php echo $ctsp['name']; ?></h3>
                <span class="tzproduct-single-price">
                
                <?php if ($ctsp['sale_price'] > 0) {
                echo number_format($ctsp ['sale_price']);
                }else{
                echo number_format($ctsp['Price']);
                } ?> <sup> đ</sup>
                </span>
                
                <span class="tz-shop-detail-meta">
                    <a class="tzshopping add-cart" href="xu-ly-gio-hang.php?id=<?php echo $ctsp['id'];?>&action=add">
                        <i class="fa fa-shopping-cart" onclick="alert('Thêm vào giỏ hàng thành công')"></i>

                    </a>
                        Thêm Vào Giỏ Hàng
                </span>

                <p>
                    <?php echo $ctsp['content']; ?>
                </p>
                <?php 
                foreach ($gio_hang as $gh) {
                    ?>
                <div class="tzqty">
                    <div class="single-product-quantity">
                        <p class="small-title">Số Lượng</p> 
                        <div class="cart-quantity">
                        <button type="button" class="update-item qty-minus" data-id="<?php echo $gh['id'];?>" ><span class="glyphicon glyphicon-minus"></span></button>
                    <input  class="cart-plus-minus" name="quantity" width="30" value="<?php echo $gh['quantity']; ?>" id="quan-<?php echo $gh['id']; ?>">
                    <button type="button" class="update-item qty-flus" data-id="<?php echo $gh['id'];?>"><span class="glyphicon glyphicon-plus"></span></button>
                        </div>
                    </div>
                </div>
                <?php } ?>
                    
            </div>
        </div>
    </div>
            
</div>


<?php include'footer.php'; ?>