<?php

class Model_City extends Model_Table{
	public $table='cities';
	
	function init(){
		parent::init();

		$this->hasOne('State','state_id')->mandatory(true);

		$this->addField('name')->mandatory(true);
		$this->hasMany('Tehsil','city_id');
		$this->addhook('beforeDelete',$this);
		// $this->add('dynamic_model/Controller_AutoCreator');
	}

	function beforeDelete(){

		if($this->ref('Tehsil')->count()->getOne()>0)
			$this->api->js()->univ()->errorMessage('Cannot delete City because it contain Tehsils ')->execute();	
	}
}