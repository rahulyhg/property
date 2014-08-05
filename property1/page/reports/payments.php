<?php

class page_reports_payments extends Page {
	function init(){
		parent::init();

		$tabs=$this->add('Tabs');
		$tab1=$tabs->addTabUrl('reports_payment_agent','Agent Payment Status');
		$tab1=$tabs->addTabUrl('reports_payment_party','Party Payment Status');
	}
}