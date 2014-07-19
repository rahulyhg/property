<?php // vim:ts=4:sw=4:et:fdm=marker
/**
 * This is the most appropriate API file for your web application. It builds on
 * top of App_Web and introduces concept of "Pages" on top of "Layout" concept
 * defined in App_Web.
 *
 * @link http://agiletoolkit.org/learn/understand/api
 * @link http://agiletoolkit.org/learn/template
*//*
==ATK4===================================================
   This file is part of Agile Toolkit 4
    http://agiletoolkit.org/

   (c) 2008-2013 Agile Toolkit Limited <info@agiletoolkit.org>
   Distributed under Affero General Public License v3 and
   commercial license.

   See LICENSE or LICENSE_COM for more information
 =====================================================ATK4=*/
class App_Frontend extends App_Web {

    /** When page is determined, it's class instance is created and stored in here */
    public $page_object=null;

    /** Class which is used for static pages */
    public $page_class='Page';

    /** List of pages which are routed into namespace */
    public $namespace_routes=array();

    /** Object for a custom layout, introduced in 4.3 */
    public $layout=null;

    // {{{ Layout Implementation
    /** Content in the global (shared.html) template is rendered by page object. This method loads either class or static file */
    function initLayout(){
        parent::initLayout();
        $this->addLayout('Content');
    }
    function routePages($prefix,$ns=null){
        if(!$ns)$ns=$prefix;
        $this->namespace_routes[$prefix]=$this->normalizeClassName($ns);
    }
    function layout_Content(){
        $this->template->trySet('pagename','page-'.$this->page);

        $layout = $this->layout ?: $this;

        // TODO: refactor using pathfinders 4th argument to locate = null,
        // to avoid exceptions as those might be expensive.

        // This function initializes content. Content is page-dependant
        $page=str_replace('/','_',$this->page);
        $page=str_replace('-','',$page);
        $class='page_'.$page;

        if($this->app->page_object)return;   // page is already initialized;

        if(method_exists($this,$class)){
            $this->page_object=$layout->add($this->page_class,$page);
            $this->$class($this->page_object);
        }else{
            $class_parts=explode('_',$page);
            $funct_parts=array();
            $ns='';
            if($this->namespace_routes[$page]){
                $ns=$this->namespace_routes[$page].'\\';
                $class='page_index';
            }else{
                while($class_parts){
                    array_unshift($funct_parts,array_pop($class_parts));
                    if($ns1=$this->namespace_routes[join('_',$class_parts)]){
                        $class='page_'.join('_',$funct_parts);
                        $ns=$ns1.'\\';
                        $page=join('_',$funct_parts);
                        break;
                    }
                }
            }

            try{
                $this->app->pathfinder->loadClass($ns.$class);
            }catch(PathFinder_Exception $e){


                // page not found, trying to load static content
                try{
                    $this->loadStaticPage($this->page);
                }catch(PathFinder_Exception $e2){

                    $class_parts=explode('_',$page);
                    $funct_parts=array();
                    while($class_parts){
                        array_unshift($funct_parts,array_pop($class_parts));
                        $fn='page_'.join('_',$funct_parts);
                        if($class_parts){
                            $in=$ns.'page_'.join('_',$class_parts);
                        }else{
                            $in=$ns.'page_index';
                        }
                        if($in=='page_')$in='page_index';
                        try {
                            $this->app->pathfinder->loadClass($in);
                        }catch(PathFinder_Exception $e3){
                            continue;
                        }
                        // WorkAround for PHP5.2.12+ PHP bug #51425
                        $tmp=new $in;
                        if(!method_exists($tmp,$fn) && !method_exists($tmp,'subPageHandler'))continue;

                        $this->page_object=$layout->add($in,$page);
                        if(method_exists($tmp,$fn)){
                            $this->page_object->$fn();
                        }elseif(method_exists($tmp,'subPageHandler')){
                            if($this->page_object->subPageHandler(join('_',$funct_parts))===false)break;
                        }
                        return;
                    }

                    $e->addMoreInfo('static_page_error',$e2->getText());

                    // throw original error
                    $this->pageNotFound($e);
                }
                return;
            }
            // i wish they implemented "finally"
            $this->page_object=$layout->add($ns.$class,$page,'Content');
            if(method_exists($this->page_object,'initMainPage'))$this->page_object->initMainPage();
            if(method_exists($this->page_object,'page_index'))$this->page_object->page_index();
        }
    }
    /** This method is called as a last resort, when page is not found. It receives the exception with the actual error */
    function pageNotFound($e){
        throw $e;
    }
    /** Attempts to load static page. Raises exception if not found */
    protected function loadStaticPage($page){
        $layout = $this->layout ?: $this;
        try{
            $t='page/'.str_replace('_','/',strtolower($page));
            $this->template->findTemplate($t);

            $this->page_object=$layout->add($this->page_class,$page,'Content',array($t));
        }catch(PathFinder_Exception $e2){

            $t='page/'.strtolower($page);
            $this->template->findTemplate($t);
            $this->page_object=$layout->add($this->page_class,$page,'Content',array($t));
        }

        return $this->page_object;
    }
    // }}}

    // {{{ Obsolete functions
    /** @obsolete - does nothing */
    function execute(){
        try{
            parent::execute();
        }catch(Exception $e){
            $this->caughtException($e);
        }
    }
    /** @obsolete */
    function getRSSURL($rss,$args=array()){
        $tmp=array();
        foreach($args as $arg=>$val){
            if(!isset($val) || $val===false)continue;
            if(is_array($val)||is_object($val))$val=serialize($val);
            $tmp[]="$arg=".urlencode($val);
        }
        return
            $rss.'.xml'.($tmp?'?'.join('&',$tmp):'');
    }
    // }}}
}
