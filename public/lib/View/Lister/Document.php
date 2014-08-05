<?php


class View_Lister_Document extends Lister{

	public $type=null;

	function formatRow(){

		$this->template->set('document_image',$this->model['image']);
		$this->template->set('property_name',$this->model['property']);
		$this->template->set('document_type_name',$this->model['document_type']);
		$this->template->set('type',$this->type);
		$this->template->set('img_id',$this->model['image_id']);
	}

	// function render(){
	// 	$this->template->setHTML('customer_document_image_1',$this->model['customer_document_image']);
	// 	$this->template->set('id',$this->model->id);
	// 	parent::render();
	// }

	function defaultTemplate(){
		$l=$this->api->locate('addons',__NAMESPACE__, 'location');
		$this->api->pathfinder->addLocation(
			$this->api->locate('addons',__NAMESPACE__),
			array(
		  		'template'=>'templates',
		  		'css'=>'templates/css'
				)
			)->setParent($l);
		return array('view/document');
	}
}