<?php

class page_reports_document_customer extends Page {
	function init(){
		parent::init();

		$form=$this->add('Form');
		$agent_field=$form->addField('dropdown','customer')->setEmptyText('Please Select');
		$party=$this->add('Model_Party')->onlyCustomer();
		$agent_field->setModel($party);

		$form->addSubmit('GET LIST');
		
		$view=$this->add('View');
		if($_GET['customer']){
			$lister=$view->add('View_Lister_Document',array('type'=>'party'));
			$property_documents=$this->add('Model_PartyDocuments');
			$property_documents->addCondition('party_id',$_GET['customer']);
			$lister->setModel($property_documents);
			
		}else{
			$view->setHTML('<h4>No Documents Found</h4>');
		}




		if($form->isSubmitted()){
			$view->js()->reload(array('customer'=>$form['customer']))->execute();
		}
	}
}