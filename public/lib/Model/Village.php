<?php

class Model_Village extends Model_Table {
	var $table= "villages";
	function init(){
		parent::init();

		$this->hasOne('Tehsil','tehsil_id')->mandatory(true);
		$this->addField('name')->mandatory(true);
		
		$this->addhook('beforeDelete',$this);
		$this->hasMany('Planning','village_id');
		// $this->add('dynamic_model/Controller_AutoCreator');
	}

	function beforeDelete(){

		if($this->ref('Planning')->count()->getOne()>0)
			$this->api->js()->univ()->errorMessage('Cannot delete Village because it has many Planning ')->execute();	
	}
}