<?php

class page_property_sale extends Page {
	function init(){
		parent::init();

		$crud=$this->add('xCRUD');
		// $crud->add_button->lable='Add';

		$sale_property_model=$this->add('Model_PropertyLog');
		$sale_property_model->addCondition('action','sales');

		// $crud->addHook('myupdate',function($crud,$form){
		// 	if($crud->isEditing('edit')) return false; // Always required to bypass the bellow code in editing crud mode
			
		// 	// Do your stuff by getting $form data
		// 	// $sale_property = $crud->add('Model_Property');
		// 	// // CreatNew Function call
		// 	// $sale_property->sale();
		// 	return true; // Always required
		// });
		
		$crud->setModel($sale_property_model);		
	
		if($g=$crud->grid){
			$g->addPaginator(10);
			$g->addQuickSearch(array('name'));

		}

		if($crud->isEditing('add')){
			
			$crud->form->getElement('property_id')->getModel()->addCondition('status','UnSold');
		}

	}
}