<?php $objlang = $this->registry->get('language');  $ourl = $this->registry->get('url');   ?>

<div class="product-block item-full clearfix" itemtype="http://schema.org/Product" itemscope>
  <div class="blog-img">
    <?php if ($product['thumb']) {    ?>      
      <div class="image"> 
        <?php if( $product['special'] ) {   ?>
          <span class="product-label sale"><span class="product-label-special"><?php echo $objlang->get('text_sale'); ?></span></span>
        <?php } ?>       
        <a class="img" itemprop="url" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>">        
          <img class="img-responsive" itemprop="image" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
        </a> 
      </div>
    <?php } ?>  
    <div id="item<?php echo $module; ?>countdown_<?php echo $product['product_id']; ?>" class="item-countdown clearfix"></div>
  </div>
  <div class="product-meta"> 

    <div class="header-deals top">     
      <h4 class="name" itemprop="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
      </h4>
      
      <div class="option clearfix">       
        <?php if ($product['price']) { ?>
        <div class="price pull-left" itemtype="http://schema.org/Offer" itemscope itemprop="offers">
          <?php if (!$product['special']) {  ?>
            <span class="price-new"><?php echo $product['price']; ?></span>
            <?php if( preg_match( '#(\d+).?(\d+)#',  $product['price'], $p ) ) { ?> 
            <meta content="<?php echo $p[0]; ?>" itemprop="price">
            <?php } ?>
          <?php } else { ?>
            <span class="price-new"><?php echo $product['special']; ?></span>
            <span class="price-old"><?php echo $product['price']; ?></span> 
            <?php if( preg_match( '#(\d+).?(\d+)#',  $product['special'], $p ) ) { ?> 
            <meta content="<?php echo $p[0]; ?>" itemprop="price">
            <?php } ?>

          <?php } ?>
          <meta content="<?php // echo $this->currency->getCode(); ?>" itemprop="priceCurrency">
        </div>
        <?php } ?>

        <?php if ( isset($product['rating']) ) { ?>
          <div class="rating pull-right">
            <?php for ($is = 1; $is <= 5; $is++) { ?>
            <?php if ($product['rating'] < $is) { ?>
            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
            <?php } else { ?>
            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i>
            </span>
            <?php } ?>
            <?php } ?>
          </div>
        <?php } ?>
      </div>
      <div class="clearfix"></div>
      <?php if( isset($product['description']) ){ ?> 
      <div class="description" itemprop="description"><?php echo utf8_substr( strip_tags($product['description']),0,500);?>...</div>
      <?php } ?> 
    </div>
    <div class="footer-deals clearfix">      
      <div class="action text-center">
        <div class="wishlist">
          <button class="btn btn-default btn-outline" type="button" data-toggle="tooltip" data-placement="top" title="<?php echo $objlang->get("button_wishlist"); ?>" onclick="wishlist.addwishlist('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i></button> 
        </div>
        <?php if( !isset($listingConfig['catalog_mode']) || !$listingConfig['catalog_mode'] ) { ?>
          <div class="cart">            
            <button data-loading-text="Loading..." class="btn btn-primary btn-outline" type="button" onclick="cart.addcart('<?php echo $product['product_id']; ?>');">
            <i class="fa fa-shopping-cart"></i>
            <span><?php echo $objlang->get('button_cart'); ?></span>
            </button>
          </div>
        <?php } ?>
        <div class="compare">     
          <button class="btn btn-default btn-outline" type="button" data-toggle="tooltip" data-placement="top" title="<?php echo $objlang->get("button_compare"); ?>" onclick="compare.addcompare('<?php echo $product['product_id']; ?>');"><i class="fa fa-refresh"></i></button> 
        </div>              
      </div>      
    </div>
  </div>  
</div>

<script type="text/javascript">
  jQuery(document).ready(function($){
    $("#item<?php echo $module; ?>countdown_<?php echo $product['product_id']; ?>").lofCountDown({
      formatStyle:2,
      TargetDate:"<?php echo date('m/d/Y G:i:s', strtotime($product['date_end_string'])); ?>",
      DisplayFormat:"<ul class='list-inline'><li>%%D%% <span><?php echo $objlang->get("text_days");?></span></li><li> %%H%% <span><?php echo $objlang->get("text_hours");?></span></li><li> %%M%% <span><?php echo $objlang->get("text_minutes");?></span></li><li> %%S%% <span><?php echo $objlang->get("text_seconds");?></span></li></ul>",
      FinishMessage: "<?php echo $objlang->get('text_finish');?>"
    });
  });
</script>





