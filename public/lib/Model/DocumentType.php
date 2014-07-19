<?php

class Model_DocumentType extends Model_Table{
	public $table='document_types';
	
	function init(){
		parent::init();

		$this->addField('name');
		$this->hasMany('PropertyDocuments','document_type_id');
		$this->hasMany('PartyDocuments','document_type_id');
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}