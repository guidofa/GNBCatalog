# GNBCatalog

# Statement

You work for GNB (Goliath National Bank), and your manager, Barney Stinson, has asked you to design and implement a mobile application to help the firm executives who are always flying around the globe. Your executives need a list of every product GNB trades with, and the total sum of sales of those products in different currencies.
For this task you have to use a web service. This web service can provide its results both in XML or in JSON format. You are free to choose the one you feel more comfortable with (you only need to use one of the formats). To use the XML format use the .xml extension; to use the JSON format use the .json extension. The web service provides you with two different sets of data:

http://quiet-stone-2094.herokuapp.com/rates.xml or http://quiet-stone-2094.herokuapp.com/rates.json 

Each dictionary from the array specifies the conversion rate from one currency to another (when the direct conversion is given, the reverse one is also provided), but some conversions may not be specified, and in case they are needed, they will have to be calculated using the already known conversions. For example, in the sample data we don’t provide the USD to CAD conversion, that should be calculated from the USD to EUR and the EUR to CAD conversions.
● http://quiet-stone-2094.herokuapp.com/transactions.xml or http://quiet-stone-2094.herokuapp.com/transactions.json

Each dictionary represents a transaction of a given product (indicated by the product SKU) in given currency for the given amount.
Your application should download this information upon starting and give the user the choice of which product they want to see. When the user selects a product, the application must show each of the transactions related to that product and a sum of all the transactions transformed into EUR.
