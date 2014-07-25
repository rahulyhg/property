<?php

class page_property_purchasereturn extends Page {
	function init(){
		parent::init();

		$crud=$this->add('xCRUD');
		// $crud->add_button='Add';

		$salereturn_property_model=$this->add('Model_PropertyLog');
		$salereturn_property_model->addCondition('action','SalereturnReturned');

		$crud->addHook('myupdate',function($crud,$form){
			if($crud->isEditing('edit')) return false; // Always required to bypass the bellow code in editing crud mode
			
			// Do your stuff by getting $form data
			$salereturn_property = $crud->add('Model_Property');
			// CreatNew Function call
			$salereturn_property->salereturn();
			return true; // Always required
		});
		
		$crud->setModel($salereturn_property_model);		
	
		if($g=$crud->grid){
			$g->addPaginator(10);
			$g->addQuickSearch(array('name'));

		}

		if($crud->isEditing('Add')){
			$crud->form->getElement('property_id')->getModel()->addCondition('status','Purchase');
		}
		

	}
}