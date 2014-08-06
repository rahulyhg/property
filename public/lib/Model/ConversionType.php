<?php

class Model_Conversiontype extends Model_Table{
	public $table='conversion_types';
	
	function init(){
		parent::init();

		$this->addField('name')->mandatory(true);

		$this->hasMany('Property','conversion_type_id');
		$this->hasMany('ConversionTypeDocument','conversion_type_id');
		// $this->hasMany('CTDReport','conversion_type_id');
		
		$this->addhook('beforeDelete',$this);
		// $this->add('dynamic_model/Controller_AutoCreator');
	}


	function beforeDelete(){
		if($this->ref('Property')->count()->getOne())
			$this->api->js()->univ()->errorMessage('cannot delete Convertion Type because it has proprty ');
		if($this->ref('ConversionTypeDocument')->count()->getOne())
			$this->api->js()->univ()->errorMessage('cannot delete Convertion Type because it has Conversion Type Document ');
		// if($this->ref('CTDReport')->count()->getOne())
		// 	$this->api->js()->univ()->errorMessage('cannot delete Convertion Type because it has Conversion type Document Report');
	}


}