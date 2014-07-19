<?php

class Model_PropertyLog extends Model_Table{
	public $table='property_logs';
	
	function init(){
		parent::init();

		$this->addField('name');
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}