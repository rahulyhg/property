<?php

class page_index extends Page{
	function init(){
		parent::init();
		// $this->add('Model_State');
		$this->add('View_Info')->set('Property Software Under Testing.....');
	}
}