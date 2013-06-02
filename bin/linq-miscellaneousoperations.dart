part of linq_samples;

doMiscellaneousOperations() =>
  doAll([linq94,
         linq95,
         linq96,
         linq97]);

concat(Iterable it, Iterable withIt) {
  it.toList().addAll(withIt);
  return it;
}
bool seqEq(Iterable it, Iterable withIt) =>    
  it.length == withIt.length 
  && range(it.length).every((i) => it.elementAt(i) == withIt.elementAt(i));

linq94(){
  var numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]; 
  var numbersB = [ 1, 3, 5, 7, 8 ]; 
  
  var allNumbers = concat(numbersA, numbersB); 
  
  print("All numbers from both arrays:");
  allNumbers.forEach(print);
}
/*
All numbers from both arrays:
0
2
4
5
6
8
9
1
3
5
7
8
*/

linq95(){
  var customers = customersList(); 
  var products = productsList(); 
  
  var customerNames = customers
    .map((c) => c.companyName);
  var productNames = products
    .map((p) => p.productName);
  
  var allNames = concat(customerNames, productNames); 
  
  print("Customer and product names:");
  allNames.forEach(print);
}
/*
Customer and product names:
Alfreds Futterkiste
Ana Trujillo Emparedados y helados
Antonio Moreno Taquer�a
Around the Horn
Berglunds snabbk�p
Blauer See Delikatessen
...
*/

linq96(){
  var wordsA = [ "cherry", "apple", "blueberry" ]; 
  var wordsB = [ "cherry", "apple", "blueberry" ]; 
  
  bool match = seqEq(wordsA, wordsB); 
  
  print("The sequences match: $match");
}
/*
The sequences match: true
*/

linq97(){
  var wordsA = [ "cherry", "apple", "blueberry" ]; 
  var wordsB = [ "apple", "blueberry", "cherry" ]; 
  
  bool match = seqEq(wordsA, wordsB); 
  
  print("The sequences match: $match");
}
/*
The sequences match: false
*/