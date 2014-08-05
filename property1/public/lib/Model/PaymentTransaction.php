<?php

class Model_PaymentTransaction extends Model_Table {
	var $table= "payment_transaction";
	function init(){
		parent::init();

		$this->hasOne('Property','property_id');
		$this->hasOne('Agent','agent_id');
		$this->hasOne('Party','party_id');
		$this->addField('receipt_no')->type('int');
		$this->addField('amount');
		$this->addField('agent_tds_amount');
		$this->addField('created_at')->type('date')->defaultValue(date('Y-m-d'));
		$this->addField('deal_type')->enum(array('Sales','SalesReturn','Purchase','PurchaseReturn'));
		$this->addField('transaction_type')->enum(array('ToPay','ToReceive','AgentCommissionSale','AgentCommissionPurchase'));
		$this->addField('rate');
		$this->addField('unit')->enum(array('Sqft','Biga'));
		$this->hasMany('PaymentPaid','payment_transaction_id');

		$this->addExpression('paid_amount')->set(function($m,$q){
			return $m->refSQL('PaymentPaid')->sum('amount');
		});




		// $this->addExpression('tds_amount')->set(function($m,$q){

		// 	$agent = $m->refSQL('agent_id')->_dsql()->del('fields')->field('pancard_no')->render();

		// 	return '(IF(('.$agent.') is null, ('.$q->getField('amount').'*10)/100, ('.$q->getField('amount').'*10)/100))';
		// });

		// $this->addExpression('maturity_date')->set(function($m,$q){
		// 	return "DATE_ADD(DATE(".$q->getField('created_at')."), INTERVAL +".$m->scheme_join->table_alias.".MaturityPeriod MONTH)";
		// });


		// $this->add('dynamic_model/Controller_AutoCreator');
	}

	function createNew($party,$agent,$property,$deal_type,$transaction_type,$amount=null,$other_fields=null){

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
		$this['receipt_no']=$this->newReceiptNo();
		if(!$amount)
			$this['amount']=$other_fields['amount'];
		else
			$this['amount']=$amount;
		$this['deal_type']=$deal_type;
		$this['transaction_type']=$transaction_type;
		$this['rate']=$other_fields['rate'];
		$this['unit']=$other_fields['unit'];

		if($this->ref('agent_id')->get('pancard_no'))
			$this['agent_tds_amount']=($other_fields['amount']*10)/100;
		else
			$this['agent_tds_amount']=($other_fields['amount']*20)/100;
		$this['unit']=$other_fields['unit'];
		$this->save();
	}

	function newReceiptNo(){
		$old_no=$this->add('Model_PaymentTransaction');
		$old_no->setOrder('receipt_no','desc');
		$old_no->tryLoadAny();

		return $old_no['receipt_no']+1;
	}

}