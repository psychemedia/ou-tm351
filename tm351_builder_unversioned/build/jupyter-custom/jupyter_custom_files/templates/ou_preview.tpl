{%- extends 'basic.tpl' -%}
{% from 'mathjax.tpl' import mathjax %}

<!DOCTYPE html>
<html>
<head>
<!-- via http://www.frankcleary.com/exporting-static-ipython-notebooks-with-style/ -->
<!-- #jupyter nbconvert --to html NOTEBOOK.IPYNB --template=mytemplate.tpl -->
{%- block header -%}
<meta charset="utf-8" />
<title>{{resources['metadata']['name']}}</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.1.10/require.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

{% for css in resources.inlining.css -%}
    <style type="text/css">
    {{ css }}
    </style>
{% endfor %}

<!-- Can put analytics code here, if desired -->

<style type="text/css">
/* Overrides of notebook CSS for static HTML export */
body {
  overflow: visible;
  padding: 8px;
}
div#notebook {
  overflow: visible;
  border-top: none;
}
@media print {
  div.cell {
    display: block;
    page-break-inside: avoid;
  } 
  div.output_wrapper { 
    display: block;
    page-break-inside: avoid; 
  }
  div.output { 
    display: block;
    page-break-inside: avoid; 
  }
}
</style>

<!-- 
<style type="text/css">
div#notebook{
margin-top:50px;
margin-bottom:100px;
}
div.cell{
max-width:60em;
margin-left:auto;
margin-right:auto;
}
div.input_prompt, div.output_prompt{
margin-left:-11ex;
}
div.input, div.output_wrapper{
margin-top:1em;
margin-bottom:1em;
}
div.text_cell{
margin-top:-2px;
margin-bottom:-2px;
padding-top:2px;
padding-bottom:2px;
border-left:2px solid #505050;
border-collapse:collapse;
border-top:none;
border-bottom:none;
}
</style>
 -->

<!-- OU Custom extension styling -->
<style type="text/css">

.activity {
    font-size: 20px;
    font-style: italic;
}


.ou_comment_outer {
    background-color: #eda7c3;
}

.ou_comment_prompt {
    background-color: #f4cadb;
}

.ou_activity_outer {
    background-color: #c8ecff;
}


.ou_activity_prompt {
    background-color: #ecf6ff;
}

</style>

<!-- Loading mathjax macro -->
{{ mathjax() }}


</head>
{%- endblock header -%}


{% block body %}
<body>
<div><img src="data:image/jpeg;base64,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" /></div>
  <div tabindex="-1" id="notebook" class="border-box-sizing">
    <div class="container" id="notebook-container">
{{ super() }}


	<div class="inner_cell">
	  <div class="text_cell_render border-box-sizing rendered_html">
	    <em>Produced as part of the Open University course TM351, 2015: <a href="http://www.open.ac.uk/courses/modules/tm351">more information</a>.</em>
	  </div>
	</div>
      </div>
    </div>
  </div>

</body> 
{%- endblock body %}

{% block markdowncell scoped %}
{% if cell.metadata.commentate %}
<div class="cell border-box-sizing text_cell rendered ou_comment_outer">
{% elif cell.metadata.activity=="activityAns" or cell.metadata.activity=="activity" %}
<div class="cell border-box-sizing text_cell rendered ou_activity_outer">
{% else %}
<div class="cell border-box-sizing text_cell rendered">
{% endif %}
{{ self.empty_in_prompt() }}
{% if cell.metadata.activity=="activity" %}
<div class="inner_cell ou_activity_prompt">
{% elif cell.metadata.activity=="activityAns" %}
<div class="inner_cell ou_activity_outer">
{% else %}
<div class="inner_cell">
{% endif %}
<div class="text_cell_render border-box-sizing rendered_html">
{{ cell.source  | markdown2html | strip_files_prefix }}
</div>
</div>
</div>
{%- endblock markdowncell %}

{% block codecell %}
{% if cell.metadata.commentate %}
<div class="cell border-box-sizing code_cell rendered ou_comment_outer">
{% elif cell.metadata.activity=="activityAns" or cell.metadata.activity=="activity" %}
<div class="cell border-box-sizing code_cell rendered ou_activity_outer">
{% else %}
<div class="cell border-box-sizing code_cell rendered">
{% endif %}
{{ super() }}
</div>
{%- endblock codecell %}

{% block input %}
{% if cell.metadata.commentate %}
<div class="inner_cell ou_comment_prompt">
{% elif cell.metadata.activity=="activityAns" or cell.metadata.activity=="activity" %}
<div class="inner_cell ou_activity_prompt">
{% else %}
<div class="inner_cell">
{% endif %}
    <div class="input_area">
{{ cell.source | highlight_code(metadata=cell.metadata) }}
</div>
</div>
{%- endblock input %}					
					
{% block footer %}
</html>
{% endblock footer %}