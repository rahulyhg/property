<?php

class Model_Property extends Model_Table{
	public $table='properties';
	
	function init(){
		parent::init();

		$this->hasOne('PropertyType','property_type_id')->mandatory(true);
		$this->hasOne('Planning','planning_id')->mandatory(true);
		$this->hasOne('ConversionType','conversion_type_id')->mandatory(true);
		$this->addField('name')->mandatory(true);
		$this->addField('status')->enum(array('Sold','UnSold','Returned'))->defaultValue('UnSold');
		$this->addField('is_legal')->type('boolean')->defaultValue(false);
		$this->addField('is_registered')->type('boolean')->defaultValue(false);
		$this->addField('google_map_address')->type('text');

		$this->hasMany('PropertyLog','property_id');
		$this->hasMany('PaymentTransaction','property_id');
		$this->hasMany('PropertyDocuments','property_id');

		// $planning_join = $this->leftJoin('plannings','planning_id');
		// $planning_join->hasOne('Tehsil','tehsil_id');
		
		// $tehsil_join = $planning_join->leftJoin('tehsiles','tehsil_id');
		// $tehsil_join->hasOne('City','city_id');
		$this->addHook('beforeSave',$this);

		// $this->add('dynamic_model/Controller_AutoCreator');
	}

	function beforeSave(){
		$old_property=$this->add('Model_Property');
		$old_property->addCondition('name',$this['name']);
		if($this->loaded())
			$old_property->addCondition('id','<>',$this['id']);
		$old_property->tryLoadAny();
		if($old_property->loaded())
			throw new Exception("Property Allready Exit take another Name ");
			
	}

	function sale(){

	}

	function return_it($type,$return_amount){

		if($type=='PurchasedReturn')
			$this->return_by_me($return_amount);
		else
			$this->return_to_me($return_amount);
	}

	function return_by_me($return_amount){
		$transaction=$this->add('Model_PaymentTransaction');
		$transaction->addCondition('property_id',$this->id);
		$transaction->addCondition('deal_type','Purchase');
		$transaction->setOrder('id','desc');
		$transaction->tryLoadAny();

		$party=$this->add('Model_Party')->load($transaction['party_id']);
		$agent=$this->add('Model_Agent')->load($transaction['agent_id']);
		$property_log=$this->add('Model_PropertyLog');
		$property_log->createNew($party,$agent,$this,'PurchaseReturned','PurchaseReturn','ToReceive',$return_amount,null,'Returned');

	}

	function return_to_me($return_amount){

		$transaction=$this->add('Model_PaymentTransaction');
		$transaction->addCondition('property_id',$this->id);
		$transaction->addCondition('deal_type','Sales');
		$transaction->setOrder('id','desc');
		$transaction->tryLoadAny();

		$party=$this->add('Model_Party')->load($transaction['party_id']);
		$agent=$this->add('Model_Agent')->load($transaction['agent_id']);
		$property_log=$this->add('Model_PropertyLog');
		$property_log->createNew($party,$agent,$this,'SalesReturned','SalesReturn','ToPay',$return_amount,null,'UnSold');
	}

	function createNew($agent,$party,$property_type,$planing,$conversion_type,$other_fields){
		if($this->loaded())
			throw $this->exception("Please Call on Empty Object of property");

		if(!$agent->loaded())
			throw $this->exception("Please pass loade object of Agent");

		if(!$party->loaded())
			throw $this->exception("Please pass loaded object of Customer");
		
		if(!$property_type->loaded())
			throw $this->exception("Please pass loaded object of PropertyType");

		if(!$planing->loaded())
			throw $this->exception("Please pass loaded object of Planing");
		
		if(!$conversion_type->loaded())
			throw $this->exception("Please pass loaded object of conversion_type");
		
		$this['property_type_id']=$property_type->id;
		$this['planning_id']=$planing->id;
		$this['conversion_type_id']=$conversion_type->id;
		$this['name']=$other_fields['name'];
		$this['status']='UnSold';
		$this['is_legal']=$other_fields['is_legal'];
		$this->save();
		$entry_in_log=$this->add("Model_PropertyLog");
		$entry_in_log->createNew($party,$agent,$this,'Purchase','Purchase','ToPay',null,$other_fields,'UnSold');
		
	}

	function changeStatus($status){
		if(!$status)
			$status='UnSold';
		$this['status']=$status;
		$this->save();
	}
}