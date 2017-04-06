define(['base/js/namespace','notebook/js/textcell','notebook/js/codecell'], function(IPython, textcell_mod, codecell_mod){

	// add button to make codecell commentate red
	//based on https://github.com/ipython-contrib/IPython-notebook-extensions/blob/master/usability/read-only.js
	"using strict";
 
	var commentateCodeCell = function() {
	
		/**
		 * Set codecell to commentate 
		 * 
		 *  @param {Object} cell current notebook cell
		 */


    
    
    //ou_comment_prompt, ou_comment_outer removeClass addClass
	
		 var setcommentate = function (cell) {
			console.log("Run setcommentate");
			var cp=cell.element;
			var prompt = cell.element.find('div.inner_cell');
			if (cell instanceof codecell_mod.CodeCell)  {
				if (('commentate' in cell.metadata) && cell.metadata.commentate == true) {
					cp.addClass('ou_comment_outer');
					prompt.addClass('ou_comment_prompt');
				} else {
					cp.removeClass('ou_comment_outer');
					prompt.removeClass('ou_comment_prompt');
				}
			} else if (cell instanceof textcell_mod.MarkdownCell)  {
				if (!('commentate' in cell.metadata) || (cell.metadata.activity=='clear')) {
					//Clear cell - remove coloured background
					cp.removeClass('ou_comment_outer');
					prompt.removeClass('ou_comment_prompt')
				} else {
					if  (cell.metadata.activity != 'activityAns')  {
					  //Colour outside, different colour inside
					  cp.addClass('ou_comment_outer')
					  prompt.addClass('ou_comment_prompt')
					}
				} 
			}
		}
			
 
		function togglecommentate() {
			console.log("Run togglecommentate");
			var cell = IPython.notebook.get_selected_cell();
			if ((cell instanceof codecell_mod.CodeCell) || (cell instanceof textcell_mod.MarkdownCell)) {
				if (!('commentate' in cell.metadata))
					cell.metadata.commentate = true; 
				else delete cell.metadata.commentate//cell.metadata.commentate = !cell.metadata.commentate
				setcommentate(cell);
			}
		};
 
 

 
		/**
		* Add run control buttons to toolbar and initialize codecells
		* 
		*/
		IPython.toolbar.add_buttons_group([
					{
						id : 'commentate_codecell',
						label : 'Toggle cell comment',
						icon : 'fa-exclamation-circle',
						callback : togglecommentate
					}
			  ]);
		  
	 function oustyle_notebook_commentate(){
		console.log("Run oustyle_notebook_commentate");
		/* loop through notebook and set style of commentate cell defined in metadata */
		var cells = IPython.notebook.get_cells();
		for(var i in cells){
			var cell = cells[i];
			if ((cell instanceof codecell_mod.CodeCell) || (cell instanceof textcell_mod.MarkdownCell)) {
				if ('commentate' in cell.metadata) {
					setcommentate(cell);
				} 
			}
		  
		};
	 }
 

	$([IPython.events]).on('notebook_loaded.Notebook',oustyle_notebook_commentate());
 
	};

    return {
        'load_ipython_extension': commentateCodeCell
    };

})