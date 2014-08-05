<?php

class page_reports_payment_agent extends Page {
	function init(){
		parent::init();

		$form=$this->add('Form');
		$agent_field=$form->addField('dropdown','agent')->setEmptyText('Please Select')->validateNotNull();
		$agent_field->setModel('Agent');
		$form->addSubmit('GET LIST');



		$payment=$this->add('Model_PaymentTransaction');
		$payment->addCondition('transaction_type',array('AgentCommissionSale','AgentCommissionPurchase'));
		$v=$this->add('View');
		if($_GET['agent_id']){
			
			$grid=$v->add('Grid');
			$payment->addCondition('agent_id',$_GET['agent_id']);
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
			$v->js()->reload(array('agent_id'=>$form['agent']))->execute();
		}
	}

}