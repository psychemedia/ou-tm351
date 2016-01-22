define(['base/js/namespace'], function(IPython){

	//NOTE: this extension uses a conversion script tied to a specific profile: tm351MT
	// The profile name is hardcoded into the "var command" defined below

	//based on https://github.com/ipython-contrib/IPython-notebook-extensions/blob/master/publishing/nbconvert_button.js
	// convert current notebook to html by calling "ipython nbconvert"
	"using strict";

	var odszip = function() {  
		var do_odszip_extension=function(){
			var kernel = IPython.notebook.kernel;
			var name = IPython.notebook.notebook_name;
		
			//Force the notebook to be saved
			IPython.notebook.save_checkpoint()
		
			var nc=name.split('.ipynb')[0]
			
			//var command = "from IPython.utils.path import locate_profile; import os; nbc = '{}/static/custom/ipython_nbconvert_config.py'.format(locate_profile('tm351MT')) ; os.system('ipython3 nbconvert --config '+nbc+' --to html \"" + name + "\"; zip \""+nc+".nbk\"  \""+nc+".ipynb\" \""+nc+".html\"; rm \""+nc+".html\"')"
			//var path = document.location.pathname;
			//var nbc = path.substring(path.indexOf('/', 1)+1, path.lastIndexOf('/'))+'ipython_nbconvert_config2.py';
			//var nbc='ipython_nbconvert_config2.py';
			//var command = "import os; os.system('jupyter nbconvert --config ipython_nbconvert_config2.py --to html \"" + name + "\"; zip \""+nc+".nbk\"  \""+nc+".ipynb\" \""+nc+".html\"; rm \""+nc+".html\"')"
			var command = "import os; os.system('cp $(jupyter --data-dir)/templates/ou_preview.tpl ./ ; jupyter nbconvert --template ou_preview.tpl --to html \"" + name + "\"; rm ou_preview.tpl ; zip \""+nc+".nbk\"  \""+nc+".ipynb\" \""+nc+".html\"; rm \""+nc+".html\"')"

			kernel.execute(command);
		};

		IPython.toolbar.add_buttons_group([
			{
				id : 'do_odszip_extension',
				label : 'Zip current notebook for ODS',
				icon : 'fa-download',
				callback : do_odszip_extension
			}
		]);
	};

    return {
        'load_ipython_extension': odszip
    };

})