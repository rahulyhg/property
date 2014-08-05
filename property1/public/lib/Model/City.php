<?php

class Model_City extends Model_Table{
	public $table='cities';
	
	function init(){
		parent::init();

		$this->hasOne('State','state_id')->mandatory(true);

		$this->addField('name')->mandatory(true);
		$this->hasMany('Tehsil','city_id');
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}