<?php

class Model_Conversiontype extends Model_Table{
	public $table='conversion_types';
	
	function init(){
		parent::init();

		$this->addField('name')->mandatory(true);
		$this->hasMany('Property','conversion_type_id');
		
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}