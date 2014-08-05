<?php
class page_sale extends Page{
	function init(){
		parent::init();



		$property=$this->add("Model_PaymentTransaction");
		$property->getElement('property_id')->system(true);
		$property->getElement('agent_id')->system(true);
		$property->getElement('party_id')->system(true);
		$property->getElement('transaction_type')->system(true);
		$property->getElement('deal_type')->system(true);


		$form=$this->add('Form');
		$party_field=$form->addField('dropdown','party')->setEmptyText('Please Select')->validateNotNull();
		$party=$this->add('Model_Party');
		$party_field->setModel($party->onlyCustomer());
		$agent_field=$form->addField('dropdown','agent')->setEmptyText('Please Select')->validateNotNull();
		$agent_field->setModel('Agent');
		$agent_field=$form->addField('line','agent_commission_amount');

		$property_field=$form->addField('dropdown','property')->setEmptyText('Please Select')->validateNotNull();
		$property_model=$this->add('Model_Property');
		$property_model->addCondition('status','UnSold');
		$property_field->setModel($property_model);
		$form->setModel($property);

		$form->addSubmit('Sale');

		if($form->isSubmitted()){
		$party=$this->add('Model_Party')->load($form['party']);
		$agent=$this->add('Model_Agent')->load($form['agent']);
		$property=$this->add('Model_Property')->load($form['property']);

		$property_log=$this->add('Model_PropertyLog');
		$property_log->createNew($party,$agent,$property,'Sale','Sales','ToReceive',$form['amount'],$form->getAllFields(),'Sold');
		
		$form->js(null,$form->js()->univ()->closeDialog())->_selector('.sale-grid')->trigger('reload')->execute();
		}
	}
}