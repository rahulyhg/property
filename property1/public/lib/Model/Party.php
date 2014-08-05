<?php

class Model_Party extends Model_Table{
	public $table='parties';
	
	function init(){
		parent::init();

		$this->addField('name')->mandatory(true);
		$this->addField('father_name')->mandatory(true);
		$this->addField('address')->type('text')->mandatory(true);
		$this->addField('dob')->type('date')->mandatory(true);
		$this->addField('ph_no')->mandatory(true);
		$this->addField('pancard_no');
		$this->add('filestore/Field_Image','image_id');
		$this->addField('is_agent')->type('boolean')->defaultValue(false);
		$this->hasMany('PartyDocuments','party_id');
		$this->hasMany('PaymentTransaction','party_id');
		$this->hasMany('PropertyLog','party_id');
		
		// $this->add('dynamic_model/Controller_AutoCreator');
	}

	function onlyCustomer(){
		return $this->addCondition('is_agent',false);
	}
}