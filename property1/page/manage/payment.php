<?php

class page_manage_payment extends Page{
	public $title="Payments";
	function init(){
		parent::init();

		$tabs=$this->add('Tabs');
		$tab1=$tabs->addTabUrl('payment_received','Payment Received');
		$tab1=$tabs->addTabUrl('payment_paid','Payment Payable');

	}
}