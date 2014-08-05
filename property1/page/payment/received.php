<?php

class page_payment_received extends Page{
	public $title='Payment Paid';
	function page_index(){
		// parent::init();

		$crud=$this->add('xCRUD',array('allow_add'=>false));

		$received_transaction_model=$this->add('Model_PaymentTransaction');
		$received_transaction_model->addCondition('transaction_type',array('ToReceive','AgentCommissionSale'));
		$crud->addHook('myupdate',function($crud,$form){
			if($crud->isEditing('edit')) return false; // Always required to bypass the bellow code in editing crud mode
			
			// Do your stuff by getting $form data
			$received_transaction = $crud->add('Model_PaymentTransaction');
			// CreatNew Function call
			$received_transaction->purchase();
			return true; // Always required
		});
		
	
		$crud->setModel($received_transaction_model);		
		if($g=$crud->grid){
			$g->addPaginator(10);
			$g->addQuickSearch(array('name'));
			$g->addColumn('expander','payments');

			$g->addMethod('format_due',function($g,$f){
				return $g->current_row[$f]=$g->current_row['amount']-$g->current_row['paid_amount'];
			});

			$g->addMethod('format_hide',function($g,$f){
				if($g->model['transaction_type']=='AgentCommissionSale')
						return $g->current_row_html[$f]='';
			});

			
			$g->addColumn('due','due');
			$g->addFormatter('due','money');
			$g->addFormatter('agent_tds_amount','hide');
			$g->addOrder()->move('due','after','paid_amount')->now();

			$g->addClass('paid-grid');
			$g->js('reload')->reload();
		}




	}

	function page_payments(){
		$this->api->stickyGET('payment_transaction_id');

		$crud=$this->add('CRUD');
		$payment=$this->add('Model_PaymentPaid');
		$payment->addCondition('payment_transaction_id',$_GET['payment_transaction_id']);
		$crud->setModel($payment,array('amount','creted_at','narration'));
		if($crud->form->isSubmitted()){
			$crud->form->js(null,$crud->form->js()->univ()->closeDialog())->_selector('.paid-grid')->trigger('reload')->execute();
		}
	}
}