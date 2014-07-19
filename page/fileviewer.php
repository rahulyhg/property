<?php

class page_fileviewer extends Page {
	function init(){
		parent::init();
		$im=$this->add('filestore/Model_Image')->load($_GET['file_id']);
		$this->add('View')->setElement('img')->setAttr('src',$im['url']);
	}
}