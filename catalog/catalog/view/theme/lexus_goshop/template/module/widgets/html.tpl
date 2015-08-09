<div class="widget-html panel <?php echo $addition_cls ?>  <?php if( isset($stylecls)&&$stylecls ) { ?>box-<?php echo $stylecls;?><?php } ?>">
	<?php if( $show_title ) { ?>
	<div class="widget-heading panel-heading"><h4 class="panel-title"><?php echo $heading_title?></h4></div>
	<?php } ?>
	<div class="widget-inner panel-body clearfix">
		 <?php echo htmlspecialchars_decode( $html ); ?>
	</div>
</div>
	
