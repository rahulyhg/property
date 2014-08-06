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
		
		$this->addhook('beforeDelete',$this);
		// $this->add('dynamic_model/Controller_AutoCreator');
	}


	function beforeDelete(){

		if($this->ref('Village')->count()->getOne()>0)
			$this->api->js()->univ()->errorMessage('Cannot delete Tehsils because it contain Villages ')->execute();
		elseif($this->ref('Planning')->count()->getOne()>0)		
			$this->api->js()->univ()->errorMessage('Cannot delete Tehsils because it contain Planning ')->execute();
		elseif ($this->ref('DLCRates')->count()->getOne()>0) 		
			$this->api->js()->univ()->errorMessage('Cannot delete Tehsils because it contain DLCRates ')->execute();
	}

}