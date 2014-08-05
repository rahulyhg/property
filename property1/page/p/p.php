<?php
class page_p_p extends Page {
	public $title='Manage Parties';
	function page_index(){
		// parent::init();
		$this->rename('a');
		$party_crud = $this->add('CRUD');
		$party=$this->add('Model_Party');

		$party_crud->setModel($party->onlyCustomer());

		if(!$party_crud->isEditing()){
			$doc_crud = $party_crud->addRef('PartyDocuments',array('label'=>'Documents'));
			if($doc_crud  and ($g = $doc_crud->grid)){
				$g->addMethod('format_picture',array($this->add('Formatters'),'format_picture'));
				$g->addFormatter('image','picture');

			}
			
		}



	}


	function page_payements(){
		$this->api->stickyGET('parties_id');

		$grid=$this->add('Grid');
		$payment=$this->add('Model_PaymentTransaction');
		$payment->addCondition('agent_id',$_GET['parties_id']);
		$grid->setModel($payment,array('property','created_at','deal_type'));
	}
}