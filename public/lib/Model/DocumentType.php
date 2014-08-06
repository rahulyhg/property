<?php

class Model_DocumentType extends Model_Table{
	public $table='document_types';
	
	function init(){
		parent::init();

		$this->addField('name')->mandatory(true);
		$this->hasMany('PropertyDocuments','document_type_id');
		$this->hasMany('PartyDocuments','document_type_id');
		
		$this->addhook('beforeDelete',$this);
		// $this->add('dynamic_model/Controller_AutoCreator');
	}

	function beforeDelete(){

		if($this->ref('PropertyDocuments')->count()->getOne()>0)
			$this->api->js()->univ()->errorMessage('Cannot delete Document Type because it has so many property document')->execute();	
		if($this->ref('PartyDocuments')->count()->getOne()>0)
			$this->api->js()->univ()->errorMessage('Cannot delete Document Type because it has so many Party document')->execute();
	}
}