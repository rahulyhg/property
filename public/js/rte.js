$.each({
    // Useful info about mouse clicking bug in jQuery UI:
    // http://stackoverflow.com/questions/6300683/jquery-ui-autocomplete-value-after-mouse-click-is-old-value
    // http://stackoverflow.com/questions/7315556/jquery-ui-autocomplete-select-event-not-working-with-mouse-click
    // http://jqueryui.com/demos/autocomplete/#events (check focus and select events)

    alertme:function(){

    	var opts = {
				// doctype  : '<!DOCTYPE html PUBLIC  "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
				cssClass : 'el-rte',
				//lang     : 'en',
				height   : 350,

				toolbar  : 'maxi', // custom
				cssfiles : ['js/elrte/css/elrte-inner.css', 'js/elrte/css/inner-example.css'],
				// elfinder
				fmOpen   : function(callback) {
					$('<div id="myelfinder"></div>').elfinder({
						url : '../../elfinder/connectors/php/connector.php',
						lang : 'en',
						dialog : { width : 900, modal : true, title : 'Files' }, // open in dialog
						closeOnEditorCallback : true, // close elFinder after file select
						editorCallback : callback // pass callback to editor
					});
				},
				// example of user replacement
				// restricts edit of blocks like <!-- BEGIN MY_BLOCK -->anything<!-- END MY_BLOCK -->
				replace : [ function(html) {
					var self = this;
					return html.replace(/(<!--\s*BEGIN\s*([^>]+)\s*-->([\s\S]*?)<!--\s*END\s*(\2)\s*-->)/gi, function(t, a, b, c, d) {

						if (b == d) {
							//self.rte.log([b, d]);
							var id = 'MYTAG'+Math.random().toString().substring(2);
							self.scripts[id] = t;
							return '<img id="'+id+'" src="'+self.url+'pixel.gif" class="elrte-protected elrte-MYTAG">';
						}
						return html;
					});
				}],
				restore : [ function(html) {
					var self = this;
					return html.replace(this.serviceClassRegExp, function(t, n, a) {
						a = self.parseAttrs(a);
						if (a["class"]['elrte-MYTAG']) {
							return self.scripts[a.id] + "\n" || '';
						}
						return t;
					});
				}]
			};
        $('.elrte').elrte(opts);
    }
},$.univ._import);