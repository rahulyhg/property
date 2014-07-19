<?php

class Model_Planning extends Model_Table{
	public $table='plannings';
	
	function init(){
		parent::init();

		$this->hasOne('Tehsil','tehsil_id');
		$this->addField('name');
		$this->hasMany('Property','planning_id');
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}