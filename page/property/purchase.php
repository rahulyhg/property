<?php

class page_property_purchase extends Page {
	function init(){
		parent::init();

		$crud=$this->add('xCRUD');

		$purchase_property_model=$this->add('Model_Property');
		$purchase_property_model->addCondition('status','Unsold');
		$crud->addHook('myupdate',function($crud,$form){
			if($crud->isEditing('edit')) return false; // Always required to bypass the bellow code in editing crud mode
			
			// Do your stuff by getting $form data
			$purchase_property = $crud->add('Model_Property');
			// CreatNew Function call
			$purchase_property->purchase();
			return true; // Always required
		});
		
		$crud->setModel($purchase_property_model);		
	
		if($g=$crud->grid){
			$g->addPaginator(10);
			$g->addQuickSearch(array('name'));

		}

		
	}
}