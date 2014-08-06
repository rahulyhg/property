<?php

class page_property_property extends Page {
	function page_index(){
		// parent::init();
		$this->api->stickyGET('party');
		$this->api->stickyGET('agent');
		$crud=$this->add('xCRUD');

		$property_model=$this->add('Model_Property');
		// $property_model->addCondition('status','Unsold');

		if($crud->isEditing('add')){
			$agent_field=$crud->form->addField('dropdown','agent')->setEmptyText('Please Select');
			$agent_field->setModel('Agent');
			$party_field=$crud->form->addField('dropdown','party')->setEmptyText('Please Select');
			$party=$this->add('Model_Party');
			$party->onlyCustomer();
			$party_field->setModel($party);
			$crud->form->addField('line','agent_commission_amount');
			$crud->form->addField('line','amount');
			$crud->form->addField('line','rate');
			$crud->form->addField('dropdown','unit')->setValueList(array('Sqft'=>'Sqft','Biga'=>'Biga'));
			$crud->form->addField('DatePicker','created_at')->set(date('Y-m-d'));
			$property_model->getElement('status')->system(true);
		}
		if($crud->isEditing('edit'))
			$property_model->getElement('status')->system(true);
			

		$crud->addHook('myupdate',function($crud,$form){
			if($crud->isEditing('edit')) return false; // Always required to bypass the bellow code in editing crud mode

			// echo "<pre>";
			// print_r($crud->form->getAllFields());
			// echo "</pre>";
			// throw new Exception($crud->form['property_type_id'], 1);
			
			// Do your stuff by getting $form data
			$property = $crud->add('Model_Property');
			// CreatNew Function call
			$agent=$crud->add('Model_Agent')->load($crud->form['agent']);
			$party=$crud->add('Model_Party')->load($crud->form['party']);
			$property_type=$crud->add('Model_PropertyType')->load($crud->form['property_type_id']);
			$planning=$crud->add('Model_Planning')->load($crud->form['planning_id']);
			$conversion_type=$crud->add('Model_ConversionType')->load($crud->form['conversion_type_id']);



			$property->createNew($agent,$party,$property_type,$planning,$conversion_type,$form->getAllFields());
			

			return true; // Always required
		});
		
		$crud->setModel($property_model);		
		// $crud->addRef('PropertyDocuments');
	
		if($g=$crud->grid){
			$g->addPaginator(10);
			$g->addQuickSearch(array('name'));
			$g->addColumn('expander','details');
			$g->addColumn('expander','return');
			$g->addColumn('expander','documents');			

			$g->addMethod('format_return',function($g,$f){
				if($g->model['status']=='Returned')
					$g->current_row_html[$f]='Return';
				if($g->model['status']=='Sold')
					$g->current_row_html[$f]='Sold';
			});

			$g->addFormatter('return','return');

			$g->addClass('purchase-grid');
			$g->js('reload')->reload();
		}

		// if($crud->isEditing()){
		// 	$property_model->getElement('status')->system(true);
		// }


		
	}

	function page_details(){
		$this->api->stickyGET('properties_id');

		$grid=$this->add('CRUD',array('allow_add'=>false,'allow_del'=>false));

		$log=$this->add('Model_PropertyLog');
		$log->addCondition('property_id',$_GET['properties_id']);

		$log->setOrder('id','desc');

		$grid->setModel($log);

	}

	function page_return(){
		$this->api->stickyGET('properties_id');
			  	
		$form=$this->add('Form');
		$form->addField('line','return_amount')->validateNotNull();
		$form->addSubmit('Return');

		if($form->isSubmitted()){
			$property=$this->add('Model_Property');
			$property->load($_GET['properties_id']);
			
			$property->return_it('PurchasedReturn',$form['return_amount']);


			$form->js(null,$form->js()->univ()->closeExpander())->_selector('.purchase-grid')->trigger('reload')->execute();
		}


	}


	function page_documents(){
		$this->api->stickyGET('properties_id');

		$crud=$this->add('CRUD');
		$documents=$this->add('Model_PropertyDocuments');
		$documents->addCondition('property_id',$_GET['properties_id']);
		$crud->setModel($documents);
	}
		
}