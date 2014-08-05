<?php

class page_reports_property extends Page {
	function init(){
		parent::init();

		$tabs=$this->add('Tabs');
		$tab1=$tabs->addTabUrl('reports_registered','Register Property List');
		$tab1=$tabs->addTabUrl('reports_legal','Legal Property List');
		$tab1=$tabs->addTabUrl('reports_property_property','Property Report');
		$tab1=$tabs->addTabUrl('reports_googlemap','Search Location');
	}
}