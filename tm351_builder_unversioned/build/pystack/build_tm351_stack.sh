#!/usr/bin/env bash

apt-get -y update && \
apt-get install -y libpq-dev libgeos-dev libgdal-dev && \
apt-get install -y libxml2-dev libxslt-dev && \
apt-get install -y fonts-liberation

export CPLUS_INCLUDE_PATH=/usr/include/gdal
export C_INCLUDE_PATH=/usr/include/gdal

            
for PYTHONVER in 3 ; do
  PYTHON="python$PYTHONVER"
  PIP="pip$PYTHONVER"

  $PIP install --upgrade pip
  
  # The TM351 python stack
  
  $PIP install psycopg2
  $PIP install SQLAlchemy

  $PIP install pymongo
  
  $PIP install lxml

  $PIP install cython
  $PIP install openpyxl
  $PIP install python-dateutil
  $PIP install xlrd
  $PIP install pygments
  $PIP install pytz
  $PIP install requests
  $PIP install chardet
  $PIP install messytables
  $PIP install beautifulsoup4
  $PIP install filemagic
  $PIP install dataset
  $PIP install six
  $PIP install csvkit
  $PIP install numpy
  $PIP install numexpr
  $PIP install tables
  $PIP install pandas
  $PIP install matplotlib
  $PIP install nltk
  $PIP install scipy
  $PIP install scikit-learn
  
  $PIP install pandasql
  
  #$PIP install git+https://github.com/mccahill/ipython-sql.git
  $PIP install ipython-sql
  
  $PIP install patsy
  $PIP install fiona
  $PIP install geopy
  $PIP install descartes
  $PIP install geopandas
  $PIP install pygeoif
  $PIP install fastkml
  $PIP install folium
  $PIP install shapely

  $PIP install brewer2mpl
  $PIP install mpld3
  $PIP install statsmodels
  #$PIP install git+https://github.com/mwaskom/seaborn.git
  $PIP install seaborn
  $PIP install ggplot
  
  $PIP install rdflib
  $PIP install networkx
  $PIP install sparqlwrapper
  
  $PIP install ipythonblocks
  
done

python3 -m nltk.downloader stopwords

# Reduce the image size
apt-get autoremove -y
apt-get clean -y

cd /
