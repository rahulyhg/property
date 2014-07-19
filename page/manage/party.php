<?php

class page_manage_party extends Page {
	public $title='Manage Parties';
	function init(){
		parent::init();

		$party_crud = $this->add('CRUD');
		$party_crud->setModel('Party');

		if(!$party_crud->isEditing()){
			$doc_crud = $party_crud->addRef('PartyDocuments');
			if($doc_crud  and ($g = $doc_crud->grid)){
				$g->addMethod('format_picture',array($this->add('Formatters'),'format_picture'));
				$g->addFormatter('image','picture');
			}
		}
	}
}