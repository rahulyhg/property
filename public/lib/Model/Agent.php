<?php
class Model_Agent extends Model_Party {
	function init(){
		parent::init();

		$this->addCondition('is_agent',true);
		$this->hasMany('PropertyLog','agent_id');

	}
}