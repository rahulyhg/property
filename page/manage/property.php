<?php

class page_manage_property extends Page {
	public $title='Manage Properties';
	function init(){
		parent::init();

		$property_crud = $this->add('CRUD');
		$property_crud->setModel('Property');

		if(!$property_crud->isEditing()){
			$doc_crud = $property_crud->addRef('PropertyDocuments');
			if($doc_crud  and ($g = $doc_crud->grid)){
				$g->addMethod('format_picture',array($this->add('Formatters'),'format_picture'));
				$g->addFormatter('image','picture');
			}

		}

		if($property_crud->grid){
			$property_crud->grid->addColumn('Expander','action');
		}


	}
}