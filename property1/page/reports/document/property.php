<?php
class page_reports_document_property extends Page {
	function init(){
		parent::init();

		$form=$this->add('Form');
		$agent_field=$form->addField('dropdown','property')->setEmptyText('Please Select');
		$agent_field->setModel('Property');

		$form->addSubmit('GET LIST');
		
		$view=$this->add('View');
		if($_GET['property']){
			$lister=$view->add('View_Lister_Document',array('type'=>'property'));
			$property_documents=$this->add('Model_PropertyDocuments');
			$property_documents->addCondition('property_id',$_GET['property']);
			$lister->setModel($property_documents);
			
		}else{
			$view->setHTML('<h4>No Documents Found</h4>');
		}




		if($form->isSubmitted()){
			$view->js()->reload(array('property'=>$form['property']))->execute();
		}
	}
}