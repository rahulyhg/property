<?php
/**
 * Addon  for converting hasOne field into auto-complete
 */
namespace unicodehindi;

class Form_Field_Basic extends \Form_Field_Hidden
{

    // Text input field object
    public $other_field;

    function init()
    {
        parent::init();

        // add add-on locations to pathfinder
        $l = $this->api->locate('addons', __NAMESPACE__, 'location');
        $addon_location = $this->api->locate('addons', __NAMESPACE__);
        $this->api->pathfinder->addLocation($addon_location, array(
            'js'  => 'js',
            'css' => 'templates/css',
        ))->setParent($l);

        // add additional form field
        $name = preg_replace('/_id$/', '', $this->short_name);
        $caption = null;
        if ($this->owner->model) {
            if ($f = $this->owner->model->getField($this->short_name)) {
                $caption = $f->caption();
            }
        }
        $this->other_field = $this->owner->addField('line', $name, $caption);

        $this->other_field->addClass('hindi');

        // move hidden ID field after other field. Otherwise it breaks :first->child CSS in forms
        $this->js(true)->appendTo($this->other_field->js()->parent());

    }

    function setCaption($_caption)
    {
        $this->caption = $this->other_field->caption = $this->api->_($_caption);
        return $this;
    }

    function validateNotNULL($msg = null)
    {
        $this->other_field->validateNotNULL($msg);
        return $this;
    }

    function render()
    {
        $url = $this->api->url(null, array($this->name => 'ajax'));
        $this->other_field->js(true)
            ->_load('unicodehindi_js')
            ->_css('unicodehindi_css')
            ->univ()
            ->unicode_to_krutidev($this,$this->other_field);

        $this->other_field->js('change')
            ->univ()
            ->krutidev_to_unicode($this,$this->other_field);

        return parent::render();
    }
}
