
<div class="widget-html  <?php echo $addition_cls ?>  <?php if( isset($stylecls)&&$stylecls ) { ?>-<?php echo $stylecls;?><?php } ?>">
    <?php if( $show_title ){ ?>
    <h5 class="widget-heading">
        <?php echo $heading_title; ?>
    </h5>
    <?php } ?>
	<div class="widget-inner clearfix">
		 <?php echo html_entity_decode( $html ); ?>
	</div>
</div>