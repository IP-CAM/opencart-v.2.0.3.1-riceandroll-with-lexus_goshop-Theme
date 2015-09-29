<?php $objlang = $this->registry->get('language');  $ourl = $this->registry->get('url');   ?>



<div class="product-block item-default clearfix" itemtype="http://schema.org/Product" itemscope> 
    <div class="blog-img">
    <?php if ($product['thumb']) {    ?>
      
      <div class="image">
        <?php if( $product['special'] ) {   ?>
          <span class="product-label sale"><span class="product-label-special"><?php echo $objlang->get('text_sale'); ?></span></span>
        <?php } ?>
        <a class="img" itemprop="url" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>">
          <center>
            <img class="img-responsive" itemprop="image" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
          </center>
        </a> 
        <!-- quickview image-->
        <?php if ( isset($quickview) && $quickview ) { ?>
          <a class="quickview iframe-link btn btn-default btn-outline" href="<?php echo $ourl->link('themecontrol/product','product_id='.$product['product_id']);?>" title="<?php echo $objlang->get('quick_view'); ?>">
            <i class="fa fa-eye"></i>
          </a>
        <?php } ?>       
        <!-- zoom image-->
        <?php if( isset($categoryPzoom) && $categoryPzoom ) { $zimage = str_replace( "cache/","", preg_replace("#-\d+x\d+#", "",  $product['thumb'] ));  ?>
          <a data-toggle="tooltip" data-placement="top" href="<?php echo $zimage;?>" class="product-zoom btn btn-default btn-outline" title="<?php echo $product['name']; ?>"><i class="fa fa-search-plus"></i></a>
        <?php } ?>        
      </div>
    <?php } ?>    
  </div>
  <div class="product-meta">  
    <div class="top">   
      <h4 class="name" itemprop="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>

      <div class="option">
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
    <div class="clearfix"></div>
    <div class="action text-center">
      <!--

      WISHLIST

      <div class="wishlist">
        <button class="btn btn-default btn-outline" type="button" data-toggle="tooltip" data-placement="top" title="
        <?php //echo $objlang->get("button_wishlist"); ?>" onclick="wishlist.addwishlist('<?php //echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i></button> 
      </div>

      COMPARE

      <div class="compare">     
        <button class="btn btn-default btn-outline" type="button" data-toggle="tooltip" data-placement="top" title="
        <?php //echo $objlang->get("button_compare"); ?>" onclick="compare.addcompare('<?php //echo $product['product_id']; ?>');"><i class="fa fa-refresh"></i></button> 
      </div> 
      -->
      
      <?php if( !isset($listingConfig['catalog_mode']) || !$listingConfig['catalog_mode'] ) { ?>
        <div class="cart">            
          <button data-loading-text="Loading..." class="btn btn-primary btn-outline" type="button" onclick="cart.addcart('<?php echo $product['product_id']; ?>');">
            <i class="fa fa-shopping-cart"></i> 
            <span><?php echo $objlang->get('button_cart'); ?></span>
          </button>
        </div>
      <?php } ?>              
          
    </div>
      
  </div>  
</div>





