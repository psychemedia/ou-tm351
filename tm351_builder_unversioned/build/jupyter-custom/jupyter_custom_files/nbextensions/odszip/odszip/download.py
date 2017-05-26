# Copyright (c) The Open University, 2017
# Copyright (c) Jupyter Development Team.

# Distributed under the terms of the Modified BSD License.

# Custom bundler extensions API:
# http://jupyter-notebook.readthedocs.io/en/latest/extending/bundler_extensions.html
# Requires: _jupyter_bundlerextension_paths(), bundle()
# Based on: https://github.com/jupyter-incubator/dashboards_bundlers/

import os
import shutil
import tempfile

def _jupyter_bundlerextension_paths():
    '''API for notebook bundler installation on notebook 5.0+'''
    return [{
                'name': 'odszip_download',
                'label': 'ODSzip (.nbk)',
                'module_name': 'odszip.download',
                'group': 'download'
            }]


def make_download_bundle(abs_nb_path, staging_dir, tools):
	'''
	Assembles the notebook and resources it needs, returning the path to a
	zip file bundling the notebook and its requirements if there are any,
	the notebook's path otherwise.
	:param abs_nb_path: The path to the notebook
	:param staging_dir: Temporary work directory, created and removed by the caller
	'''
    
	# Clean up bundle dir if it exists
	shutil.rmtree(staging_dir, True)
	os.makedirs(staging_dir)
	
	# Get name of notebook from filename
	notebook_basename = os.path.basename(abs_nb_path)
	notebook_name = os.path.splitext(notebook_basename)[0]
	
	# Add the notebook
	shutil.copy2(abs_nb_path, os.path.join(staging_dir, notebook_basename))
	
	# Include HTML version of file
	cmd='jupyter nbconvert --to html "{abs_nb_path}" --output-dir "{staging_dir}"'.format(abs_nb_path=abs_nb_path,staging_dir=staging_dir)
	os.system(cmd)

	zip_file = shutil.make_archive(staging_dir, format='zip', root_dir=staging_dir, base_dir='.')
	return zip_file

        
def bundle(handler, model):
	'''
	Downloads a notebook as an HTML file and zips it with the notebook
	'''
	
	# Based on https://github.com/jupyter-incubator/dashboards_bundlers
	
	abs_nb_path = os.path.join(
		handler.settings['contents_manager'].root_dir,
		model['path']
	)
		
	notebook_basename = os.path.basename(abs_nb_path)
	notebook_name = os.path.splitext(notebook_basename)[0]
	
	tmp_dir = tempfile.mkdtemp()

	output_dir = os.path.join(tmp_dir, notebook_name)
	bundle_path = make_download_bundle(abs_nb_path, output_dir, handler.tools)
		
	handler.set_header('Content-Disposition', 'attachment; filename="%s"' % (notebook_name + '.nbk'))
	
	handler.set_header('Content-Type', 'application/zip')
	
	with open(bundle_path, 'rb') as bundle_file:
		handler.write(bundle_file.read())

	handler.finish()


	# We read and send synchronously, so we can clean up safely after finish
	shutil.rmtree(tmp_dir, True)
		
        
        
        
        
        
        