# informalexample 5.140 of section 5.4.2 
# (informalexample 5.140 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 

productTable_data.table[salesTable_data.table, 
                        on = "productID"]

