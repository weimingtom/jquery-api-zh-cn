from xml.dom import minidom
import codecs,os,shutil
xmldoc = minidom.parse('jqueryapi.xml')
targetdir="jqapixml"
print("正在创建"+targetdir)
try:
	os.mkdir(targetdir)
	print(targetdir+"创建完成")
except:
	print(targetdir+"已被创建")

'''
try:
	os.mkdir(targetdir+"\js")
	print(targetdir+"\js"+"创建完成")
except:
	print(targetdir+"\js"+"已被创建")
shutil.copyfile('js\jquery-1.2.6.pack.js', targetdir+"\js\jquery-1.2.6.pack.js")
shutil.copyfile('js\jquery-doc.js', targetdir+"\js\jquery-doc.js")
'''

try:
	os.mkdir(targetdir+"\style")
	print(targetdir+"\style"+"创建完成")
except:
	print(targetdir+"\style"+"已被创建")
shutil.copyfile('style\style.css', targetdir+"\style\style.css")
shutil.copyfile('style\style.xsl', targetdir+"\style\style.xsl")

print("生成xml")
for node in xmldoc.getElementsByTagName("method"):
	method=node.getAttribute("name");
	params=node.getElementsByTagName("param")
	fname=""
	for param in params:
		fname+="_"+param.getAttribute("name")
	xm=codecs.open("jqapixml\\"+(method+fname).replace(':','').replace('#','').replace('>','').replace('<','').replace('[','').replace(']','').replace('*','star')+".xml","w","utf-8")
	xm.writelines("<?xml version='1.0' encoding='utf-8'?>")
	xm.writelines("<?xml-stylesheet type='text/xsl' href='style/style.xsl'?>")
	xm.writelines(node.toxml())
	xm.close()