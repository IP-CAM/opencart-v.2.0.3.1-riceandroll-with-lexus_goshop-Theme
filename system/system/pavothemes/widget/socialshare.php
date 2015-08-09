<?php 

	class PtsWidgetSocialshare extends PtsWidgetPageBuilder {
		
		public $name = 'socialshare';
		public $usemeneu = false;

		protected static $networks = array('facebook'=>'Facebook','twitter'=> 'Twitter', 'google'=>'Google','pinterest' => 'Pinterest');

		public  static function getWidgetInfo(){
			return array( 'label' => 'Social Share', 'explain' => 'Get list of sharing socials', 'group' => 'social'  );
		}

		public function renderForm( $args, $data ){
				
			$helper = $this->getFormHelper();
			
			$soption = array(
	            array(
	                'id' => 'active_on',
	                'value' => 1,
	                'label' => $this->l('Enabled')
	            ),
	            array(
	                'id' => 'active_off',
	                'value' => 0,
	                'label' => $this->l('Disabled')
	            )
	        );
			
			$fields = array();
			foreach (self::$networks as $key=>$network) {
				$fields[] = array(
					'type' => 'switch',
					'label' => $this->l($network),
					'name' => $key,
					'values' => $soption,
					'default' => "0",
                );
			}	

			$this->fields_form[1]['form'] = array(
	            'legend' => array(
	                'title' => $this->l('Widget Separator Form.'),
	            ),

	            'input' =>  $fields,
	        
	  		 	'submit' => array(
		            'title' => $this->l('Save'),
		            'class' => 'button'
	   		 	)
	        );


		 	$default_lang = (int)$this->config->get('config_language_id');
			
			$helper->tpl_vars = array(
	                'fields_value' => $this->getConfigFieldsValues( $data  ),
	                
	                'id_language' => $default_lang
	    	);  
			return  $helper->generateForm( $this->fields_form );
		}

		public function renderContent(  $args, $setting ){
		$t  = array(
			'separ_title' => 'separator here',
			'title_align' => 'separator_align_center',
			'pagelink'    => '' ,
			'pagename'	 => '',
		);

		$setting    = array_merge( $t, $setting );
		$s = '';
		$setting['pagelink'] = 'http'.$s.'://' .$_SERVER['HTTP_HOST'].'/'.$_SERVER['REQUEST_URI'];

		$output = array('type'=>'socialshare','data' => $setting );
		
		return $output;
		}
	}