<?php

class page_reports_documents extends Page {
	function init(){
		parent::init();

		$tabs=$this->add('Tabs');
		$tab1=$tabs->addTabUrl('reports_document_agent','Agent Document');
		$tab1=$tabs->addTabUrl('reports_document_property','Property Document');
		$tab1=$tabs->addTabUrl('reports_document_customer','Customer Document');
	

	}
}