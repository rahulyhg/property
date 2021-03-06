<?php

class Model_CTDReport extends Model_Table{
	public $table='conversion_docs_report';
	
	function init(){
		parent::init();
		
		$this->hasOne('PropertyLog','property_logs_id');
		$this->hasOne('ConversionTypeDocument','conversiontype_document_id');
		// $this->hasOne('ConversionType','conversion_type_id');
		$this->addField('template')->type('text')->display(array('form'=>'RichText'));
		$this->addField('created_at')->type('date')->defaultValue(date('Y-m-d'));
		
		$this->addHook('beforeSave',$this);

		// $this->add('dynamic_model/Controller_AutoCreator');
	}


	function createNew($property_log_id,$conversiontype_report_id){
		
		// throw new Exception($property_logs_id);	
		$property_log=$this->add('Model_PropertyLog');
		$property_log->load($property_log_id);

		$conversion_type_document=$this->add('Model_ConversionTypeDocument');
		$conversion_type_document->addCondition('id',$conversiontype_report_id);
		$conversion_type_document->tryLoadAny();

		$this['property_logs_id']=$property_log['id'];
		// $this['conversion_type_id']=$conversion_type_document['con'];
		$this['conversiontype_document_id']=$conversion_type_document['id'];
		$this['template']=$conversion_type_document['template'];
		$this->save();
	}

	function beforeSave(){
		$property_log = $this->add('Model_PropertyLog');
		$property_log->load($this['property_logs_id']);
                $prefix = '';
		$this['template'] = $this->replaceRecursive($property_log,$this['template'],$prefix);
	}

	function replaceRecursive($model,$text, $prefix){
		
		foreach ($model->elements as $elm) {
			if($elm instanceof Field ){
				// echo $prefix. ' - '. $elm->short_name.' - '. $model[$elm->short_name] .'<br/>';
				$text= str_replace('{{'.$prefix.'-'.(str_replace('_id', '',$elm->short_name)).'}}', $model[str_replace('_id', '',$elm->short_name)], $text);			
			}
			if ($elm instanceof Field_Reference) {
				$prefix_local = $prefix . '_'.strtolower(str_replace("Model_", '', get_class($model->ref($elm->short_name))));
				// echo '<b>'.$elm->short_name.' - '. $model->ref($elm->short_name)->loaded() .'</b><br/>';
				$text = $this->replaceRecursive($model->ref($elm->short_name),$text,$prefix_local);	
                                // echo $prefix_local;
			}	
		}

		return $text;
	}

}	