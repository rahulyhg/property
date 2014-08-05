<?php

class Form_Field_RichText extends Form_Field_Text{
	function init(){
		parent::init();
		// $this->addClass('summernote');
		$this->js(true)->_load('summernote-master/bootstrap.min')->_load('summernote-master/summernote')->summernote();
		// $this->js(true)->univ()->xsummernote();
	}
}