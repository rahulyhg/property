<?php

class page_reports_document_list extends Page {
	public $title=null;
	function init(){
		parent::init();
		$this->js(true)->_selector('#myrealm_layout_fluid_view_2_menu_objective')->hide();
		if($_GET['type']=='property'){
			$model=$this->add('Model_PropertyDocuments');
			$model->addCondition('image_id',$_GET['img_id']);
			$model->loadAny();
		}elseif ($_GET['type']=='party') {
			$model=$this->add('Model_PartyDocuments');
			$model->addCondition('image_id',$_GET['img_id']);
			$model->tryLoadAny();
		}else{
			$this->add('View_Error')->set('Unable To Find');
			exit;
		}
		$this->title='Property No ('.$model['property'].') - Image Type ('.$model['document_type'].')';

		
		$this->add('HtmlElement')->setElement('img')->setAttr('src',$model['image']);
	}
}