<?php

class page_manage_reports extends Page{
	public $title="Reports";
	function init(){
		parent::init();

		$tabs=$this->add('Tabs');
		$tab1=$tabs->addTabUrl('reports_property','Property');
		$tab1=$tabs->addTabUrl('reports_documents','Documents');
		$tab1=$tabs->addTabUrl('reports_payments','Payments');
		
		

	}
}