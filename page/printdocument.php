<?php
class page_printdocument extends Page{
	function init(){
		parent::init();

		$v=$this->add('View');
		if($_GET['id']){
			$report=$this->add('Model_CTDReport');
			$report->load($_GET['id']);
			$v->setHtml($report['template']);			
		}else{
			$v->set('Report not Found');
		}		
	}
}	