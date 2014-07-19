<?php

class Model_PropertyDocuments extends Model_Table{
	public $table='property_documents';
	
	function init(){
		parent::init();

		$this->hasOne('Property','property_id');
		$this->hasOne('DocumentType','document_type_id');
		$this->addField('name');
		$this->add("filestore/Field_Image","image_id")->type('image');
		$this->add('dynamic_model/Controller_AutoCreator');
	}
}