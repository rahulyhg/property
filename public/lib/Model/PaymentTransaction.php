<?php

class Model_PaymentTransaction extends Model_Table {
	var $table= "payment_transaction";
	function init(){
		parent::init();

		$this->hasOne('Property','property_id');
		$this->hasOne('Agent','agent_id');
		$this->hasOne('Party','party_id');
		$this->addField('agent_tds_amount');
		$this->addField('receipt_no');
		$this->addField('amount');
		$this->addField('created_at');
		$this->addField('deal_type')->enum(array('Sales','SalesReturn','Purchase','PurchaseReturn'));
		$this->addField('rate');
		$this->addField('unit')->enum(array('Sqft','Biga'));

		$this->addExpression('paid_amount')->set(function($m,$q){
			return $m->refSQL('PaymentPaid')->sum('amount')->getOne();
		});
		$this->hasMany('PaymentPaid','payment_transaction_id');

		$this->add('dynamic_model/Controller_AutoCreator');
	}
}