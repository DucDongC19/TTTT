<section class="header-bottom-area">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <?php 
        $banner = mysqli_query($conn,"SELECT  name,link,image FROM banner WHERE status = 1 ORDER BY order_link ASC");

        ?>
        <div class="main-slider-area">
            <div class="slider-area">
                <div id="wrapper">
                    <div class="slider-wrapper">
                        <div id="mainSlider" class="nivoSlider">
                            <?php foreach ($banner as$c => $ban) {
                            ?>
                            <img src="uploads/<?php echo $ban['image']; ?>" alt="main slider" class="<?php if($c==0) echo'active' ?>"/>
                        <?php } ?>
                        </div>
                    </div>
                </div>                              
            </div>                                          
        </div>  
    </div>              
</section>