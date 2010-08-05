import codecs
import os,sys,re,time; 


filename="jQueryXMLDocs.xml"

fileread = open(filename,'r');   
filer = fileread.read();   
sub = re.sub("Properties of jQuery Object Instances ","Properties of jQuery Object Instances",filer,0); #替换stra 为 strb   
fileread.close();   
fileok = open(filename,'w');   
fileok.write(sub);   
fileok.close();   
print(filename,'替换成功!')

os.system("build.bat")