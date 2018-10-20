# informalexample 5.132 of section 5.4.2 
# (informalexample 5.132 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 

library("data.table")

joint_table <- productTable
joint_table$unitsSold <- salesTable$unitsSold[match(joint_table$productID, 
                                                    salesTable$productID)]
print(joint_table)

