<?php include'sql/connect.php'; ?>
<!-- LEFT-SIDEBAR START -->
<?php 
    $cats =   mysqli_query($conn,"SELECT c.id,c.name FROM category c LEFT JOIN product p on c.id = p.category_id WHERE c.status = 1
    GROUP BY c.id,c.name,p.category_id");
    ?>
    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 hidden-xs">
    
    <div class="left-category-menu">
        <div class="left-product-cat">
            <div class="category-heading">
                <h2>Danh Mục Sản Phẩm</h2>
            </div>
          
            <div class="category-menu-list">
                <ul>
                    <?php 
                    foreach ($cats as $cat) {
                        
                    ?>
                    <li>
                        <a href="category.php?id=<?php echo $cat['id'] ?>"><i class="fa-solid fa-angle-right"></i><?php echo $cat['name'];?></a>
                        
                    </li>
                        <?php } ?>
                </ul>
            </div>
        </div>
    </div>    
</div>