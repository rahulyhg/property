<?php

class Model_Party extends Model_Table{
	public $table='parties';
	
	function init(){
		parent::init();

		$this->addField('name');
		$this->addField('father_name');
		$this->addField('address')->type('text');
		$this->addField('dob')->type('date');
		$this->addField('ph_no');
		$this->addField('pancard_no')->type('int');
		$this->add('filestore/Field_Image','agent_image_id');
		$this->addField('is_agent')->type('boolean')->defaultValue(false);
		$this->hasMany('PartyDocuments','party_id');
		$this->hasMany('PaymentTransaction','party_id');
		$this->hasMany('PropertyLog','party_id');
		
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}