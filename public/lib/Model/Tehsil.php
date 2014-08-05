<?php

class Model_Tehsil extends Model_Table{
	public $table='tehsiles';
	
	function init(){
		parent::init();

		$this->hasOne('City','city_id')->mandatory(true);

		$this->addField('name')->mandatory(true);
		$this->hasMany('Planning','tehsil_id');
		$this->hasMany('Village','tehsil_id');
		$this->hasMany('DLCRates','tehsil_id');
		// $this->add('dynamic_model/Controller_AutoCreator');
	}
}