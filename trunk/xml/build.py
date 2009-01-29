from xml.dom import minidom
import codecs,os,shutil
xmldoc = minidom.parse('jqueryapi.xml')
targetdir="build"
print("正在创建"+targetdir)
try:
	os.mkdir(targetdir)
	print(targetdir+"创建完成")
except:
	print(targetdir+"已被创建，正在清空xml文件")
	paths = os.listdir( targetdir )
	for path in paths:
		filePath = os.path.join( targetdir, path )
		if filePath[-4:].lower() == ".xml".lower():
			os.remove( filePath )


try:
	os.mkdir(targetdir+"\js")
	print(targetdir+"\js"+"创建完成")
except:
	print(targetdir+"\js"+"已被创建")
shutil.copyfile('js\jquery-1.2.6.pack.js', targetdir+"\js\jquery-1.2.6.pack.js")
shutil.copyfile('js\jquery-doc-split.js', targetdir+"\js\jquery-doc-split.js")


try:
	os.mkdir(targetdir+"\style")
	print(targetdir+"\style"+"创建完成")
except:
	print(targetdir+"\style"+"已被创建")
shutil.copyfile('style\style.css', targetdir+"\style\style.css")
shutil.copyfile('style\style.xsl', targetdir+"\style\style.xsl")


shutil.copyfile('xml2chm\cheatsheet.html', targetdir+"\cheatsheet.html")
shutil.copyfile('xml2chm\jqapichm.hhc', targetdir+"\jqapichm.hhc")
shutil.copyfile('xml2chm\jqapichm.hhk', targetdir+"\jqapichm.hhk")
shutil.copyfile('xml2chm\jqapichm.hhp', targetdir+"\jqapichm.hhp")


print("开始生成xml")
i=0
def write2file(node,method,fname=""):
	global i
	i+=1
	filename="jqapixml\\"+(method+fname)+".xml"
	if os.path.isfile(filename):
		filename="jqapixml\\"+(method+fname)+"-1.xml"
	xm=codecs.open(filename,"w","utf-8")
	xm.writelines("<?xml version='1.0' encoding='utf-8'?>")
	xm.writelines("<?xml-stylesheet type='text/xsl' href='style/style.xsl'?>")
	xm.writelines(node.toxml())
	xm.close()

for node in xmldoc.getElementsByTagName("function"):
	method=node.getAttribute("name");
	params=node.getElementsByTagName("params")
	fname=""
	for param in params:
		fname+="_"+param.getAttribute("name")
	write2file(node,method,fname)

for node in xmldoc.getElementsByTagName("selector"):
	method=node.getAttribute("name");
	write2file(node,method)

for node in xmldoc.getElementsByTagName("property"):
	method=node.getAttribute("name");
	write2file(node,method)

print("生成xml结束，共生成"+str(i)+"个xml文件。")
