<div class="<?php echo str_replace('_','-',$blockid); ?> <?php echo $blockcls;?>" id="pavo-<?php echo str_replace('_','-',$blockid); ?>">
  <div class="container">
    <div class="inside">
      <div class="row">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 column">
          <?php
          if($content=$helper->getLangConfig('widget_aboutus')){
          echo $content;
          }
          ?>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 column">
          <div class="panel">
            <div class="panel-heading"><h4 class="panel-title"><?php echo $text_account; ?></h4></div>
            <div class="panel-body">
              <ul class="list-unstyled">
                <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
              </ul>
            </div>
          </div>
          <?php
            echo $helper->renderModule('pavnewsletter');
          ?>
        </div>
        <?php if ($informations) { ?>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 column">
          <div class="panel">
            <div class="panel-heading"><h5 class="panel-title"><?php echo $text_information; ?></h5></div>
            <div class="panel-body">
              <ul class="list-unstyled">
                <?php foreach ($informations as $information) { ?>
                <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                <?php } ?>
              </ul>
            </div>
          </div>
        </div>
        <?php } ?>             
      </div>
    </div>
  </div>
</div>