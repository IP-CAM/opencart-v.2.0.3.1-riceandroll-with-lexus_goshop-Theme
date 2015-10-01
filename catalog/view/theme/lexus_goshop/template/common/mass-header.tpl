<?php require( PAVO_THEME_DIR."/template/common/config_layout.tpl" );  ?>

<div class="breadcrumb light-style breadcrumbs-center bg-category" style="
    padding-bottom: 20px;
    padding-top: 50px;
    margin-bottom: 0px; background: none;
">  
    <div class="container">    
        <?php $tmp = $breadcrumbs;  $end = array_slice($tmp , count($tmp)-1 ); ?>
        <h1 class="breadcrumb-heading"><?php echo $end[0]['text'] ?></h1>
        <?php if( isset($breadcrumbs) ) { ?>
        <ul class="list-unstyled breadcrumb-links">
       		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
       		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
       		<?php } ?>
       	</ul>
    	<?php } ?>
    </div>
</div>


