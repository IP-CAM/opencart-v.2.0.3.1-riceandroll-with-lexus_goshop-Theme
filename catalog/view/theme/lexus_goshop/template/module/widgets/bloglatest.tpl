<?php $objlang = $this->registry->get('language'); ?>
<?php if( !empty($blogs) ) { ?>
<div class="widget-blogs panel panel-default panel-v1 latest-posts <?php echo $addition_cls; ?> <?php if ( isset($stylecls)&&$stylecls) { ?>box-<?php echo $stylecls; ?><?php } ?>">
	<?php if( $show_title ) { ?>
	<div class="widget-heading panel-heading"><h4 class="panel-title"><?php echo $heading_title?></h4></div>
	<?php } ?>
	<div class="widget-inner panel-body">	 
		<div class="row">
			<?php foreach( $blogs as $key => $blog ) { $key = $key + 1;?>
			<?php $style = ( $key > $cols )?"left":"right";  ?>
			<div class="col-lg-<?php echo floor(12/$cols);?> col-md-<?php echo floor(12/$cols);?> col-sm-6 col-xs-12 <?php echo $style; ?>">
				<div class="latest-posts-body">	
					<?php if( $blog['thumb']  )  { ?>			
					<div class="latest-posts-image">
					  	<a class="" href="<?php echo $blog['link'];?>">
							<img src="<?php echo $blog['thumb'];?>" title="<?php echo $blog['title'];?>" alt="<?php echo $blog['title'];?>" class="img-responsive"/>
					  	</a>					  	
					</div>
					<?php } ?>
					<div class="latest-posts-meta">
						<h4 class="latest-posts-title">
							<a href="<?php echo $blog['link'];?>" title="<?php echo $blog['title'];?>"><?php echo $blog['title'];?></a>
						</h4>
						<div class="latest-posts-profile">
						  	<span class="created"><span><?php echo date("d M, y",strtotime($blog['created']));?></span></span>
						  	<span class="blog-ctncomment"><?php echo $objlang->get("text_comment_count");?> <?php echo $blog['comment_count'];?></span>
					  	</div>
						<div class="posts-meta">								
							<div class="blog-meta">								
								<span class="author space-right-15">
									<i class="fa-fw fa fa-pencil"></i><?php echo $objlang->get("text_write_by");?>
									<?php echo $blog['author'];?>
								</span>									
								<span class="hits"><i class="fa-fw fa fa-eye"></i><?php echo $objlang->get("text_hits");?> <?php echo $blog['hits'];?></span>
							</div>			
							<div class="description space-padding-tb-20">
								<?php $blog['description'] = strip_tags($blog['description']); ?>
								<?php echo utf8_substr( $blog['description'],0, 80);?>...
							</div>	
							<div class="btn-more-link">
								<a href="<?php echo $blog['link'];?>" class="space-padding-0 readmore btn btn-link"><?php echo $objlang->get('text_readmore');?></a>
							</div>
						</div>
					</div>					
				</div> <!-- end latest-posts-body -->
			</div>
			<?php if( ( $key%$cols==0 || $key == count($blogs)) ){  ?>
			<?php } ?>
			<?php } ?>
		</div>
	</div>
</div>
<?php } ?>