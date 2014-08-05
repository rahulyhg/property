<?php
class Model_Customer extends Model_Party {
	function init(){
		parent::init();

		$this->addCondition('is_agent',false);

	}
}