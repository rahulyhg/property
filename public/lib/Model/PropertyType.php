<?php

class Model_PropertyType extends Model_Table{
	public $table='property_types';
	
	function init(){
		parent::init();

		$this->addField('name');
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}