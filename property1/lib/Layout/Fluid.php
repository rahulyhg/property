<?php
/**
 * The layout engine helping you to create a flexible and responsive layout
 * of your page. The best thing is - you don't need to CSS !
 *
 * Any panel you have added can have a number of classes applied. Of course
 * you are can use those classes in other circumstances too.
 *
 *
 */
class Layout_Fluid extends Layout_Basic {

    public $header_wrap;
    public $header;
    public $footer_wrap;
    public $footer;

    function defaultTemplate() {
        return array('layout/fluid');
    }

    function addHeader($class = 'Menu_Objective') {
        $this->header_wrap = $this->add('View',null,'Header',array('layout/fluid','Header'));

        $this->header=$this->header_wrap->add($class,null,'Header_Content');

        return $this->header;
    }

    function addMenu($class = 'Menu_Vertical', $options=null) {
        return $this->add($class,$options,'Main_Menu');
    }

    function addFooter($class = 'View') {
        return $this->footer = $this->add($class,null,'Footer_Content');
    }
}
