part of linq_samples;

doProjections() =>
  runSamples("LINQ - Projection Operators",
    {'linq6':  'Select - Simple 1', 
     'linq7':  'Select - Simple 2',
     'linq8':  'Select - Transformation',
     'linq9':  'Select - Anonymous Types 1',
     'linq10': 'Select - Anonymous Types 2',
     'linq11': 'Select - Anonymous Types 3',
     'linq12': 'Select - Indexed',
     'linq13': 'Select - Filtered',
     'linq14': 'SelectMany - Compound from 1',
     'linq15': 'SelectMany - Compound from 2',
     'linq16': 'SelectMany - Compound from 3',
     'linq17': 'SelectMany - from Assignment',
     'linq18': 'SelectMany - Multiple from',
     'linq19': 'SelectMany - Indexed'});

linq6(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  var numsPlusOne = numbers
    .map((n) => n + 1); 
  
  print("Numbers + 1:"); 
  numsPlusOne.forEach(print);
}
/*
Numbers + 1:
6
5
2
4
10
9
7
8
3
1
*/

linq7(){
  var products = productsList(); 
  
  var productNames = products
    .map((p) => p.productName); 
  
  print("Product Names:"); 
  productNames.forEach(print);  
}
/*
Product Names:
Chai
Chang
Aniseed Syrup
Chef Anton's Cajun Seasoning
Chef Anton's Gumbo Mix
...
*/

linq8(){
  var numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]; 
  var strings = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]; 
  
  var textNums = numbers
    .map((n) => strings[n]); 
  
  print("Number strings:"); 
  textNums.forEach(print);  
}
/*
Number strings:
five
four
one
three
nine
eight
six
seven
two
zero
*/

linq9(){
  var words = ["aPPLE", "BlUeBeRrY", "cHeRry"]; 
  
  var upperLowerWords = words 
    .map((w) => { 'Upper': w.toUpperCase(), 'Lower': w.toLowerCase() });
      
  upperLowerWords.forEach((ul) => 
    print("Uppercase: ${ul['Upper']}, Lowercase: ${ul['Lower']}")); 
}
/*
Uppercase: APPLE, Lowercase: apple
Uppercase: BLUEBERRY, Lowercase: blueberry
Uppercase: CHERRY, Lowercase: cherry
*/

linq10(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  var strings = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]; 
  
  var digitOddEvens = numbers 
    .map((n) => { 'Digit': strings[n], 'Even': (n % 2 == 0) }); 
      
  digitOddEvens.forEach((d) => 
    print("The digit ${d['Digit']} is ${d['Even'] ? 'even' : 'odd'}.")); 
}
/*
The digit five is odd.
The digit four is even.
The digit one is odd.
The digit three is odd.
The digit nine is odd.
The digit eight is even.
The digit six is even.
The digit seven is odd.
The digit two is even.
The digit zero is even.
*/

linq11(){
  var products = productsList(); 
  
  var productInfos = products 
    .map((p) => { 'ProductName':p.productName, 'Category':p.category, 'Price': p.unitPrice }); 
      
  print("Product Info:"); 
  productInfos.forEach((p) =>
    print("${p['ProductName']} is in the category ${p['Category']} and costs ${p['Price']} per unit."));
}
/*
Product Info:
Chai is in the category Beverages and costs 18.0 per unit.
Chang is in the category Beverages and costs 19.0 per unit.
Aniseed Syrup is in the category Condiments and costs 10.0 per unit.
...
*/

linq12(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  int index = 0;
  var numsInPlace = numbers
    .map((num) => { 'Num': num, 'InPlace': (num == index++) }); 
  
  print("Number: In-place?"); 
  numsInPlace.forEach((n) =>
    print("${n['Num']}: ${n['InPlace']}"));
}
/*
Number: In-place?
5: false
4: false
1: false
3: true
9: false
8: false
6: true
7: true
2: false
0: false
*/

linq13(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  var digits = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]; 
  
  var lowNums = numbers 
    .where((n) => n < 5)
    .map((n) => digits[n]); 
  
  print("Numbers < 5:"); 
  lowNums.forEach(print);   
}
/*
Numbers < 5:
four
one
three
two
zero
*/

linq14(){
  var numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]; 
  var numbersB = [ 1, 3, 5, 7, 8 ]; 
  
  var pairs = numbersA
    .expand((a) => numbersB
      .where((b) => a < b)
      .map((b) => { 'a':a, 'b':b }));
  
  print("Pairs where a < b:"); 
  pairs.forEach((pair) =>
    print("${pair['a']} is less than ${pair['b']}"));  
}
/*
Pairs where a < b:
0 is less than 1
0 is less than 3
0 is less than 5
0 is less than 7
0 is less than 8
2 is less than 3
2 is less than 5
2 is less than 7
2 is less than 8
4 is less than 5
4 is less than 7
4 is less than 8
5 is less than 7
5 is less than 8
6 is less than 7
6 is less than 8
*/

linq15(){
  var customers = customersList(); 
  
  var orders = customers
    .expand((c) => c.orders
      .where((o) => o.total < 500)
      .map((o) => { 'CustomerId': c.customerId, 'OrderId':o.orderId, 'Total':o.total }));
  
  orders.forEach(print);   
}
/*
{CustomerId: ALFKI, OrderId: 10702, Total: 330.0}
{CustomerId: ALFKI, OrderId: 10952, Total: 471.2}
{CustomerId: ANATR, OrderId: 10308, Total: 88.8}
{CustomerId: ANATR, OrderId: 10625, Total: 479.75}
...
*/

linq16(){
  var customers = customersList(); 
  
  var orders = customers
    .expand((c) => c.orders
      .where((o) => o.orderDate.isAfter(new DateTime(1998, 1, 1)))
      .map((o) => { 'CustomerId': c.customerId, 'OrderId':o.orderId, 'OrderDate':o.orderDate }));
  
  orders.forEach(print);   
}
/*
{CustomerId: ALFKI, OrderId: 10835, OrderDate: 1998-01-15 00:00:00.000}
{CustomerId: ALFKI, OrderId: 10952, OrderDate: 1998-03-16 00:00:00.000}
{CustomerId: ALFKI, OrderId: 11011, OrderDate: 1998-04-09 00:00:00.000}
{CustomerId: ANATR, OrderId: 10926, OrderDate: 1998-03-04 00:00:00.000}
{CustomerId: ANTON, OrderId: 10856, OrderDate: 1998-01-28 00:00:00.000}
...
*/

linq17(){
  var customers = customersList(); 
  
  var orders = customers
    .expand((c) => c.orders
      .where((o) => o.total >= 2000)
      .map((o) => { 'CustomerId': c.customerId, 'OrderId':o.orderId, 'Total':o.total }));
  
  orders.forEach(print);   
}
/*
{CustomerId: ANTON, OrderId: 10573, Total: 2082.0}
{CustomerId: AROUT, OrderId: 10558, Total: 2142.9}
{CustomerId: AROUT, OrderId: 10953, Total: 4441.25}
{CustomerId: BERGS, OrderId: 10384, Total: 2222.4}
{CustomerId: BERGS, OrderId: 10524, Total: 3192.65}
...
*/

linq18(){
  var customers = customersList(); 

  var cutoffDate = new DateTime(1997, 1, 1); 
  
  var orders = customers
    .where((c) => c.region == "WA")
    .expand((c) => c.orders
      .where((o) => o.orderDate.isAfter(cutoffDate))
      .map((o) => { 'CustomerId': c.customerId, 'OrderId':o.orderId }));
  
  orders.forEach(print);   
}
/*
{CustomerId: LAZYK, OrderId: 10482}
{CustomerId: LAZYK, OrderId: 10545}
{CustomerId: TRAIH, OrderId: 10574}
{CustomerId: TRAIH, OrderId: 10577}
{CustomerId: TRAIH, OrderId: 10822}
{CustomerId: WHITC, OrderId: 10469}
{CustomerId: WHITC, OrderId: 10483}
{CustomerId: WHITC, OrderId: 10504}
{CustomerId: WHITC, OrderId: 10596}
{CustomerId: WHITC, OrderId: 10693}
{CustomerId: WHITC, OrderId: 10696}
{CustomerId: WHITC, OrderId: 10723}
{CustomerId: WHITC, OrderId: 10740}
{CustomerId: WHITC, OrderId: 10861}
{CustomerId: WHITC, OrderId: 10904}
{CustomerId: WHITC, OrderId: 11032}
{CustomerId: WHITC, OrderId: 11066}
*/

linq19(){
  var customers = customersList(); 

  int custIndex = 0;
  var customerOrders = 
    customers.expand((cust) {
      custIndex++;
      return cust.orders.map((o) => 
        "Customer #${custIndex} has an order with OrderID ${o.orderId}");
    }); 
    
  customerOrders.forEach(print);   
}
/*
Customer #1 has an order with OrderID 10643
Customer #1 has an order with OrderID 10692
Customer #1 has an order with OrderID 10702
Customer #1 has an order with OrderID 10835
Customer #1 has an order with OrderID 10952
Customer #1 has an order with OrderID 11011
Customer #2 has an order with OrderID 10308
Customer #2 has an order with OrderID 10625
Customer #2 has an order with OrderID 10759
Customer #2 has an order with OrderID 10926
...
*/
