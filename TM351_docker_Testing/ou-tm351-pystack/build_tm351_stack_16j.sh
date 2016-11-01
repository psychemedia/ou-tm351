#!/usr/bin/env bash

apt-get -y update && \
apt-get install -y libpq-dev libgeos-dev libgdal-dev && \
apt-get install -y libxml2-dev libxslt-dev

export CPLUS_INCLUDE_PATH=/usr/include/gdal
export C_INCLUDE_PATH=/usr/include/gdal

            
for PYTHONVER in 3 ; do
  PYTHON="python$PYTHONVER"
  PIP="pip$PYTHONVER"

  $PIP install --upgrade pip
  
  # The TM351 python stack
  
  $PIP install psycopg2==2.6.1
  $PIP install SQLAlchemy==1.0.9

  $PIP install pymongo==3.1.1
  
  $PIP install lxml==3.5.0

  $PIP install cython==0.23.4
  $PIP install openpyxl==2.3.2
  $PIP install python-dateutil==2.4.2
  $PIP install xlrd==0.9.4
  $PIP install pygments==2.0.2
  $PIP install pytz==2015.7
  $PIP install requests==2.8.1
  $PIP install chardet==2.3.0
  $PIP install messytables==0.15.0
  $PIP install beautifulsoup4==4.4.1
  $PIP install filemagic==1.6
  $PIP install dataset==0.6.1
  $PIP install six=1.10.0
  $PIP install csvkit==0.9.1
  $PIP install numpy==1.10.1
  $PIP install numexpr==2.4.6
  $PIP install tables==3.2.2
  $PIP install pandas==0.17.1
  $PIP install matplotlib==1.5.0
  $PIP install nltk==3.1
  $PIP install scipy==0.16.1
  $PIP install scikit-learn==0.17
  
  $PIP install pandasql==0.6.3
  
  $PIP install git+https://github.com/mccahill/ipython-sql.git
  
  $PIP install patsy==0.4.1
  $PIP install fiona==1.6.2
  $PIP install geopy==1.11.0
  $PIP install descartes==1.0.1
  $PIP install geopandas==0.1.1
  $PIP install pygeoif==0.6
  $PIP install fastkml==0.11
  $PIP install folium==0.2.1
  $PIP install shapely==1.5.13

  $PIP install brewer2mpl==1.4.1
  $PIP install mpld3==0.2
  $PIP install statsmodels==0.6.1
  $PIP install git+https://github.com/mwaskom/seaborn.git
  $PIP install ggplot==0.6.8
  
  $PIP install rdflib==4.2.1
  $PIP install networkx==1.10
  $PIP install sparqlwrapper==1.7.5
  
  $PIP install ipythonblocks==1.7.0
  
done

python3 -m nltk.downloader stopwords

# Reduce the image size
apt-get autoremove -y
apt-get clean -y

cd /
