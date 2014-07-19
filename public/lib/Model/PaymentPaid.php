<?php

class Model_PaymentPaid extends Model_Table {
	var $table= "PaymentPaid";
	function init(){
		parent::init();

		$this->hasOne('PaymentTrasaction','payment_transaction_id');
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}