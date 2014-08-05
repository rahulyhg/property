<?php

class page_reports_legal extends Page {
	function init(){
		parent::init();

		$grid=$this->add("Grid");
		$property=$this->add('Model_Property');
		$property->addCondition('is_legal',true);

		$grid->setModel($property);
		
	}
}