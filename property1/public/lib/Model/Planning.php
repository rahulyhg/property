<?php

class Model_Planning extends Model_Table{
	public $table='plannings';
	
	function init(){
		parent::init();

		$this->hasOne('State','state_id')->mandatory(true);
		$this->hasOne('City','city_id')->mandatory(true);
		$this->hasOne('Tehsil','tehsil_id')->mandatory(true);
		$this->hasOne('Village','village_id');
		$this->addField('name')->mandatory(true);
		$this->hasMany('Property','planning_id');
		// $this->add('dynamic_model/Controller_AutoCreator');
	}
}