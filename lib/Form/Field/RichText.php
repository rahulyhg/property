<?php

class Form_Field_RichText extends Form_Field_Text{
	function init(){
		parent::init();
		$this->addClass('elrte');
		$this->addClass('hindi');
		$this->js()->_load('rte');
		$this->js(true)->univ()->alertme();
	}

	function getInput($attr=array()){
	    return parent::getInput(array_merge(
	        array(
	            'value'=>'',
	             ),$attr
	        ));
	}

	// function render(){

	// 	// $this->js(true)->univ()->createRTE(array(
	// 	// 									'toolbar'=>'complete'
	// 	// 									)
	// 	// 						);
	// 	parent::render();
	// }

	// function render(){
	// 	$this->js(true)->tinymce(array(	
	// 		'toolbar1'=>'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
	// 		'toolbar2' => 'print preview media | forecolor backcolor emoticons',
	// 		'image_advtab' =>true, 
	// 		'plugins'=> 'advlist autolink lists link image charmap print preview hr anchor pagebreak searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking save table contextmenu directionality emoticons template paste textcolor'
	// 		)
	// 	);
	// 	parent::render();
	// }
}