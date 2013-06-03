part of linq_samples;

doQuantifiers() =>
  runSamples("LINQ - Quantifiers",
    {'linq67': 'Any - Simple',
     'linq68': '_(missing from samples)_',
     'linq69': 'Any - Grouped',
     'linq70': 'All - Simple',
     'linq71': '_(missing from samples)_',
     'linq72': 'All - Grouped'});
    
linq67(){
  var words = [ "believe", "relief", "receipt", "field" ]; 
  
  bool iAfterE = words.any((w) => w.contains("ei")); 
  
  print("There is a word that contains in the list that contains 'ei': $iAfterE"); 
}
/*
There is a word that contains in the list that contains 'ei': true
*/

//Missing
linq68(){
}
/*
*/

linq69(){
  var products = productsList(); 
  var productGroups = groupBy(products,
      (p) => p.category)
      .where((g) => g.values.any((p) => p.unitsInStock == 0))
      .map((g) => { 'Category': g.key, 'Products': g });

   productGroups.forEach(print);
}
/*
{Category: Condiments, Products: {{productId: 3, productName: Aniseed Syrup, category: Condiments, unitPrice: 10.0, unitsInStock: 13}, {productId: 4, productName: Chef Anton's Cajun Seasoning, category: Condiments, unitPrice: 22.0, unitsInStock: 53}, {productId: 5, productName: Chef Anton's Gumbo Mix, category: Condiments, unitPrice: 21.35, unitsInStock: 0}, {productId: 6, productName: Grandma's Boysenberry Spread, category: Condiments, unitPrice: 25.0, unitsInStock: 120}, {productId: 8, productName: Northwoods Cranberry Sauce, category: Condiments, unitPrice: 40.0, unitsInStock: 6}, {productId: 15, productName: Genen Shouyu, category: Condiments, unitPrice: 15.5, unitsInStock: 39}, {productId: 44, productName: Gula Malacca, category: Condiments, unitPrice: 19.45, unitsInStock: 27}, {productId: 61, productName: Sirop d'érable, category: Condiments, unitPrice: 28.5, unitsInStock: 113}, {productId: 63, productName: Vegie-spread, category: Condiments, unitPrice: 43.9, unitsInStock: 24}, {productId: 65, productName: Louisiana Fiery Hot Pepper Sauce, category: Condiments, unitPrice: 21.05, unitsInStock: 76}, {productId: 66, productName: Louisiana Hot Spiced Okra, category: Condiments, unitPrice: 17.0, unitsInStock: 4}, {productId: 77, productName: Original Frankfurter grüne Soße, category: Condiments, unitPrice: 13.0, unitsInStock: 32}}}
...
*/

linq70(){
  var numbers = [ 1, 11, 3, 19, 41, 65, 19 ]; 
  
  bool onlyOdd = numbers.every((n) => n % 2 == 1); 
  
  print("The list contains only odd numbers: $onlyOdd"); 
}
/*
The list contains only odd numbers: true
*/

//Missing
linq71(){
}
/*
*/

linq72(){
  var products = productsList(); 
  
  var productGroups = groupBy(products,
    (p) => p.category)
    .where((g) => g.values.every((p) => p.unitsInStock > 0))
    .map((g) => { 'Category': g.key, 'Products': g });
      
  productGroups.forEach(print);
}
/*
{Category: Grains/Cereals, Products: {{productId: 22, productName: Gustaf's Knäckebröd, category: Grains/Cereals, unitPrice: 21.0, unitsInStock: 104}, {productId: 23, productName: Tunnbröd, category: Grains/Cereals, unitPrice: 9.0, unitsInStock: 61}, {productId: 42, productName: Singaporean Hokkien Fried Mee, category: Grains/Cereals, unitPrice: 14.0, unitsInStock: 26}, {productId: 52, productName: Filo Mix, category: Grains/Cereals, unitPrice: 7.0, unitsInStock: 38}, {productId: 56, productName: Gnocchi di nonna Alice, category: Grains/Cereals, unitPrice: 38.0, unitsInStock: 21}, {productId: 57, productName: Ravioli Angelo, category: Grains/Cereals, unitPrice: 19.5, unitsInStock: 36}, {productId: 64, productName: Wimmers gute Semmelknödel, category: Grains/Cereals, unitPrice: 33.25, unitsInStock: 22}}}
...
*/
