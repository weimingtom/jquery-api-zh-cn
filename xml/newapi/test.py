from lxml import etree
import codecs
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
XSLTransform("jQueryXMLDocs.xml","stylenew.xsl").write("test.html")
