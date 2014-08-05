<?php

class page_manage_property extends Page {
	public $title='Manage Properties';
	function init(){
		parent::init();

		$tabs=$this->add('Tabs');
		$purchase=$tabs->addTabUrl('property_property','Properties');
		$purchase=$tabs->addTabUrl('property_sale','Sales');
		

	}
}