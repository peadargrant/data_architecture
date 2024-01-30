# Example of Parsing XML using Python
# Peadar Grant

# Using ElementTree library 
import lxml.etree as ET

# Root element
root = ET.parse('weather.xml')

# Can then select any other select of elements using XPath
times = root.xpath('/weatherdata/product/time[location/temperature]')

for time in times:
    print(time.xpath('@from')[0])

    temperature = time.xpath('location/temperature/@value')[0]
    print(float(temperature))

    humidity = time.xpath('location/humidity/@value')[0]
    print(float(humidity))
