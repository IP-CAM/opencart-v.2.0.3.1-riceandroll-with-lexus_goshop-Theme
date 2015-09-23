<div class="panel panel-default panel-v1 refine-search">
  <div class="panel-heading"><h4 class="panel-title"><?php echo $heading_title; ?></h4></div>
  
    <?php foreach ($filter_groups as $filter_group) { ?>
    <div class="list-group">
    <a class="item-name"><?php echo $filter_group['name']; ?></a>
    <div class="group-item">
      <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
        <?php foreach ($filter_group['filter'] as $filter) { ?>
        <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
        <label class="checkbox">
          <input name="filter[]" type="checkbox" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
          <?php echo $filter['name']; ?></label>
        <?php } else { ?>
        <label class="checkbox">
          <input name="filter[]" type="checkbox" value="<?php echo $filter['filter_id']; ?>" />
          <?php echo $filter['name']; ?></label>
        <?php } ?>
        <?php } ?>
      </div>
    </div>
    </div>
    <?php } ?>
  
  <div class="panel-footer text-center">
    <button type="button" id="button-filter" class="btn btn-default btn-outline btn-sm"><?php echo $button_filter; ?></button>
  </div>
</div>
<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
  filter = [];
  
  $('input[name^=\'filter\']:checked').each(function(element) {
    filter.push(this.value);
  });
  
  location = '<?php echo $action; ?>&filter=' + filter.join(',');
});
//--></script> 
