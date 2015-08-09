<?php 

$gcol = floor(12/$cols);
$module = rand(0,9);
$ourl = $this->registry->get('url');
$config = $this->registry->get('config'); 
$themeConfig = (array)$config->get('themecontrol');
$theme  = $config->get('config_template');
$listingConfig = array(
    'category_pzoom'                     => 1,
    'quickview'                          => 0,
    'product_layout'           => 'default',
  );

  $listingConfig     = array_merge($listingConfig, $themeConfig );
  $categoryPzoom      = $listingConfig['category_pzoom'];
  $quickview          = $listingConfig['quickview'];
  $categoryPzoom = isset($themeConfig['category_pzoom']) ? $themeConfig['category_pzoom']:0;
  $objlang = $this->registry->get('language');
  
?>
 <div class="megaproducts" id="megaproducts<?php echo $module;?>">
    <div   class="mega-filters">  
       <button class="mega-btn active btn-filter" data-filter="*"><i class="icon hidden-xs fa fa-sun-o"></i><?php echo $objlang->get("show all"); ?></button>
    		<?php foreach( $tabs as $tab => $category ) { 
    				if( empty($category) ){ continue;}
    				$tab = 'boxcats';
    				$id = $category['category_id'].rand();	
            $class= isset($category['class']) && $category['class'] ? $category['class'] : '';
    				$icon = isset($category['image']) && $category['image'] ?  $category['image'] : ""; 

    		?>
    		<button class="mega-btn btn-filter" data-filter=".megacatid-<?php echo $category['category_id']; ?>">            
            <?php if($class){?>
              <i class ="icon hidden-xs <?php echo $class; ?>"></i>
            <?php } ?>
            <?php if($icon){?>
              <img class="img hidden-xs" src="<?php echo $icon; ?>"/>
            <?php } ?>
            <span><?php echo $category['category_name'];?></span>
        </button>  
    		<?php } ?>
    </div>
    <div class="isotope row clearfix">

        		<?php foreach( $megaproducts as $product ) { ?>
        				<!-- A GALLERY ENTRY -->
        		<div  data-category="transition" class="element-item col-lg-<?php echo $gcol; ?> col-md-<?php echo $gcol; ?> col-sm-6 col-xs-12 megacatid-<?php echo $product['category_id']; ?> cat-all mega-bg-1" data-src="<?php echo $product['thumb']; ?>" data-width="577" data-height="700" >
        			<div class="product-block clearfix" itemtype="http://schema.org/Product" itemscope> 
                  <div class="blog-img">
                  <?php if ($product['thumb']) {    ?>
                    
                    <div class="image">
                      <?php if( $product['special'] ) {   ?>
                        <span class="product-label sale"><span class="product-label-special"><?php echo $objlang->get('text_sale'); ?></span></span>
                      <?php } ?>
                      <a class="img" itemprop="url" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>">
                        <img class="img-responsive" itemprop="image" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
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

              <!-- end product-block -->

        		</div>
        		<?php } ?>
      
      </div>
      <?php if($max_page>1) { ?>
      <div class="text-center">
        <div class="mega-loadmore btn btn-link" data-currentpage="1" data-limitpage="<?php echo $max_page;?>"><i class="fa-fw fa fa-repeat"></i><?php echo $text_load_more;?> (<span class="page-counter" >1/<?php echo $max_page;?></span>)</div>
      </div>
      <?php } ?>
    
</div>

<script type="text/javascript">
$(document).ready( function( ) {
   $( '#megaproducts<?php echo $module;?>' ).megaProducts( {
      url:'<?php  echo $url->link('pavmegaproducts/product', 'rand=' . time() ); ?>',
      moduleid: '<?php echo $modulename;?> '
   } );
} );
</script>
