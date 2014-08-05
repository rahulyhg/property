<?php
class page_reports_googlemap extends Page {
	function init(){
		parent::init();

		$form=$this->add('Form');
		$agent_field=$form->addField('dropdown','property')->setEmptyText('Please Select');
		$agent_field->setModel('Property');

		$form->addSubmit('GET LIST');
		
		$property=$this->add('Model_Property');
		$view=$this->add('View');
		if($_GET['property']){
			$property->load($_GET['property']);
			$view->setHTML($property['google_map_address']);
								
		}else{
			$view->setHTML('Record Not Found');
		}




		if($form->isSubmitted()){
			$view->js()->reload(array('property'=>$form['property']))->execute();
		}
	}
}