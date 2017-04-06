#via https://github.com/ipython-contrib/IPython-notebook-extensions/issues/198#issuecomment-78387915
#from IPython.utils.path import get_ipython_dir
from jupyter_core.paths import jupyter_data_dir
import os
#import sys

##ipython nbconvert --config mycfg.py

#ipythondir = get_ipython_dir()

##extensions houses pre/post-processors
#extensions = os.path.join(ipythondir,'extensions') 
#sys.path.append( extensions )

extensiondir=os.path.join(jupyter_data_dir(),'nbextensions/odszip/')

c = get_config()
#c.Exporter.template_path = [os.path.join(ipythondir,'templates') ]
c.TemplateExporter.template_path = [ extensiondir ]
c.TemplateExporter.template_file = 'ou_preview.tpl' #no need for .tpl?

##c.Exporter.preprocessors = ['ou_custom_transformer.MarkdownPreprocessor']