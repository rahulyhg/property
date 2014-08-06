<?php

class Model_DLCRates extends Model_Table {
	var $table= "DLCRates";
	function init(){
		parent::init();

		$this->hasOne('Tehsil','tehsil_id');
		$this->addField('name')->caption('Rate');
		$this->addField('year');
		// $this->add('dynamic_model/Controller_AutoCreator');
	}
}