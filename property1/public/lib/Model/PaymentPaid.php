<?php

class Model_PaymentPaid extends Model_Table {
	var $table= "payments_paid";
	function init(){
		parent::init();

		$this->hasOne('PaymentTransaction','payment_transaction_id');
		$this->addField('amount');
		$this->addField('created_at')->type('date')->defaultValue(date('Y-m-d'));
		$this->addField('narration');
		// $this->add('dynamic_model/Controller_AutoCreator');
	}
}