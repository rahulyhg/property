<?php

class page_property_sale extends Page {
	function page_index(){
		// parent::init();

	$btn=$this->add('Button')->set('Add');
	$btn->js('click',$this->js()->univ()->frameURL('Sale Property',$this->api->url('sale')));

	$crud=$this->add('CRUD',array('allow_add'=>false,'allow_edit'=>false));
	$property_model=$this->add('Model_Property');
	$property_model->addCondition('status','Sold');
	$crud->setModel($property_model);		

		if($g=$crud->grid){
			$crud->grid->addColumn('expander','return');
			$crud->grid->addColumn('expander','details');
			
			$g->addClass('sale-grid');
			$g->js('reload')->reload();


		}
	}

	function page_return(){
		$this->api->stickyGET('properties_id');

		// $this->api->stickyGET('property_logs_id');
		// $property_log=$this->add('Model_PropertyLog');
		// $property_log->load($_GET['property_logs_id']);


		$form=$this->add('Form');
		$form->addField('line','return_amount')->validateNotNull();
		$form->addSubmit('Return');

		if($form->isSubmitted()){
			$property=$this->add('Model_Property');
			$property->load($_GET['properties_id']);
			
			$property->return_it('SalesReturn',$form['return_amount']);

			$form->js()->_selector('.sale-grid')->trigger('reload')->execute();
		}
	}

	function page_details(){
		$this->api->stickyGET('properties_id');

		$crud=$this->add('CRUD',array('allow_add'=>false,'allow_del'=>false,'allow_edit'=>false));


		$log=$this->add('Model_PropertyLog');
		$log->addCondition('property_id',$_GET['properties_id']);

		$log->setOrder('id','desc');

		$crud->setModel($log);
		
		if($crud->grid)
			$crud->grid->addColumn('expander','conversiontypedocuments','Conversion Type Documents');

	}

	function page_details_conversiontypedocuments(){

		$this->api->stickyGET('property_logs_id');
		$property_log=$this->add('Model_PropertyLog');

		$property_id=$property_log->getProperty($_GET['property_logs_id']);		
		$property=$this->add('Model_Property');
		$conversion_type_id=$property->getConvertionType($property_id);

		$templtes_for_this_conversion_type= $this->add('Model_ConversionTypeDocument');
		$templtes_for_this_conversion_type->addCondition('conversion_type_id',$conversion_type_id);

		$form = $this->add('Form');
		$form->addField('DropDown','documents')->setModel($templtes_for_this_conversion_type);
		$form->addSubmit('Create');

		if($form->isSubmitted()){
			$ctd_report=$this->add('Model_CTDReport');
			// throw new Exception($form['documents']);
			$ctd_report->createNew($_GET['property_logs_id'],$form['documents']);
			$form->js()->univ()->successMessage('Document Created Succesfully');		
		}
		
		$crud=$this->add('CRUD',array('allow_add'=>false));
		$reports=$this->add('Model_CTDReport');
		$reports->addCondition('property_logs_id',$_GET['property_logs_id']);	
		$crud->setModel($reports);
	}

	
}