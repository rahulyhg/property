<?php

class Model_PropertyLog extends Model_Table{
	public $table='property_logs';
	
	function init(){
		parent::init();

		$this->hasOne('Party','party_id');
		$this->hasOne('Agent','agent_id');
		$this->hasOne('Property','property_id');
		$this->addField('action')->enum(array('Purchase','Sale','SaleReturned','PurchaseReturned'))->mandatory(true);
		$this->addField('created_at')->type('date')->defaultValue(date('Y-m-d'));
		$this->addField('amount');

		$this->hasMany('CTDReport','property_logs_id');	
		// $this->add('dynamic_model/Controller_AutoCreator');
	}

	function createNew($party,$agent,$property,$action,$deal_type,$transaction_type,$amount,$other_fields,$status=null){
		// throw new Exception($other_fields['receipt_no'], 1);

		if($this->loaded())
			throw $this->exception("Please Call on Empty Object of property");

		if(!$agent->loaded())
			throw $this->exception("Please pass loade object of Agent");

		if(!$party->loaded())
			throw $this->exception("Please pass loaded object of Party");
		
		if(!$property->loaded())
			throw $this->exception("Please pass loaded object of Property");

		$this['party_id']=$party->id;
		$this['agent_id']=$agent->id;
		$this['property_id']=$property->id;
		$this['action']=$action;
		if(!$amount)
			$this['amount']=$other_fields['amount'];
		else
			$this['amount']=$amount;
		$this->save();

		
		$transaction=$this->add("Model_PaymentTransaction");
		$transaction->createNew($party,$agent,$property,$deal_type,$transaction_type,$amount,$other_fields);

		if($deal_type=='Purchase')
			$transaction_type="AgentCommissionPurchase";
		if($deal_type=='Sales')
			$transaction_type="AgentCommissionSale";
		$agent_transaction=$this->add("Model_PaymentTransaction");
		$agent_transaction->createNew($party,$agent,$property,$deal_type,$transaction_type,$other_fields['agent_commission_amount'],$other_fields);

		$property=$this->add('Model_Property');
		$property->load($this['property_id']);
		$property->changeStatus($status);
		
	}

	function getProperty($property_logs_id){

		$this->load($property_logs_id);
		return $this['property_id'];
	}
}