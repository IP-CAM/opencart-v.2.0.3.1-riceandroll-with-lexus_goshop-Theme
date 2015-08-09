<div class="widget-category panel panel-default panel-v2 clearfix <?php echo $addition_cls?>">
	<?php if( $show_title ) { ?>
	<div class="widget-heading panel-heading border-0"><h4 class="panel-title"><?php echo $heading_title?></h4></div>
	<?php } ?>
	<div class="widget-inner">	
		<?php if(!empty($categories)) { ?>
			<div class="box-content">
				<ul class="list-unstyled">
					<?php foreach ($categories as $category): ?>
					<li>
						<a href="<?php echo $category['href']; ?>">
							<?php if ($category['image'] !== '') { ?>
							<img src="image/<?php echo $category['image']; ?>" alt="" class="img-responsive">
							<?php
							} ?>
						</a>
						<div class="caption">
							<h6><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></h6>
							<div><a class="text-lighten" href="<?php echo $category['href']; ?>"><?php echo $category['items']; ?></a></div>
						</div>						
					</li>
					<?php endforeach ?>
				</ul>
			</div>
		<?php } ?>


	</div>
</div>