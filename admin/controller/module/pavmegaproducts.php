<?php
class ControllerModulepavmegaproducts extends Controller {
	private $error = array();
	private $data;
	
	public function index() {   
		
		$this->language->load('module/pavmegaproducts');
		$this->load->model('setting/setting');
		$this->load->model('localisation/language');
		$this->load->model('design/layout');
		$this->load->model('extension/module');
		$this->load->model('extension/extension');
		$this->load->model('tool/image');
		
		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('pavmegaproducts', $this->request->post);
				$this->response->redirect($this->url->link('module/pavmegaproducts', 'token=' . $this->session->data['token'], 'SSL'));
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
				$this->response->redirect($this->url->link('module/pavmegaproducts', 'token=' . $this->session->data['token'].'&module_id='.$this->request->get['module_id'], 'SSL'));
			}

			$this->session->data['success'] = $this->language->get('text_success');
		}	

		$this->_language();
		$this->_breadcrumbs();
		$this->_alert();
		$this->_data();


		$this->load->model('catalog/category');
		if( VERSION == '1.5.4' ){
			$results = $this->model_catalog_category->getCategories(0);
		}else {
			$results = $this->model_catalog_category->getCategories( array('limit' => 999999999 , 'start'=>0 ) );
		}
		$this->data['product_categories'] = $results; 


		$tabs = array(
			'latest' 	 => $this->language->get('text_latest'),
			'featured'   => $this->language->get('text_featured'),
			'bestseller' => $this->language->get('text_bestseller'),
			'special'   => $this->language->get('text_special'),
			'mostviewed' => $this->language->get('text_mostviewed')
		);	
		$this->data['tabs'] = $tabs;


 		// Render 
		$this->data['header'] = $this->load->controller('common/header');
		$this->data['column_left'] = $this->load->controller('common/column_left');
		$this->data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view('module/pavmegaproducts.tpl', $this->data));

	}

	public function _language(){
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
 		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');	
		$this->data['no_image'] = '';

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_tabs'] = $this->language->get('entry_tabs');
		$this->data['entry_banner'] = $this->language->get('entry_banner');
		$this->data['entry_dimension'] = $this->language->get('entry_dimension'); 
		$this->data['entry_carousel'] = $this->language->get('entry_carousel'); 
		
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_category'] = $this->language->get( 'entry_category' );

		$this->data['entry_module_name'] = $this->language->get( 'entry_module_name' );
		$this->data['create_module'] = $this->language->get( 'create_module' );

		$this->data['entry_prefix_class'] = $this->language->get( 'entry_prefix_class' );
		$this->data['text_column'] = $this->language->get( 'text_column' );
		$this->data['text_limit_items'] = $this->language->get( 'text_limit_items' );

		$this->data['entry_max_page'] = $this->language->get( 'entry_max_page' );


		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
		$this->load->model('localisation/language');
		$this->data['tab_module'] = $this->language->get('tab_module');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		$this->data['token'] = $this->session->data['token'];
		$this->data['objlang'] = $this->language;
		$this->data['placeholder'] = $this->model_tool_image->resize('no_image.png', 50, 50);
	}

	public function _data(){
		$this->data['extensions'] = $this->extensions("pavmegaproducts", "&module_id");

		if (isset($this->request->get['module_id'])) {
			$module_id = $this->request->get['module_id']; $url = '&module_id='.$module_id;
		} else {
			$module_id = ''; $url = '';
		}
		$this->data['module_id'] = $module_id;

		$this->data['delete'] = $this->url->link('module/pavmegaproducts/ndelete', 'token=' . $this->session->data['token'].$url, 'SSL');
		$this->data['action'] = $this->url->link('module/pavmegaproducts', 'token=' . $this->session->data['token'].$url, 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		// GET DATA SETTING
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		$this->data['model_tool_image'] = $this->model_tool_image;
		$this->data['category_tabs'] = isset($module_info['category_tabs'])?$module_info['category_tabs']:array();
		$this->data['image'] = isset($module_info['image'])?$module_info['image']:array();
		$this->data['class'] = isset($module_info['class'])?$module_info['class']:array();
		
		// NAME
		if (isset($this->request->post['name'])) {
			$this->data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$this->data['name'] = $module_info['name'];
		} else {
			$this->data['name'] = '';
		}

		// STATUS
		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$this->data['status'] = $module_info['status'];
		} else {
			$this->data['status'] = 1;
		}

		// prefix_class
		if (isset($this->request->post['prefix_class'])) {
			$this->data['prefix_class'] = $this->request->post['prefix_class'];
		} elseif (!empty($module_info)) {
			$this->data['prefix_class'] = $module_info['prefix_class'];
		} else {
			$this->data['prefix_class'] = '';
		}

		// width
		if (isset($this->request->post['width'])) {
			$this->data['width'] = $this->request->post['width'];
		} elseif (!empty($module_info)) {
			$this->data['width'] = $module_info['width'];
		} else {
			$this->data['width'] = 445;
		}

		// height
		if (isset($this->request->post['height'])) {
			$this->data['height'] = $this->request->post['height'];
		} elseif (!empty($module_info)) {
			$this->data['height'] = $module_info['height'];
		} else {
			$this->data['height'] = 595;
		}

		// cols
		if (isset($this->request->post['cols'])) {
			$this->data['cols'] = $this->request->post['cols'];
		} elseif (!empty($module_info)) {
			$this->data['cols'] = $module_info['cols'];
		} else {
			$this->data['cols'] = 4;
		}

		// limit
		if (isset($this->request->post['limit'])) {
			$this->data['limit'] = $this->request->post['limit'];
		} elseif (!empty($module_info)) {
			$this->data['limit'] = $module_info['limit'];
		} else {
			$this->data['limit'] = 8;
		}

		//max_page
		if (isset($this->request->post['max_page'])) {
			$this->data['max_page'] = $this->request->post['max_page'];
		} elseif (!empty($module_info)) {
			$this->data['max_page'] = $module_info['max_page'];
		} else {
			$this->data['max_page'] = 4;
		}
	}


	public function _alert(){
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
	}

	public function _breadcrumbs(){
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/pavmegaproducts', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);
	}

	public function ndelete(){
		$this->load->model('extension/module');
		$this->load->language('module/pavmegaproducts');
		if (isset($this->request->get['module_id'])) {
			$this->model_extension_module->deleteModule($this->request->get['module_id']);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('module/pavmegaproducts', 'token=' . $this->session->data['token'], 'SSL'));
		}
	}

	public function extensions($extension, $module_id){
		$module_data = array();
		$this->load->model('extension/extension');
		$this->load->model('extension/module');
		$extensions = $this->model_extension_extension->getInstalled('module');
		$modules = $this->model_extension_module->getModulesByCode($extension);
		foreach ($modules as $module) {
			$module_data[] = array(
				'module_id' => $module['module_id'],
				'name'      => $module['name'],
				'edit'      => $this->url->link('module/pavmegaproducts', 'token=' . $this->session->data['token'] . $module_id.'=' . $module['module_id'], 'SSL'),
				'delete'    => $this->url->link('extension/module/delete', 'token=' . $this->session->data['token'] . $module_id.'=' . $module['module_id'], 'SSL')
			);
		}
		$ex[] = array(
			'name'      => $this->language->get("create_module"),
			'module'    => $module_data,
			'edit'      => $this->url->link('module/' . $extension, 'token=' . $this->session->data['token'], 'SSL')
		);
		return $ex;
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/pavmegaproducts')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (isset($this->request->post['pavmegaproducts_module'])) {
			foreach ($this->request->post['pavmegaproducts_module'] as $key => $value) {
				if (!$value['class'] || !$value['class']) {
					$this->error['dimension'][$key] = $this->language->get('error_dimension');
				}

				if( !isset($value['category_tabs']) ){
					$this->error['dimension'][$key] = $this->language->get('error_category_tabs');

				}			
				if (!$value['image'] || !$value['image']   ) {
					$this->error['dimension'][$key] = $this->language->get('error_carousel');
				}			
			}
		}	
						
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>
