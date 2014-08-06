<?php

class Model_PartyDocuments extends Model_Table{
	public $table='party_documents';
	
	function init(){
		parent::init();

		$this->hasOne('Party','party_id');
		$this->hasOne('DocumentType','document_type_id');
		$this->addField('name');
		$this->add("filestore/Field_Image","image_id");
		$this->addField('submitted_on')->type('date')->defaultValue($this->api->today);

		// $this->add('dynamic_model/Controller_AutoCreator');
	}

	
}