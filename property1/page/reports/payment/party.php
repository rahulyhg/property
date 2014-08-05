<?php

class page_reports_payment_party extends Page {
	function init(){
		parent::init();

		$form=$this->add('Form');
		$agent_field=$form->addField('dropdown','party')->setEmptyText('Please Select')->validateNotNull();
		$party=$this->add('Model_Party')->onlyCustomer();
		$agent_field->setModel($party);
		$form->addSubmit('GET LIST');



		$payment=$this->add('Model_PaymentTransaction');
		$payment->addCondition('transaction_type',array('ToPay','ToReceive'));
		$v=$this->add('View');
		if($_GET['party_id']){
			$this->api->stickyGET('party_id');
			$grid=$v->add('Grid');
			$payment->addCondition('party_id',$_GET['party_id']);
			$grid->setModel($payment,array('property','amount','paid_amount','created_at'));
			$grid->addMethod('format_due',function($g,$f){
				return $g->current_row[$f]=$g->current_row['amount']-$g->current_row['paid_amount'];
			});
			
			$grid->addColumn('due','due_amount');
			$grid->addFormatter('due_amount','money');

			$grid->addTotals(array('amount','paid_amount','due_amount'));
			}
			else
				$v->set('No Record Found');
			

		if($form->isSubmitted()){
			$v->js()->reload(array('party_id'=>$form['party']))->execute();
		}
	}

}