<?php

class Model_State extends Model_Table{
	public $table='states';

	function init(){
		parent::init();

		$this->addField('name');
		$this->hasMany('City','state_id');
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}