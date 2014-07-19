<?php

class Model_Property extends Model_Table{
	public $table='properties';
	
	function init(){
		parent::init();

		$this->hasOne('PropertyType','property_type_id');
		$this->hasOne('Planning','planning_id');
		$this->hasOne('ConversionType','conversion_type_id');
		$this->addField('name');
		$this->addField('status')->enum(array('Sold','UnSold','Returned'))->defaultValue('UnSold');
		$this->addField('is_legal')->type('boolean')->defaultValue(false);

		$this->hasMany('PropertyLog','property_id');
		$this->hasMany('PropertyDocuments','property_id');

		// $planning_join = $this->leftJoin('plannings','planning_id');
		// $planning_join->hasOne('Tehsil','tehsil_id');
		
		// $tehsil_join = $planning_join->leftJoin('tehsiles','tehsil_id');
		// $tehsil_join->hasOne('City','city_id');


		$this->add('dynamic_model/Controller_AutoCreator');
	}

	function sale(Model_Party $party){

	}

	function return_it(){

	}

	function return_by_me(){

	}

	function return_to_me(){

	}
}