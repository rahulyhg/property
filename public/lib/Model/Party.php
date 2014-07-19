<?php

class Model_Party extends Model_Table{
	public $table='parties';
	
	function init(){
		parent::init();

		$this->addField('name');
		$this->addField('is_agent')->type('boolean')->defaultValue(false);
		
		$this->hasMany('PartyDocuments','party_id');
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}