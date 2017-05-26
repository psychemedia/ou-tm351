# Notes on creating and packaging extensions

### Wordexport

Requires `pandoc`: `!apt-get install -y pandoc`

Create zip file for pip install

- `cd wordexport; zip -r wordexport.zip ./*`

Install from zipfile:

`!pip3 install --upgrade --force-reinstall /vagrant/notebooks/wordexport.zip`

Enable extension:

`!jupyter bundlerextension enable --py wordexport.wordexport  --sys-prefix`

Restart server:

`!systemctl restart jupyter.service`


### Trying customisation:

//via http://stackoverflow.com/a/29484938/454773

`pandoc -D docx > my_template.docx`

Edit the styles in `my_template.docx`.

*I added a logo image in header but didn't seem to work in the following...*

`pandoc -s myfile.html --template=my_template -o test64.docx`

