<?php

class page_reports_property_property extends Page {
	function init(){
		parent::init();

		$form=$this->add("Form");
		$form->addField('dropdown','status')->setValueList(array('Purchase'=>'Purchase','Sale'=>'Sale','SaleReturned'=>'SaleReturned','PurchaseReturned'=>'PurchaseReturned'))->setEmptyText('Please Select');
		$form->addField('DatePicker','from_date');
		$form->addField('DatePicker','to_date');
		$form->addSubmit('GET LIST');

		$grid=$this->add('Grid');

		$property_log=$this->add("Model_PropertyLog");
		if($_GET['filter']){
			
			if($_GET['status'])
				$property_log->addCondition('action',$_GET['status']);
			if($_GET['from_date'])
				$property_log->addCondition('created_at','>=',$_GET['from_date']);
			if($_GET['to_date'])
				$property_log->addCondition('created_at','<=',$_GET['to_date']);
		}
		else{
			$property_log->addCondition('id',-1);
		}

		$grid->setModel($property_log);

		if($form->isSubmitted()){
			
			$grid->js()->reload(array('status'=>$form['status'],'to_date'=>$form['to_date']?:0,'from_date'=>$form['from_date']?:0,'filter'=>1))->execute();
		}
	}
}