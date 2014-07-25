<?php

class page_manage_property extends Page {
	public $title='Manage Properties';
	function init(){
		parent::init();

		$tabs=$this->add('Tabs');
		$purchase=$tabs->addTabUrl('property_purchase','Purchase');
		$purchase=$tabs->addTabUrl('property_sale','Sale');
		$purchase=$tabs->addTabUrl('property_salereturn','SaleReturn');
		$purchase=$tabs->addTabUrl('property_purchasereturn','PurchaseReturn');
		

	}
}