define(['base/js/namespace','notebook/js/textcell','notebook/js/codecell'], function(IPython, textcell_mod, codecell_mod){

	// add button to make codecell activity blue
	//based on https://github.com/ipython-contrib/IPython-notebook-extensions/blob/master/usability/read-only.js
	"using strict";
 
	var activityCodeCell = function() {
	
		/**
		 * Set codecell to activity 
		 * 
		 *  @param {Object} cell current notebook cell
		 */
		 //.addClass('ou_comment_prompt')
		 
		 var setActivity = function (cell) {
			console.log("Run set activity");
			var cp=cell.element;
			var prompt = cell.element.find('div.inner_cell');
			
			if (cell instanceof codecell_mod.CodeCell)  {
				if (cell.metadata.activity == 'activity') {
					//Add coloured background
					prompt.addClass('ou_activity_prompt'); 
					cp.addClass('ou_activity_outer');
				} else {
					//Clear cell - remove coloured background
					prompt.removeClass('ou_activity_prompt');
					cp.removeClass('ou_activity_outer');
				}
			} else if (cell instanceof textcell_mod.MarkdownCell)  {
				if (!('activity' in cell.metadata) || (cell.metadata.activity=='clear')) {
					//Clear cell - remove coloured background
					cp.removeClass('ou_activity_outer');
					prompt.removeClass('ou_activity_prompt')
				} else {
					if  (cell.metadata.activity == 'activityAns')  {
					  //Colour outside, different colour inside
					  cp.addClass('ou_activity_outer')
					  prompt.removeClass('ou_activity_outer');
					  prompt.addClass('ou_activity_prompt')
					} else if  (cell.metadata.activity == 'activity')  {
					  //Similar colour outside and inside
					  cp.addClass('ou_activity_outer')
					  prompt.addClass('ou_activity_outer')
					}
				}  
			}
		};
		

	
		function toggleActivity() {
			//the cell.metadata.activity=='clear' is a legacy check
			console.log("Run toggle activity");
			var cell = IPython.notebook.get_selected_cell();
			if ((cell instanceof codecell_mod.CodeCell)) {
				if (!('activity' in cell.metadata) || (cell.metadata.activity=='clear')){
					cell.metadata.activity = 'activity'; 
				} else { //if (cell.metadata.activity=='activity') {
					//cell.metadata.activity = 'clear'
					delete cell.metadata.activity
				}
				setActivity(cell);
			} else if (cell instanceof textcell_mod.MarkdownCell) {
				if (!('activity' in cell.metadata) || (cell.metadata.activity=='clear')) {
					cell.metadata.activity = 'activity';
				} else if (cell.metadata.activity == 'activity' ) {
				   cell.metadata.activity = 'activityAns'
				} else if (cell.metadata.activity == 'activityAns'){
				   //cell.metadata.activity='clear'
				   delete cell.metadata.activity
				}
				setActivity(cell);
			}
		};

 
		/**
		* Add run control buttons to toolbar and initialize codecells
		* 
		*/
		IPython.toolbar.add_buttons_group([
					{
						id : 'activity_codecell',
						label : 'Toggle activity codecell',
						icon : 'fa-tasks',
						callback : toggleActivity
					}
			  ]);
	function oustyle_notebook(){ 
		console.log("Run oustyle_notebook");    
		/* loop through notebook and set style of activity cells defined in metadata */
		var cells = IPython.notebook.get_cells();
		for(var i in cells){
			var cell = cells[i];
			if ((cell instanceof codecell_mod.CodeCell) || (cell instanceof textcell_mod.MarkdownCell) ) {
				if ('activity' in cell.metadata)
					setActivity(cell);
			
			}
		  
		};
    }

    $([IPython.events]).on('notebook_loaded.Notebook',oustyle_notebook());
 
	};

    return {
        'load_ipython_extension': activityCodeCell
    };

})
