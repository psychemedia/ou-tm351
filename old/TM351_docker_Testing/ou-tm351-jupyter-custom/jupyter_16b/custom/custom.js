// leave at least 2 line with only a star on it below, or doc generation fails
/**
 *
 *
 * Placeholder for custom user javascript
 * mainly to be overridden in profile/static/custom/custom.js
 * This will always be an empty file in IPython
 *
 * User could add any javascript in the `profile/static/custom/custom.js` file
 * (and should create it if it does not exist).
 * It will be executed by the ipython notebook at load time.
 *
 * Same thing with `profile/static/custom/custom.css` to inject custom css into the notebook.
 *
 * Example :
 *
 * Create a custom button in toolbar that execute `%qtconsole` in kernel
 * and hence open a qtconsole attached to the same kernel as the current notebook
 *
 *    $([IPython.events]).on('app_initialized.NotebookApp', function(){
 *        IPython.toolbar.add_buttons_group([
 *            {
 *                 'label'   : 'run qtconsole',
 *                 'icon'    : 'icon-terminal', // select your icon from http://fortawesome.github.io/Font-Awesome/icons
 *                 'callback': function () {
 *                     IPython.notebook.kernel.execute('%qtconsole')
 *                 }
 *            }
 *            // add more button here if needed.
 *            ]);
 *    });
 *
 * Example :
 *
 *  Use `jQuery.getScript(url [, success(script, textStatus, jqXHR)] );`
 *  to load custom script into the notebook.
 *
 *    // to load the metadata ui extension example.
 *    $.getScript('/static/notebook/js/celltoolbarpresets/example.js');
 *    // or
 *    // to load the metadata ui extension to control slideshow mode / reveal js for nbconvert
 *    $.getScript('/static/notebook/js/celltoolbarpresets/slideshow.js');
 *
 *
 * @module IPython
 * @namespace IPython
 * @class customjs
 * @static
 */
/*
$([IPython.events]).on("app_initialized.NotebookApp", function(){ require(["custom/answer_button","custom/activityCodeCell","custom/commentateCellColour","custom/odszip"])});
*/
// activate extensions only after Notebook is initialized

//http://stackoverflow.com/questions/32170197/how-do-can-i-use-a-custom-js-file-under-jupyter-notebook

//events.on("notebook_loaded.Notebook", function ()
/*require(["base/js/events"], function (events) {
//$([IPython.events]).on("app_initialized.NotebookApp", function () {
$([IPython.events]).on("notebook_loaded.Notebook", function () {
    // load your extension here
    IPython.load_extensions('codefolding/main');
    IPython.load_extensions('rubberband/main'); //required for exercise
    IPython.load_extensions('exercise/main');
    IPython.load_extensions('odszip');
    IPython.load_extensions('activityCodeCell');
    IPython.load_extensions('answer_button/main');
    IPython.load_extensions('commentateCellColour/main');
    IPython.load_extensions('python-markdown/main');
    IPython.load_extensions('read-only');
    
    });
});
*/