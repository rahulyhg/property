<?php

class Form_Field_RichText extends Form_Field_Text{
	function init(){
		parent::init();
		$this->addClass('tinymce');
		// $this->js(true)->_load('tinymce/xepan6.tinymce');
		// $this->js(true)->univ()->xtinymce();
	}
}