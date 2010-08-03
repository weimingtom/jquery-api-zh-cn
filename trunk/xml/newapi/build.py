from lxml import etree
import codecs
import os,sys,re,time; 
def XSLTransform(xml,xslt):
    try:
        return xslt(xml)
    except:
        transform=etree.XSLT(etree.parse(xslt))
        try:
            return transform(xml)
        except:
            root=etree.parse(xml)
            return transform(root)
XSLTransform("jQueryXMLDocs.xml","index.xsl").write("index.html")
XSLTransform("jQueryXMLDocs.xml","stylenew.xsl").write("test.html")
fileread=open("index.html",'r')
filename="index.html"
fileread = open(filename,'r');   
filer = fileread.read();   
sub = re.sub("<ul/>","",filer,0); #替换stra 为 strb   
fileread.close();   
fileok = open(filename,'w');   
fileok.write(sub);   
fileok.close();   
print(filename,'替换成功!')
