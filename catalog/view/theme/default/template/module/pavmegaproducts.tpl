<?php 

$gcol = floor(12/$cols);
$module = rand(0,9);

?>
 <div class="megaproducts" id="megaproducts<?php echo $module;?>">
    <div   class="mega-filters  button-group   btn-group">  
       <button class="btn btn-sm btn-default active" data-filter="*">show all</button>
    		<?php foreach( $tabs as $tab => $category ) { 
    				if( empty($category) ){ continue;}
    				$tab = 'boxcats';
    				$id = $category['category_id'].rand();	
    				//$icon = isset($category['image']) && $category['image'] ?  $this->model_tool_image->resize( $category['image'], 45,45 ) : ""; 
    		?>
    		<button class=" btn btn-sm btn-default mega-btn " data-filter=".megacatid-<?php echo $category['category_id']; ?>"><?php echo $category['category_name'];?></button>  
    		<?php } ?>
    </div>
    <div class="isotope row clearfix">

        		<?php foreach( $megaproducts as $product ) { ?>
        				<!-- A GALLERY ENTRY -->
        		<div  data-category="transition" class="element-item col-lg-<?php echo $gcol; ?> col-sm-4 col-md-<?php echo $gcol; ?> megacatid-<?php echo $product['category_id']; ?> cat-all mega-bg-1" id="cbg-entry-1" data-src="<?php echo $product['thumb']; ?>" data-width="577" data-height="700" >
        				       <div class="product-block" itemtype="http://schema.org/Product" itemscope> 
                          <?php if ($product['thumb']) {    ?>
                            <div class="image">
                              <?php if( $product['special'] ) {   ?>
                              <span class="product-label product-label-special"><span><?php echo $lang->get( 'text_sale' ); ?></span></span>
                              <?php } ?>
                              <a class="img" itemprop="url" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>">
                                <img class="img-responsive" itemprop="image" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>              
                              <!-- zoom image-->
                              <?php if( isset($categoryPzoom) && $categoryPzoom ) { $zimage = str_replace( "cache/","", preg_replace("#-\d+x\d+#", "",  $product['thumb'] ));  ?>
                                <a href="<?php echo $zimage;?>" class="btn-danger colorbox product-zoom" title="<?php echo $product['name']; ?>"><i class="fa fa-search-plus"></i></a>
                              <?php } ?>
                              <?php //#2 Start fix quickview in fw?>
                                <?php if ( isset($quickview) && $quickview ) { ?>
                                  <a class="pav-colorbox btn btn-danger" href="<?php echo $url->link("themecontrol/product",'product_id='.$product['product_id'] );?>"><em class="fa fa-plus"></em><span><?php echo $lang->get('quick_view'); ?></span></a>
                                <?php } ?>
                              <?php //#2 End fix quickview in fw?>
                            </div>
                          <?php } ?>
                                   
                          <div class="product-meta">      
                            <div class="left">
                              <?php if ( isset($product['rating']) && $product['rating'] ) { ?>
                                <div class="rating"><img src="catalog/view/theme/<?php echo $config->get('config_template');?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['rating']; ?>"></div>
                                <?php } else { ?>
                                  <div class="norating"><img alt="0" src="catalog/view/theme/<?php echo $config->get('config_template');?>/image/stars-0.png"></div>
                                  <?php } ?>  
                                  <h3 class="name" itemprop="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
                              <?php if ($product['price']) { ?>
                              <div class="price" itemtype="http://schema.org/Offer" itemscope itemprop="offers">
                                <?php if (!$product['special']) {  ?>
                                  <span class="special-price"><?php echo $product['price']; ?></span>
                                  <?php if( preg_match( '#(\d+).?(\d+)#',  $product['price'], $p ) ) { ?> 
                                  <meta content="<?php echo $p[0]; ?>" itemprop="price">
                                  <?php } ?>
                                <?php } else { ?>
                                  <span class="price-old"><?php echo $product['price']; ?></span> 
                                  <span class="price-new"><?php echo $product['special']; ?></span>
                               
                                  <?php if( preg_match( '#(\d+).?(\d+)#',  $product['special'], $p ) ) { ?> 
                                  <meta content="<?php echo $p[0]; ?>" itemprop="price">
                                  <?php } ?>

                                <?php } ?>
                                <?php if ( isset($product['tax']) && $product['tax']) { ?>          
                                  <span class="price-tax"><?php echo $lang->get('text_tax'); ?> <?php echo $product['tax']; ?></span>
                                <?php } ?>

                                <meta content="<?php echo $currency->getCode(); ?>" itemprop="priceCurrency">
                              </div>
                              <?php } ?>
                              <?php if( isset($product['description']) ){ ?> 
                              <p class="description" itemprop="description"><?php echo utf8_substr( strip_tags($product['description']),0,220);?>...</p>
                              <?php } ?>  
                            </div>
                          
                            <div class="right">   
                              <div class="action">
                                <div class="wishlist">
                                  <a onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $lang->get("button_wishlist"); ?>" class="btn btn-outline-inverse">
                                    <span class="fa fa-heart"></span>
                                    <span class="hide"><?php echo $lang->get("button_wishlist"); ?></span>
                                  </a>  
                                </div>          
                                <?php if( !isset($listingConfig['catalog_mode']) || !$listingConfig['catalog_mode'] ) { ?>
                                <div class="cart">            
                                  <button onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-shopping-cart btn-outline ">
                                    <span class="fa fa-shopping-cart"></span>
                                    <?php echo $lang->get("button_cart"); ?>
                                  </button>
                                </div>
                                <?php } ?>
                                  
                                <div class="compare">     
                                  <a class="btn btn-outline-inverse" onclick="addToCompare('<?php echo $product['product_id']; ?>');" title="<?php echo $lang->get("button_compare"); ?>">
                                    <span class="fa fa-files-o"></span>
                                    <span class="hide"><?php echo $lang->get("button_compare"); ?></span>
                                  </a>  
                                </div>              
                              </div>     
                            </div>   
                          </div>     
                        </div>

        		</div>
        		<?php } ?>
      
      </div>
       <?php if($max_page>1) { ?>
       <div class="mega-loadmore btn btn-danger" data-currentpage="1" data-limitpage="<?php echo $max_page;?>"><?php echo $text_load_more;?> (<span class="page-counter" >1/<?php echo $max_page;?></span>)</div>
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
