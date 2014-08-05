<?php

class Model_ConversionTypeDocument extends Model_Table{
	public $table='conversiontype_documents';
	
	function init(){
		parent::init();

		$this->hasOne('ConversionType','conversion_type_id');
		$this->addField('name');
		$this->addField('template')->type('text')->display(array('form'=>'RichText'));
		$this->hasMany('CTDReport','conversiontype_documents_id');
		$this->add('dynamic_model/Controller_AutoCreator');
	
	}
}