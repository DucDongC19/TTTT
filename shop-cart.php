<?php include'header.php'; ?>
<?php 
$gio_hang = isset($_SESSION['gio-hang']) ? $_SESSION['gio-hang'] : [];

?>

 <?php if(tong_so_luong() > 0) : ?>
<section class="main-content-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="hienthisp">
                <h2 style="color: red;" class="page-title" align="center">Giỏ Hàng Của Bạn</h2>
            </div>  

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="table-responsive">
                    <form method="POST" action="">
                        <table class="table table-bordered" id="cart-summary">

                            <thead>
                                <tr>
                                    <th class="cart-product">Ảnh</th>
                                    <th class="cart-description">Thông Tin Sản Phẩm</th>
                                    <th class="cart-avail text-center">Giá</th>
                                    <th class="cart-unit text-right">Số Lượng</th>
                                    <th class="cart-delete"> Xóa</th>
                                    <th class="cart-total text-right">Thành Tiền</th>
                                </tr>
                            </thead>

                            <tbody> 

                                <?php 
                                foreach ($gio_hang as $gh) {
                                 ?>
                                 <tr>
                                    <td class="cart-product">
                                        <img width="100" alt="Blouse" src="uploads/<?php echo $gh['image']; ?>">
                                    </td>
                                    <td class="cart-description">
                                        <p class="product-name"><a href="#"><?php echo $gh['name']; ?></a></p>
                                    </td>
                                    <td class="cart-unit">
                                     <ul class="price text-right">
                                        <li class="price" style="color: red; font-weight: bold;"><?php echo number_format($gh['price']);  ?>:VNĐ</li>
                                    </ul>
                                </td>
                                <td class="cart-unit">
                                 <button type="button" class="update-item qty-minus" data-id="<?php echo $gh['id'];?>" ><span class="glyphicon glyphicon-minus"></span></button>
                                   <input  class="cart-plus-minus" name="quantity" width="30" value="<?php echo $gh['quantity']; ?>" id="quan-<?php echo $gh['id']; ?>">
                                    <button type="button" class="update-item qty-flus" data-id="<?php echo $gh['id'];?>"><span class="glyphicon glyphicon-plus"></span></button>
                               </td>
                               <td class="cart-delete text-center">
                                <span>
                                    <a href="xu-ly-gio-hang.php?id=<?php echo $gh['id'];?>&action=delete" class="cart_quantity_delete" onclick="return confirm('Bạn có chắc chắn muốn xóa không');"><i class="fa-solid fa-trash"></i></a>
                                </span>
                            </td>
                            <td class="cart-total">
                                <span class="price" id="pricett" style="color: red; font-weight: bold"><?php echo number_format($tong = ($gh['quantity'])*($gh['price']))  ?>:VNĐ</span>
                            </td>
                        </tr>
                <?php } ?>
            </tbody>
            <tfoot>     

                <tr> 
                <td class="total-price-container text-right" colspan="6">
                    <span>Tổng Tiền</span>
                </td>
                <td id="total-price-container" class="price" colspan="4">
                    <span id="total-price" style="color: red;font-weight: bold;"><?php echo number_format(tongtien()); ?>:VNĐ</span>
                </td>
            </tr>
        </tfoot>        

                                          
    </table>
</form>

</div>

</div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

<?php 
if ( !isset($_SESSION['name'])) { ?>
    <div class="returne-continue-shop">
        <a href="login-reg.php"  class="procedtocheckout" onclick="alert('Bạn cần đăng nhập để tiếp tục thanh toán')" >Thanh Toán Ngay<i class="fa fa-chevron-right"></i></a>
    </div>  

 <?php } else {  ?>
 <div class="returne-continue-shop">
        <a href="product.php" class="continueshoping"><i class="fa fa-chevron-left"></i>Tiếp Tục Mua Hàng</a>
        <a href="thanhtoan.php" class="procedtocheckout">Thanh Toán Ngay<i class="fa fa-chevron-right"></i></a>
    </div>  
  <?php } ?>

  
</div>

</div>
</div>
<?php else: ?>
    <span class="empty_cart">Chưa có sản phẩm trong giỏ hàng</span>
    <a href="index.php" class="continue">Tiếp tục</a>
</section>

<?php endif ?>

<?php include'footer.php'; ?>