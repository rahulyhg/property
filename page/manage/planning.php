<?php

class page_manage_planning extends Page{
	public $title='Manage Plannings';
	
	function init(){
		parent::init();
		$planning_crud = $this->add('CRUD');
		$planning_crud->setModel('Planning');
	}
}