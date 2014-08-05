<?php

class page_manage_planning extends Page{
	public $title='Manage Plannings';
	
	function init(){
		parent::init();
		$planning_crud = $this->add('CRUD');
		$planning=$this->add('Model_Planning');
		$planning_crud->setModel($planning);

		if($planning_crud->isEditing()){

			$state_field=$planning_crud->form->getElement('state_id')->setEmptyText('asd');
			$city_field=$planning_crud->form->getElement('city_id');
			$tehsil_field=$planning_crud->form->getElement('tehsil_id');
			$village_field=$planning_crud->form->getElement('village_id');
				
			// if($_GET['state_id'])
			// 	$planning->getElement('city_id')->getModel()->addCondition('state_id',$_GET['state_id']);
				
				

			// $state_field->js('change',$planning_crud->form->js()->atk4_form('reloadField','city_id',array($this->api->url(),'state_id'=>$state_field->js()->val())));


		}
	}
}