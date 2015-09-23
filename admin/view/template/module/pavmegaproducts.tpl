<?php 
	echo $header; 
	echo $column_left;
?>

<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Save"><i class="fa fa-save"></i></button>
				<a class="btn btn-danger" href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"><i class="fa fa-reply"></i></a>
			</div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div><!-- End div#page-header -->

	<div id="page-content" class="container-fluid">
		<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>
			<?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<?php if (isset($success) && !empty($success)) { ?>
		<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
			</div>
			<div class="panel-body">
				<?php if(!empty($module_id)) { ?>
				<div class="action pull-right">
					<a onclick="confirm('Are you sure?') ? location.href='<?php echo $delete; ?>' : false;" data-toggle="tooltip" title="" class="btn btn-danger btn-sm" data-original-title="Delete"><i class="fa fa-remove"> Delete</i></a>
				</div>
				<?php } ?>
				<ul class="nav nav-tabs" role="tablist">
					<?php if ($extensions) { ?>
					<?php foreach ($extensions as $extension) { ?>
					<?php $actived = (empty($module_id))?"class='active'":''; ?>
					<li <?php echo $actived; ?>><a href="<?php echo $extension['edit']; ?>" ><i class="fa fa-plus-circle"></i> <?php echo $extension['name']; ?></a></li>
					<?php $i=0; foreach ($extension['module'] as $m) { $i++;?>
					<?php $active = ($m['module_id'] == $module_id)?'class="active"':''; ?>
					<li <?php echo $active; ?>><a href="<?php echo $m['edit']; ?>" ><i class="fa fa-minus-circle"></i> <?php echo $m['name']; ?></a></li>
					<?php } //end modules?>
					<?php } //end extensions?>
					<?php } //end if?>
				</ul>
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
					<div class="tab-pane">
						<table class="table noborder">
							<tr>
								<td class="col-sm-2 control-label"><?php echo $entry_module_name; ?></td>
								<td class="col-sm-10"><input class="form-control nostyle" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_module_name; ?>"/></td>
							</tr>
							<tr>
								<td class="col-sm-2 control-label"><?php echo $entry_status; ?></td>
								<td class="col-sm-10">
									<select class="form-control nostyle" name="status">
										<?php if ($status) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</td>
							</tr>
							<tr>
								<td class="col-sm-2 control-label"><?php echo $entry_prefix_class; ?></td>
								<td class="col-sm-10"><input class="form-control nostyle" name="prefix_class" value="<?php echo $prefix_class; ?>"/></td>
							</tr>
							<tr>
								<td class="col-sm-2 control-label"><?php echo $entry_dimension; ?></td>
								<td class="col-sm-10">
									<input class="form-control nostyle" type="text" name="width" value="<?php echo $width; ?>" /> x 
									<input class="form-control nostyle" type="text" name="height" value="<?php echo $height; ?>"/>
								</td>	
							</tr>
							<tr>
								<td class="col-sm-2 control-label"><?php echo $entry_carousel; ?></td>
								<td class="col-sm-10"> 
									<?php echo $text_column; ?> <input class="form-control nostyle" type="text" name="cols" value="<?php echo $cols; ?>"/> - 
									<?php echo $text_limit_items; ?> <input class="form-control nostyle" type="text" name="limit" value="<?php echo $limit; ?>"/>
								</td>
							</tr>
							<tr>
								<td class="col-sm-2 control-label"><?php echo $entry_max_page; ?></td>
								<td class="col-sm-10"> 
									<input class="form-control nostyle" type="text" name="max_page" value="<?php echo $max_page; ?>" />
								</td>
							</tr>
						</table>
						<table id="links" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<td class="text-left"><?php echo "Category"; ?></td>
									<td></td>
								</tr>
							</thead>
							<tbody>
								<?php $link_row = 0; ?>
								<?php foreach ($category_tabs as $idx => $tab) { ?>
								<tr id="link-row<?php echo $link_row;?>">
									<td class="text-left">
										 <select name="category_tabs[]">
											<?php foreach( $product_categories as $category){ ?>
											<?php $selected = ($category['category_id']==$tab)?"selected='selected'":''; ?>
											<option <?php echo $selected; ?> value="<?php echo $category['category_id'];?>"><?php echo addslashes($category['name']);?> [ID:<?php echo $category['category_id'];?>]</option>
											<?php } ?>
										</select>
									</td>
								  <td> <?php echo $objlang->get( 'entry_icon_image' );?> </td>
								  <td>
									 <?php
										$imgidx = $link_row."-".$idx;
										$thumb = isset( $image[$idx]) ?  $model_tool_image->resize( $image[$idx], 32, 32) : $placeholder;
										$image = isset($image[$idx]) ? $image[$idx]:"";

									 ?>

										<a href="" id="thumb-image<?php echo $imgidx; ?>" data-toggle="image" class="img-thumbnail">
										<img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
										<input type="hidden" name="image[]" value="<?php echo $image; ?>" id="input-image<?php echo $imgidx; ?>" />

									</td>
									<td><?php echo $objlang->get('entry_addition_class');?></td>
									<td>
									  <input class="form-control" style="width:55%;" name="class[]" value="<?php echo $class[$idx];?>">
									</td>
									<td class="text-left"><button type="button" onclick="$('#link-row<?php echo $idx;?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>									
									<td></td>
								</tr>
								<?php $link_row++; ?>
								<?php } ?>
							</tbody>
							<tfoot>
								<tr>
									<td></td>
									<td class="text-left"><button type="button" onclick="addRowLink('link-row<?php echo $link_row; ?>',<?php echo $link_row;?>);" data-toggle="tooltip" title="" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
								</tr>
							</tfoot>
						</table>
						
					</div>
				</form>
			</div>
		</div><!-- end div content form -->
	</div><!-- End div#page-content -->
</div><!-- End div#content -->
<style type="text/css">
	.noborder tbody > tr > td {border: 1px solid #fff;}
	.nostyle { width: 36%; }
</style>
<script type="text/javascript">
function addRowLink(wrapper,mid) {
	var link_row = <?php echo $link_row; ?>;
	//var index =  $("#"+wrapper+"").length;
    //var _class= (index%2==0 ? "odd":"eve");
    //var banner_row = mid+ '-'+index;
	
	html  = '<tr id="link-row' + link_row + '">';
	html += '	<td class="text-left">';
	html += '		<select name="category_tabs[]">';
						<?php foreach( $product_categories as $category){ ?>
	html += '			<option value="<?php echo $category['category_id'];?>"><?php echo addslashes($category['name']);?> [ID:<?php echo $category['category_id'];?>]</option>';
						<?php } ?>
	html += '		</select>';
	html += '	</td>';
    html += '<td>  <?php echo $objlang->get( 'entry_icon_image' );?> </td>';
    html += '<td> ';
    html += '<a href="" id="thumb-image' + link_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="image[]" value="" id="input-image' + link_row + '" /></td>';

    html += '<td><?php echo $objlang->get("entry_addition_class");?></td>';
    html += '<td><input class="form-control" style="width:55%;" name="class[]"></td>';
    html += '<td class="text-left"><button type="button" onclick="$(\'#link-row'+link_row+'\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';	
	html += '<td></td>';
	html += '<tr>';
	$('#links tbody').append(html);
	link_row++;
}
</script>
<?php echo $footer; ?>