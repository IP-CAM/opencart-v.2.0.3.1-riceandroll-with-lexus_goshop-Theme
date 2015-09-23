<div class="latest-posts latest-posts-v7">
	<div class="blog-item latest-posts-body">
		<?php if( $config->get('cat_show_title') ) { ?>
			<div class="latest-posts-image">
				<?php if( $blog['thumb'] && $config->get('cat_show_image') )  { ?>
				<img src="<?php echo $blog['thumb'];?>" title="<?php echo $blog['title'];?>" class="img-responsive"/>
				<?php } ?>
			</div>
		<?php } ?>
		<div class="latest-posts-meta">
			<h4 class="latest-posts-title">	<a href="<?php echo $blog['link'];?>" title="<?php echo $blog['title'];?>"><?php echo $blog['title'];?></a></h4>
			<div class="latest-posts-profile">			
				<?php if( $config->get('cat_show_created') ) { ?>
				<span class="created"><span><?php echo date("d M, y",strtotime($blog['created']));?></span></span>
				<?php } ?>	
				<span class="blog-ctncomment">
					<?php if( $config->get('blog_show_comment_counter') ) { ?>
						<?php echo $objlang->get("text_comment_count");?> <?php echo $blog['comment_count'];?>
					<?php } ?>
				</span>							
			</div>
			<?php if( $config->get('cat_show_description') ) {?>
			<div class="description">
				<?php echo utf8_substr( $blog['description'],0, 180 );?>...
			</div>
			<?php } ?>
			<div class="blog-meta">
				<ul class="list-inline">
				  	<li><?php if( $config->get('blog_show_author') ) { ?>
					<span class="author"><b><?php echo $objlang->get("text_write_by");?></b> <?php echo $blog['author'];?></span>
					<?php } ?>
					</li>

					<li>
					<?php if( $config->get('blog_show_category') ) { ?>
					<span class="publishin">
						<b><?php echo $objlang->get("text_published_in");?></b>
						<a class="color" href="<?php echo $blog['category_link'];?>" title="<?php echo $blog['category_title'];?>"><?php echo $blog['category_title'];?></a>
					</span>
					<?php } ?>	
					</li>

					<li>
					<?php if( $config->get('blog_show_created') ) { ?>
					<span class="created"><b><?php echo $objlang->get("text_created_date");?></b> <?php echo $blog['created'];?></span>
					<?php } ?>
					</li>

					<li>
					<?php if( $config->get('blog_show_hits') ) { ?>
					<span class="hits"><b><?php echo $objlang->get("text_hits");?></b> <?php echo $blog['hits'];?></span>
					<?php } ?>		
					</li>

				</ul>
			</div>
			<?php if( $config->get('cat_show_readmore') ) { ?>
				<a href="<?php echo $blog['link'];?>" class="btn btn-default btn-sm btn-inverse"><?php echo $objlang->get('text_readmore');?></a>
			<?php } ?>
		</div>
	</div>
</div>
<hr>