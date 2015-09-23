<?php  
class ControllerpavmegaproductsProduct extends Controller {
	private $error = array(); 
	private $data = array();
	
	public function index() {  

		$this->load->model('pavmegaproducts/product'); 
	  	$this->load->model('catalog/product'); 
		$this->load->model('catalog/category'); 
		$this->load->model('tool/image');
		$this->load->language('module/pavmegaproducts');

 		if( !isset($this->request->post['moduleid'] ) ){
 			return '';
 		}
 		$moduleName = $this->request->post['moduleid'];

 		$setting = $this->model_pavmegaproducts_product->getModule($moduleName);

		$limit = $setting['limit'];
		$default = array(
			'latest' => 1,
			'limit' => $setting['limit'],
			'cols'	 =>  4,
			'max_page' => 4
		);
		$setting = array_merge( $default, $setting );

		$this->data['width'] = $setting['width'];
		$this->data['height'] = $setting['height'];
		$this->data['cols']   = (int)$setting['cols'];
	 

		$this->data['prefix_class']   = isset($setting['prefix_class'])?$setting['prefix_class']:'';

		$this->data['tabs'] = array();
		$page = isset($this->request->post['page'])?(int)$this->request->post['page']:1;

		if( $page > $setting['max_page']){
			return ;
		}
		
		$pdata = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => ($page - 1) * $limit,
			'limit' => $setting['limit'],
			'filter_category_ids' => implode( ",", $setting['category_tabs']) 
		);

		$mproducts = array();
		$mproducts = $this->getProducts( $this->model_pavmegaproducts_product->getProducts( $pdata ), $setting );
		
		$this->data['megaproducts'] = $mproducts;

		$this->data['url'] = $this->url;

		$this->data['lang'] = $this->language;

		$this->data['config'] = $this->config;

		$this->data['currency'] = $this->currency;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/pavmegaproducts_ajax.tpl')) {
			$template = $this->config->get('config_template') . '/template/module/pavmegaproducts_ajax.tpl';
		} else {
			$template = 'default/template/module/pavmegaproducts_ajax.tpl';
		}

		echo $this->load->view( $template, $this->data) ;

		die;
	}

  	private function getProducts( $results, $setting ){
		$products = array();
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				$product_images = $this->model_catalog_product->getProductImages($result['product_id']);
				if(isset($product_images) && !empty($product_images)) {
					$thumb2 = $this->model_tool_image->resize($product_images[0]['image'], $setting['width'], $setting['height']);
				}
			} else {
				$image = false;
			}
						
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
					
			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				$discount = floor((($result['price']-$result['special'])/$result['price'])*100);
			} else {
				$special = false;
			}
			
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
			} else {
				$rating = false;
			}
			 
			$products[] = array(
				'product_id' => $result['product_id'],
				'thumb'   	 => $image,
				'thumb2'   	 => isset($thumb2)?$thumb2:'',
				'name'    	 => $result['name'],
				'price'   	 => $price,
				'date_added' => $result['date_added'],
				'discount'   => isset($discount)?'-'.$discount.'%':'',
				'special' 	 => $special,
				'rating'     => $rating,
				'description'=> (html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')),
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
				'category_id'	=>  $result['category_id']
			);
		}
		return $products;
	}
}	
?>