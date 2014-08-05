<?php

class Formatters extends AbstractObject{
	function format_picture($grid,$field){
		$grid->current_row_html[$field] = '<img onclick="javascript:$(this).univ().frameURL(\'Image Viewer\',\''.$grid->api->url('fileviewer',array('file_id'=>$grid->model['image_id'])).'\')" src="'.$grid->model->ref('image_id')->get('thumb_url').'" />';
	}
}