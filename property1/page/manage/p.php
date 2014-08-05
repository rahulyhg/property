<?php

class page_manage_p extends Page {
	public $title="Manage Agent & Party";
	function init(){
		parent::init();
		$tabs=$this->add('Tabs');
		$tab1=$tabs->addTabUrl('p_a','Agent');
		$tab1=$tabs->addTabUrl('p_p','Party');
	}
}