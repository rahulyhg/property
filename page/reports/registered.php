<?php

class page_reports_registered extends Page {
	function init(){
		parent::init();

		$grid=$this->add("Grid");
		$property=$this->add('Model_Property');
		$property->addCondition('is_registered',true);

		$grid->setModel($property);
		
	}
}