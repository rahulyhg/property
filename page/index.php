<?php

class page_index extends Page{
	function init(){
		parent::init();
		$this->add('Model_State');
	}
}