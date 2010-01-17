import urllib.request
url = r"http://api.jquery.com/api/"
path = r"jQueryXMLDocs.xml"
data = urllib.request.urlretrieve(url,path)
