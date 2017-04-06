#via https://github.com/ipython-contrib/IPython-notebook-extensions/issues/198#issuecomment-78387915
from IPython.utils.path import get_ipython_dir
import os
import sys

#ipython nbconvert --config mycfg.py

ipythondir = get_ipython_dir()
#extensions houses pre/post-processors
extensions = os.path.join(ipythondir,'extensions') 
sys.path.append( extensions )

c = get_config()
c.Exporter.template_path = [os.path.join(ipythondir,'templates') ]
c.Exporter.template_file = 'ou_preview.tpl' #no need for .tpl?

#c.Exporter.preprocessors = ['ou_custom_transformer.MarkdownPreprocessor']