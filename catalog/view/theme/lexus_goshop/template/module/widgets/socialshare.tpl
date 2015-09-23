
<?php if($twitter || $facebook || $google || $pinterest){?>
	<div class="ptssocialsharing_product list-inline no-print bo-social-icons bo-sicolor">
		<?php if($twitter && $twitter == 1){ ?>
			<button type="button" class="bo-social-twitter" onclick="ptssocialsharing_twitter_click('<?php echo addslashes($pagename.$pagelink) ?>');">
				<i class="fa fa-twitter"></i> <span>Tweet</span>
				<!-- <img src="{$link->getMediaLink("`$module_dir`img/twitter.gif")}" alt="Tweet" /> -->
			</button>
		<?php } ?>
		<?php if($facebook && $facebook == 1){ ?>
			<button type="button" class="bo-social-facebook" onclick="ptssocialsharing_facebook_click();">
				<i class="fa fa-facebook"></i><span> facebook</span>
				<!-- <img src="{$link->getMediaLink("`$module_dir`img/facebook.gif")}" alt="Facebook Like" /> -->
			</button>
		<?php } ?>
		<?php if($google && $google == 1){ ?>
			<button type="button" class="bo-social-google" onclick="ptssocialsharing_google_click();">
				<i class="fa fa-google-plus"></i> <span>Google+</span>
				<!-- <img src="{$link->getMediaLink("`$module_dir`img/google.gif")}" alt="Google Plus" /> -->
			</button>
		<?php } ?>
		<?php if($pinterest && $pinterest == 1){ ?>
			<button type="button" class="bo-social-pinterest" onclick="ptssocialsharing_pinterest_click();">
				<i class="fa fa-pinterest"></i> <span>Pinterest</span>
				<!-- <img src="{$link->getMediaLink("`$module_dir`img/pinterest.gif")}" alt="Pinterest" /> -->
			</button>
		<?php } ?>
	</div>
	<script type="text/javascript">
		function ptssocialsharing_twitter_click(message)
		{
		 if (typeof message === 'undefined')
		  message = encodeURIComponent(location.href);
		 window.open('https://twitter.com/intent/tweet?text=' + message, 'sharertwt', 'toolbar=0,status=0,width=640,height=445');
		}

		function ptssocialsharing_facebook_click(message)
		{
		 window.open('http://www.facebook.com/sharer.php?u=' + encodeURIComponent(location.href), 'sharer', 'toolbar=0,status=0,width=660,height=445');
		}

		function ptssocialsharing_google_click(message)
		{
		 window.open('https://plus.google.com/share?url=' + encodeURIComponent(location.href), 'sharergplus', 'toolbar=0,status=0,width=660,height=445');
		}

		function ptssocialsharing_pinterest_click(message)
		{
		 window.open('http://www.pinterest.com/pin/create/button/?url=' + encodeURIComponent(location.href), 'sharerpinterest', 'toolbar=0,status=0,width=660,height=445');
		}
	</script>	
<?php } ?>