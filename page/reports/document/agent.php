<?php

class page_reports_document_agent extends Page {
	function init(){
		parent::init();

		$form=$this->add('Form');
		$agent_field=$form->addField('dropdown','agent')->setEmptyText('Please Select');
		$agent_field->setModel('Agent');

		$form->addSubmit('GET LIST');
		
		$view=$this->add('View');
		if($_GET['agent']){
			$lister=$view->add('View_Lister_Document',array('type'=>'party'));
			$property_documents=$this->add('Model_PartyDocuments');
			$property_documents->addCondition('party_id',$_GET['agent']);
			$lister->setModel($property_documents);
			
		}else{
			$view->setHTML('<h4>No Documents Found</h4>');
		}




		if($form->isSubmitted()){
			$view->js()->reload(array('agent'=>$form['agent']))->execute();
		}
	}
}