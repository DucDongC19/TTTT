<?php include'header.php'; ?>
            <section class="main-content-section">
                <div class="container">
                    <div class="row">
                        <?php include('left.php'); ?>
                    
                    
                    <?php 
                    $qr =  mysqli_query($conn,"SELECT * FROM product Where status = 1 ORDER BY created DESC ");
                    $total = mysqli_num_rows($qr);
                    $show = 6;
                   
                    $total_page = ceil($total/$show);
                    $pageht = isset($_GET['page']) ? $_GET['page'] : 1;
                    if ($pageht >  $total_page) {
                         $pageht = $total_page;
                      
                     }
                     $start = ($pageht-1)*$show;
                     
                     
                    $next = $pageht <  $total_page ?  $pageht +1 : $total_page;
                    $prev = $pageht >  1 ?  $pageht - 1 :1;
                  $newProduct =mysqli_query($conn,"SELECT * FROM product Where status = 1 ORDER BY created DESC LIMIT $start, $show");
                     ?>

    

                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12" >
                                <div class="row">
                                    <div class="left-title-area">
                                <h2 class="left-title">Tất Cả Sản Phẩm</h2>
                            </div>
                            <?php foreach ($newProduct as $pronp) {
                                                            ?>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 laster-shop-item" >
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
                            <h6><a href=""><?php echo $pronp['name']; ?></a></h6>
                            <small style="color: red"><?php echo number_format($pronp['price']);  ?><sup> đ</sup> </small>
                        </div>
                        <?php  } ?>
                    </div>
                </div>
                </div>

            </div> 
            <div class="chantrang" align="center">
                <ul class="pagination">
                <li><a href="?page=<?php echo $prev; ?>">&laquo;</a></li>
                <?php for ($i = 1; $i <= $total_page; $i++) :
                    $class_active = ($i == $pageht) ? ' class="active"' : '';
                 ?>
                <li <?php echo $class_active; ?>><a href="?page=<?php echo $i; ?>"><?php echo $i; ?></a></li>
                
                <?php endfor ?>
                <li><a href="?page=<?php echo $next; ?>">&raquo;</a></li>
            </ul>
            </div>
    </section>


<?php include'footer.php'; ?>