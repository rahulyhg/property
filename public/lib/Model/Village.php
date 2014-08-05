<?php

class Model_Village extends Model_Table {
	var $table= "villages";
	function init(){
		parent::init();

		$this->hasOne('Tehsil','tehsil_id')->mandatory(true);
		$this->addField('name')->mandatory(true);
		$this->hasMany('Planning','village_id');
		// $this->add('dynamic_model/Controller_AutoCreator');
	}
}