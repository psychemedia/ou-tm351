define(['base/js/namespace',
    'jquery',
    'require',
    'base/js/events','notebook/js/textcell','notebook/js/codecell'],
	function(IPython, $, require, events,textcell_mod, codecell_mod){

	"using strict";
	var answer_button = function() {
 
		function add_buttons(){
			  
			console.log("Add answer reveal button");
			var idcount=0
			
			var cells = IPython.notebook.get_cells();
			for(var i in cells){
				var cell = cells[i];
				if ((cell instanceof textcell_mod.MarkdownCell)) {
					var answers=cell.element.find('div.answer')
					if (answers.length) {
					  cell.element.addClass('ou_activity_outer')
					  answers.each( function(){
					    this.style.display = 'none';
					    var newid="_xtmp_"+String(idcount)
						this.id=newid
						idcount=idcount+1
						var button= '<input type="button" value="Answer" onclick="showHide(\'' + newid + '\')">';
						this.insertAdjacentHTML("beforeBegin",button);
					  })
					}
					
					if (cell.element.find('div.activity').length) {
					  cell.element.addClass('ou_activity_outer')
					  cell.metadata.activity='activity'
					}
				}
			};
    
    /*
			$("div").each( function(){
				if (this.className === 'answer') {
					activityBlock=$(this).parent().parent().parent();
					activityBlock.addClass('ou_activity_outer');//.css("background-color","#c8ecff");
					this.style.display = 'none';
					
					//Crude attempt at making id a little more unique
					var newid="_xtmp_"+String(idcount)
					this.id=newid
					idcount=idcount+1
					//var button= '<input type="button" value="Answer" onclick="showHide(' + this.id + ')">';
					var button= '<input type="button" value="Answer" onclick="showHide(\'' + newid + '\')">';
					this.insertAdjacentHTML("beforeBegin",button);
					
				}
				
				#This is really hack and breaks in the HTML save version
				if (this.className === 'activity') {
					activityBlock=$(this).parent().parent().parent();
					activityBlock.addClass('ou_activity_outer');//.css("background-color","#c8ecff");
				}
			});
			*/
		};
 
	$([IPython.events]).on('notebook_loaded.Notebook',add_buttons());
 
/*
	IPython.toolbar.add_buttons_group([
					{
						id : 'add_buttons',
						label : 'Add answer buttons',
						icon : 'fa-cogs',
						callback : add_buttons
					}
			]);
*/			  
  
	
	require(['./showHide'])
    
	};

    return {
        'load_ipython_extension': answer_button
    };

})