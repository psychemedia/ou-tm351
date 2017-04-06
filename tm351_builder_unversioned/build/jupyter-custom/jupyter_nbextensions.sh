#Go for the easy option and src all the jupyter_contrib_nbextensions 
pip3 install jupyter_contrib_nbextensions
/usr/local/bin/jupyter contrib nbextension install --system


#Enable certain extensions from the start
/usr/local/bin/jupyter nbextension enable freeze/main
/usr/local/bin/jupyter nbextension enable highlighter/highlighter
/usr/local/bin/jupyter nbextension enable spellchecker/main
/usr/local/bin/jupyter nbextension enable collapsible_headings/main
/usr/local/bin/jupyter nbextension enable codefolding/main
/usr/local/bin/jupyter nbextension enable rubberband/main
/usr/local/bin/jupyter nbextension enable exercise/main
/usr/local/bin/jupyter nbextension enable python-markdown/main

#If not the Docker build, set up the services
if [[ -z "${DOCKERBUILD}" ]]; then
	#restart the service
	systemctl restart jupyter.service
fi