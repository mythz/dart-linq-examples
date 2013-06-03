part of linq_samples;

doAggregateOperations() =>
  runSamples("LINQ - Aggregate Operators",
    {'linq73': 'Count - Simple',
     'linq74': 'Count - Conditional',
     'linq75': '_(missing from samples)_',
     'linq76': 'Count - Nested',
     'linq77': 'Count - Grouped',
     'linq78': 'Sum - Simple',
     'linq79': 'Sum - Projection',
     'linq80': 'Sum - Grouped',
     'linq81': 'Min - Simple',
     'linq82': 'Min - Projection',
     'linq83': 'Min - Grouped',
     'linq84': 'Min - Elements',
     'linq85': 'Max - Simple',
     'linq86': 'Max - Projection',
     'linq87': 'Max - Grouped',
     'linq88': 'Max - Elements',
     'linq89': 'Average - Simple',
     'linq90': 'Average - Projection',
     'linq91': 'Average - Grouped',
     'linq92': 'Aggregate - Simple',
     'linq93': 'Aggregate - Seed'});

sum(Iterable seq, [fn(x)]) =>
  seq.fold(0, (prev, element) => prev + (fn != null ? fn(element) : element));

min(Iterable seq) =>
  seq.fold(double.MAX_FINITE, (prev, element) => prev.compareTo(element) > 0 ? element : prev);

max(Iterable seq) =>
  seq.fold(double.MIN_POSITIVE, (prev, element) => prev.compareTo(element) > 0 ? prev : element);

avg(Iterable seq) => sum(seq) / seq.length;

linq73(){
  var factorsOf300 = [ 2, 2, 3, 5, 5 ]; 
  
  int uniqueFactors = factorsOf300.toSet().length; 
  
  print("There are $uniqueFactors unique factors of 300."); 
}
/*
There are 3 unique factors of 300.
*/

linq74(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  int oddNumbers = numbers.where((n) => n % 2 == 1).length; 
  
  print("There are $oddNumbers odd numbers in the list."); 
}
/*
There are 5 odd numbers in the list.
*/

//Missing
linq75(){
}
/*
*/

linq76(){
  var customers = customersList(); 
  
  var orderCounts = customers
    .map((c) => { 'CustomerId': c.customerId, 'OrderCount': c.orders.length }); 

  orderCounts.forEach(print);
}
/*
{CustomerId: ALFKI, OrderCount: 6}
{CustomerId: ANATR, OrderCount: 4}
{CustomerId: ANTON, OrderCount: 7}
{CustomerId: AROUT, OrderCount: 13}
{CustomerId: BERGS, OrderCount: 18}
{CustomerId: BLAUS, OrderCount: 7}
{CustomerId: BLONP, OrderCount: 11}
...
*/

linq77(){
  var products = productsList(); 
  
  var categoryCounts = group(products, by:(p) => p.category)
    .map((g) => { 'Category': g.key, 'ProductCount': g.length });      

  categoryCounts.forEach(print);
}
/*
{Category: Dairy Products, ProductCount: 10}
{Category: Grains/Cereals, ProductCount: 7}
{Category: Confections, ProductCount: 13}
{Category: Seafood, ProductCount: 12}
{Category: Condiments, ProductCount: 12}
{Category: Meat/Poultry, ProductCount: 6}
{Category: Produce, ProductCount: 5}
{Category: Beverages, ProductCount: 12}
*/

linq78(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  var numSum = sum(numbers); 
  
  print("The sum of the numbers is $numSum."); 
}
/*
The sum of the numbers is 45.
*/

linq79(){
  var words = [ "cherry", "apple", "blueberry" ]; 
  
  var totalChars = sum(words, (w) => w.length); 
  
  print("There are a total of $totalChars characters in these words.");
}
/*
There are a total of 20 characters in these words.
*/

linq80(){
  var products = productsList(); 
  
  var categories = group(products, by:(p) => p.category)
    .map((g) => { 'Category': g.key, 'TotalUnitsInStock': sum(g.values, (p) => p.unitsInStock) }); 
      
  categories.forEach(print);
}
/*
{Category: Dairy Products, TotalUnitsInStock: 393}
{Category: Grains/Cereals, TotalUnitsInStock: 308}
{Category: Confections, TotalUnitsInStock: 386}
{Category: Seafood, TotalUnitsInStock: 701}
{Category: Condiments, TotalUnitsInStock: 507}
{Category: Meat/Poultry, TotalUnitsInStock: 165}
{Category: Produce, TotalUnitsInStock: 100}
{Category: Beverages, TotalUnitsInStock: 559}
*/

linq81(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  int minNum = min(numbers); 
  
  print("The minimum number is $minNum.");
}
/*
The minimum number is 0.
*/

linq82(){
  var words = [ "cherry", "apple", "blueberry" ]; 
  
  var shortestWord = min(words.map((x) => x.length));
  
  print("The shortest word is $shortestWord characters long."); 
}
/*
The shortest word is 5 characters long.
*/

linq83(){
  var products = productsList(); 
  
  var categories = group(products, by:(p) => p.category)
    .map((g) => { 'Category': g.key, 'CheapestPrice': min(g.values.map((p) => p.unitPrice)) });

  categories.forEach(print);
}
/*
{Category: Dairy Products, CheapestPrice: 2.5}
{Category: Grains/Cereals, CheapestPrice: 7.0}
{Category: Confections, CheapestPrice: 9.2}
{Category: Seafood, CheapestPrice: 6.0}
{Category: Condiments, CheapestPrice: 10.0}
{Category: Meat/Poultry, CheapestPrice: 7.45}
{Category: Produce, CheapestPrice: 10.0}
{Category: Beverages, CheapestPrice: 4.5}
*/

linq84(){
  var products = productsList(); 
  
  var categories = group(products, by:(p) => p.category)
    .map((g) {
      var minPrice = min(g.values.map((p) => p.unitPrice));
      return { 'Category': g.key, 'CheapestProducts': g.values.where((p) => p.unitPrice == minPrice) };
    });

  categories.forEach(print);
}
/*
{Category: Dairy Products, CheapestProducts: {{productId: 33, productName: Geitost, category: Dairy Products, unitPrice: 2.5, unitsInStock: 112}}}
{Category: Grains/Cereals, CheapestProducts: {{productId: 52, productName: Filo Mix, category: Grains/Cereals, unitPrice: 7.0, unitsInStock: 38}}}
{Category: Confections, CheapestProducts: {{productId: 19, productName: Teatime Chocolate Biscuits, category: Confections, unitPrice: 9.2, unitsInStock: 25}}}
{Category: Seafood, CheapestProducts: {{productId: 13, productName: Konbu, category: Seafood, unitPrice: 6.0, unitsInStock: 24}}}
{Category: Condiments, CheapestProducts: {{productId: 3, productName: Aniseed Syrup, category: Condiments, unitPrice: 10.0, unitsInStock: 13}}}
{Category: Meat/Poultry, CheapestProducts: {{productId: 54, productName: Tourtière, category: Meat/Poultry, unitPrice: 7.45, unitsInStock: 21}}}
{Category: Produce, CheapestProducts: {{productId: 74, productName: Longlife Tofu, category: Produce, unitPrice: 10.0, unitsInStock: 4}}}
{Category: Beverages, CheapestProducts: {{productId: 24, productName: Guaraná Fantástica, category: Beverages, unitPrice: 4.5, unitsInStock: 20}}}
*/

linq85(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  var maxNum = max(numbers); 
  
  print("The maximum number is $maxNum."); 
}
/*
The maximum number is 9.
*/

linq86(){
  var words = [ "cherry", "apple", "blueberry" ]; 
  
  int longestLength = max(words.map((w) => w.length)); 
  
  print("The longest word is $longestLength characters long."); 
}
/*
The longest word is 9 characters long.
*/

linq87(){
  var products = productsList(); 
  
  var categories = group(products, by:(p) => p.category)
    .map((g) => { 'Category': g.key, 'MostExpensivePrice': max(g.values.map((p) => p.unitPrice)) });      

  categories.forEach(print);
}
/*
{Category: Dairy Products, MostExpensivePrice: 55.0}
{Category: Grains/Cereals, MostExpensivePrice: 38.0}
{Category: Confections, MostExpensivePrice: 81.0}
{Category: Seafood, MostExpensivePrice: 62.5}
{Category: Condiments, MostExpensivePrice: 43.9}
{Category: Meat/Poultry, MostExpensivePrice: 123.79}
{Category: Produce, MostExpensivePrice: 53.0}
{Category: Beverages, MostExpensivePrice: 263.5}
*/

linq88(){
  var products = productsList(); 
  
  var categories = group(products, by:(p) => p.category)
    .map((g){
      var maxPrice = max(g.values.map((p) => p.unitPrice));
      return { 'Category': g.key, 'MostExpensiveProducts': g.values.where((p) => p.unitPrice == maxPrice) };
    });

  categories.forEach(print);
}
/*
{Category: Dairy Products, MostExpensiveProducts: {{productId: 59, productName: Raclette Courdavault, category: Dairy Products, unitPrice: 55.0, unitsInStock: 79}}}
{Category: Grains/Cereals, MostExpensiveProducts: {{productId: 56, productName: Gnocchi di nonna Alice, category: Grains/Cereals, unitPrice: 38.0, unitsInStock: 21}}}
{Category: Confections, MostExpensiveProducts: {{productId: 20, productName: Sir Rodney's Marmalade, category: Confections, unitPrice: 81.0, unitsInStock: 40}}}
{Category: Seafood, MostExpensiveProducts: {{productId: 18, productName: Carnarvon Tigers, category: Seafood, unitPrice: 62.5, unitsInStock: 42}}}
{Category: Condiments, MostExpensiveProducts: {{productId: 63, productName: Vegie-spread, category: Condiments, unitPrice: 43.9, unitsInStock: 24}}}
{Category: Meat/Poultry, MostExpensiveProducts: {{productId: 29, productName: Thüringer Rostbratwurst, category: Meat/Poultry, unitPrice: 123.79, unitsInStock: 0}}}
{Category: Produce, MostExpensiveProducts: {{productId: 51, productName: Manjimup Dried Apples, category: Produce, unitPrice: 53.0, unitsInStock: 20}}}
{Category: Beverages, MostExpensiveProducts: {{productId: 38, productName: Côte de Blaye, category: Beverages, unitPrice: 263.5, unitsInStock: 17}}}
*/

linq89(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  var averageNum = avg(numbers); 
  
  print("The average number is $averageNum.");
}
/*
The average number is 4.5.
*/

linq90(){
  var words = [ "cherry", "apple", "blueberry" ]; 
  
  var averageLength = avg(words.map((w) => w.length)); 
  
  print("The average word length is $averageLength characters."); 
}
/*
The average word length is 6.666666666666667 characters.
*/

linq91(){
  var products = productsList(); 
  
  var categories = group(products, by:(p) => p.category)
    .map((g) => { 'Category': g.key, 'AveragePrice': avg(g.values.map((p) => p.unitPrice)) });

  categories.forEach(print);
}
/*
{Category: Dairy Products, AveragePrice: 28.73}
{Category: Grains/Cereals, AveragePrice: 20.25}
{Category: Confections, AveragePrice: 25.16}
{Category: Seafood, AveragePrice: 20.6825}
{Category: Condiments, AveragePrice: 23.0625}
{Category: Meat/Poultry, AveragePrice: 54.00666666666667}
{Category: Produce, AveragePrice: 32.37}
{Category: Beverages, AveragePrice: 37.979166666666664}
*/

linq92(){
  var doubles = [ 1.7, 2.3, 1.9, 4.1, 2.9 ]; 
  
  var product = doubles.reduce((runningProduct, nextFactor) => runningProduct * nextFactor); 
  
  print("Total product of all numbers: $product");
}
/*
Total product of all numbers: 88.33080999999999
*/

linq93(){
  var startBalance = 100.0; 
  
  var attemptedWithdrawals = [ 20, 10, 40, 50, 10, 70, 30 ]; 
  
  var endBalance = attemptedWithdrawals.fold(startBalance, 
    (balance, nextWithdrawal) => 
      ((nextWithdrawal <= balance) ? (balance - nextWithdrawal) : balance)); 
  
  print("Ending balance: $endBalance"); 
}
/*
Ending balance: 20.0
*/
