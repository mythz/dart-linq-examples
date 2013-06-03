part of linq_samples;

doOrdering() =>
  runSamples("LINQ - Ordering Operators",
    {'linq28': 'OrderBy - Simple 1', 
     'linq29': 'OrderBy - Simple 2',
     'linq30': 'OrderBy - Simple 3',
     'linq31': 'OrderBy - Comparer',
     'linq32': 'OrderByDescending - Simple 1',
     'linq33': 'OrderByDescending - Simple 2',
     'linq34': 'OrderByDescending - Comparer',
     'linq35': 'ThenBy - Simple',
      'linq36': 'ThenBy - Comparer',
     'linq37': 'ThenByDescending - Simple',
     'linq38': 'ThenByDescending - Comparer',
     'linq39': 'Reverse'});

orderBy(List it, [Comparator compare]) =>
  it..sort(compare);

orderByAll(List it, List<Comparator> comparers) =>
  it..sort((a,b) => comparers
    .firstWhere((compare) => compare(a,b) != 0, orElse:() => (x,y) => 0)(a,b));

orderByDesc(List it, [Comparator compare]) =>
  it..sort((a,b) => compare != null ? compare(b,a) : b.compareTo(a));

caseInsensitiveComparer(a,b) => 
  a.toUpperCase().compareTo(b.toUpperCase());

linq28(){
  var words = [ "cherry", "apple", "blueberry" ]; 
  
  var sortedWords = orderBy(words);
  
  print("The sorted list of words:"); 
  sortedWords.forEach(print);
}
/*
The sorted list of words:
apple
blueberry
cherry
*/

linq29(){
  var words = [ "cherry", "apple", "blueberry" ]; 
  
  var sortedWords = orderBy(words, 
      (x,y) => x.length.compareTo(y.length));
  
  print("The sorted list of words (by length):"); 
  sortedWords.forEach(print);
}
/*
The sorted list of words (by length):
apple
cherry
blueberry
*/

linq30(){
  var products = productsList(); 
  
  var sortedProducts = orderBy(products, 
      (p1,p2) => p1.productName.compareTo(p2.productName));
  
  sortedProducts.forEach(print);
}
/*
{productId: 17, productName: Alice Mutton, category: Meat/Poultry, unitPrice: 39.0, unitsInStock: 0}
{productId: 3, productName: Aniseed Syrup, category: Condiments, unitPrice: 10.0, unitsInStock: 13}
{productId: 40, productName: Boston Crab Meat, category: Seafood, unitPrice: 18.4, unitsInStock: 123}
{productId: 60, productName: Camembert Pierrot, category: Dairy Products, unitPrice: 34.0, unitsInStock: 19}
{productId: 18, productName: Carnarvon Tigers, category: Seafood, unitPrice: 62.5, unitsInStock: 42}
...
*/

linq31(){
  var words = [ "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" ]; 
  
  var sortedWords = orderBy(words, caseInsensitiveComparer); 
  
  sortedWords.forEach(print);
}
/*
AbAcUs
aPPLE
BlUeBeRrY
bRaNcH
cHeRry
ClOvEr
*/

linq32(){
  var doubles = [ 1.7, 2.3, 1.9, 4.1, 2.9 ]; 
  
  var sortedDoubles = orderByDesc(doubles); 
  
  print("The doubles from highest to lowest:");   
  sortedDoubles.forEach(print);
}
/*
The doubles from highest to lowest:
4.1
2.9
2.3
1.9
1.7
*/

linq33(){
  var products = productsList(); 
  
  var sortedProducts = orderByDesc(products, 
      (a,b) => a.unitsInStock.compareTo(b.unitsInStock)); 
  
  sortedProducts.forEach(print);
}
/*
{productId: 75, productName: Rhönbräu Klosterbier, category: Beverages, unitPrice: 7.75, unitsInStock: 125}
{productId: 40, productName: Boston Crab Meat, category: Seafood, unitPrice: 18.4, unitsInStock: 123}
{productId: 6, productName: Grandma's Boysenberry Spread, category: Condiments, unitPrice: 25.0, unitsInStock: 120}
{productId: 55, productName: Pâté chinois, category: Meat/Poultry, unitPrice: 24.0, unitsInStock: 115}
{productId: 61, productName: Sirop d'érable, category: Condiments, unitPrice: 28.5, unitsInStock: 113}
...
*/

linq34(){
  var words = [ "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" ]; 
  
  var sortedWords = orderByDesc(words, caseInsensitiveComparer);
  
  sortedWords.forEach(print);
}
/*
ClOvEr
cHeRry
bRaNcH
BlUeBeRrY
aPPLE
AbAcUs
*/

linq35(){
  var digits = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]; 
  
  var sortedDigits = orderByAll(digits,
      [(a,b) => a.length.compareTo(b.length),
       (a,b) => a.compareTo(b)]);
  
  print("Sorted digits:"); 
  sortedDigits.forEach(print);
}
/*
Sorted digits:
one
six
two
five
four
nine
zero
eight
seven
three
*/

linq36(){
  var words = [ "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" ]; 
  
  var sortedWords = orderByAll(words,
      [(a,b) => a.length.compareTo(b.length),
       caseInsensitiveComparer]);
  
  sortedWords.forEach(print);
}
/*
aPPLE
AbAcUs
bRaNcH
cHeRry
ClOvEr
BlUeBeRrY
*/

linq37(){
  var products = productsList(); 

  var sortedProducts = orderByAll(products,
      [(a,b) => a.category.compareTo(b.category),
       (a,b) => b.unitPrice.compareTo(a.unitPrice)]);
  
  sortedProducts.forEach(print);
}
/*
{productId: 38, productName: Côte de Blaye, category: Beverages, unitPrice: 263.5, unitsInStock: 17}
{productId: 43, productName: Ipoh Coffee, category: Beverages, unitPrice: 46.0, unitsInStock: 17}
{productId: 2, productName: Chang, category: Beverages, unitPrice: 19.0, unitsInStock: 17}
{productId: 76, productName: Lakkalikööri, category: Beverages, unitPrice: 18.0, unitsInStock: 57}
{productId: 39, productName: Chartreuse verte, category: Beverages, unitPrice: 18.0, unitsInStock: 69}
{productId: 1, productName: Chai, category: Beverages, unitPrice: 18.0, unitsInStock: 39}
{productId: 35, productName: Steeleye Stout, category: Beverages, unitPrice: 18.0, unitsInStock: 20}
{productId: 70, productName: Outback Lager, category: Beverages, unitPrice: 15.0, unitsInStock: 15}
{productId: 34, productName: Sasquatch Ale, category: Beverages, unitPrice: 14.0, unitsInStock: 111}
...
*/

linq38(){
  var words = [ "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" ]; 
  
  var sortedWords = orderByAll(words,
      [(a,b) => a.length.compareTo(b.length),
       (a,b) => caseInsensitiveComparer(b, a)]); 

  sortedWords.forEach(print);
}
/*
aPPLE
ClOvEr
cHeRry
bRaNcH
AbAcUs
BlUeBeRrY
*/

linq39(){
  var digits = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]; 
  
  var reversedIDigits = digits
      .where((d) => d[1] == 'i')
      .toList()
      .reversed; 
  
  print("A backwards list of the digits with a second character of 'i':");
  reversedIDigits.forEach(print);
}
/*
A backwards list of the digits with a second character of 'i':
nine
eight
six
five
*/
