<?php

class page_master_index extends Page {
	public $title = "Manage Masters";
	function init(){
		parent::init();
		$tabs = $this->add('Tabs');

		$state_tab = $tabs->addTab('States');
		$state_crud = $state_tab->add('CRUD');
		$state_crud->setModel('State');

		$city_tab =$tabs->addTab('Cities');
		$city_crud = $city_tab->add('CRUD');
		$city_crud->setModel('City');

		$tehsil_tab = $tabs->addTab('Tehsils');
		$tehsil_crud = $tehsil_tab->add('CRUD');
		$tehsil_crud->setModel('Tehsil');

		$doc_type_tab = $tabs->addTab('Document Types');
		$doc_type_crud = $doc_type_tab->add('CRUD');
		$doc_type_crud->setModel('DocumentType');

		$prop_type_tab = $tabs->addTab('Property Types');
		$prop_type_crud = $prop_type_tab->add('CRUD');
		$prop_type_crud->setModel('PropertyType');

 		$conv_type_tab = $tabs->addTab('Conversion Types');
 		$conv_type_crud = $conv_type_tab->add('CRUD');
 		$conv_type_crud->setModel('ConversionType');

 		


	}
}