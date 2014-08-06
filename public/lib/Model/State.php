<?php

class Model_State extends Model_Table{
	public $table='states';

	function init(){
		parent::init();

		$this->addField('name')->mandatory(true);
		$this->hasMany('City','state_id');

		$this->addhook('beforeDelete',$this);
		// $this->add('dynamic_model/Controller_AutoCreator');
	}

	function beforeDelete(){

		if($this->ref('City')->count()->getOne()>0)
			$this->api->js()->univ()->errorMessage('Cannot delete State because it contain cities ')->execute();	
	}

}