import time
from xml.dom import minidom
from pathlib import Path

def resdXMLAsPerNode(your_test_param):
    first_parse_XML = minidom.parse(str(Path(__file__).parent.parent) + "/testData.xml")
    # print(str(Path(__file__).parent.parent) + "/readData.xml")
    # first_parse_XML = minidom.parse("C://Users/00005860/Desktop/Automation_Project/Day_2_Jul_19_2022/readData.xml")
    data = first_parse_XML.getElementsByTagName(your_test_param)[0]
    return data.firstChild.data


