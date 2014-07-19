<?php

class Model_PropertyLog extends Model_Table{
	public $table='property_logs';
	
	function init(){
		parent::init();

		$this->hasOne('Party','party_id');
		$this->hasOne('Agent','agent_id');
		$this->addField('action');
		$this->addField('created_at')->type('date')->defaultValue(date('Y-m-d'));
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}