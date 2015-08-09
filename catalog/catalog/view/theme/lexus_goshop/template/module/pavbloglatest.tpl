<div class="panel panel-default panel-v1 latest_blog <?php echo $prefixclass;?>">
	<div class="panel-heading">
		<h4 class="panel-title"><?php echo $heading_title; ?></h4>
	</div>
	<div class="panel-body">
		<?php if( !empty($blogs) ) { ?>
		<div class="row">
			<?php foreach( $blogs as $key => $blog ) { $key = $key + 1;?>
			<?php $style = ( $key > $cols )?"left":"right";  ?>
			<div class="col-lg-<?php echo floor(12/$cols);?> col-md-<?php echo floor(12/$cols);?> col-sm-6 col-xs-12 <?php echo $style; ?>">	
				<div class="latest-posts-body">
					<div class="latest-posts-image">
					  	<a class="" href="#">
						    <?php if( $blog['thumb']  )  { ?>
								<img src="<?php echo $blog['thumb'];?>" title="<?php echo $blog['title'];?>" alt="<?php echo $blog['title'];?>" class="img-responsive"/>
							<?php } ?>
					  	</a>
					</div>
				  	<div class="latest-posts-meta">
				  		<h6 class="latest-posts-title"><a href="<?php echo $blog['link'];?>" title="<?php echo $blog['title'];?>"><?php echo $blog['title'];?></a></h6>
					  	<p class="date"><?php echo date("d M, y",strtotime($blog['created']));?></p>
					    <div class="description">
							<?php $blog['description'] = strip_tags($blog['description']); ?>
							<?php echo utf8_substr( $blog['description'],0, 70 );?>...
						</div>
						<div class="btn-more-link">
							<a href="<?php echo $blog['link'];?>" class="readmore btn btn-link"><?php echo $objlang->get('text_readmore');?></a>
						</div>
				  	</div>
				</div>
			</div>
			<?php } ?>
		</div>
		<?php } ?>
	</div>
</div>
