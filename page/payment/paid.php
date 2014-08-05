<?php

class page_payment_paid extends Page{
	public $title='Payment Paid';
	function page_index(){
		// parent::init();

		$crud=$this->add('xCRUD',array('allow_add'=>false));

		$received_transaction_model=$this->add('Model_PaymentTransaction');
		$received_transaction_model->addCondition('transaction_type',array('ToPay','AgentCommissionPurchase'));
		
		$crud->setModel($received_transaction_model);		
	
		if($g=$crud->grid){
			$g->addPaginator(10);
			$g->addQuickSearch(array('name'));
			$g->addColumn('expander','payments');
			$g->addMethod('format_hide',function($g,$f){
				if($g->model['transaction_type']=='AgentCommissionPurchase')
						return $g->current_row_html[$f]='N/A';
			});

			$g->addFormatter('agent_tds_amount','hide');
		}
		


	}


	function page_payments(){
		$this->api->stickyGET('payment_transaction_id');

		$crud=$this->add('CRUD');
		$payment=$this->add('Model_PaymentPaid');
		$payment->addCondition('payment_transaction_id',$_GET['payment_transaction_id']);
		$crud->setModel($payment,array('amount','creted_at','narration'));
	}
}