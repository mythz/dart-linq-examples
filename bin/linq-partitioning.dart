part of linq_samples;

doPartitioning() =>
  runSamples("LINQ - Partitioning Operators",
    {'linq20': 'Take - Simple', 
     'linq21': 'Take - Nested',
     'linq22': 'Skip - Simple',
     'linq23': 'Skip - Nested',
     'linq24': 'TakeWhile - Simple',
     'linq25': 'TakeWhile - Indexed',
     'linq26': 'SkipWhile - Simple',
     'linq27': 'SkipWhile - Indexed'});

linq20(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  var first3Numbers = numbers.take(3); 

  print("First 3 numbers:"); 
  first3Numbers.forEach(print); 
}
/*
First 3 numbers:
5
4
1
*/

linq21(){
  var customers = customersList(); 
  
  var first3WAOrders = customers
    .where((c) => c.region == "WA")
    .expand((c) => c.orders
      .map((o) => { 'CustomerId': c.customerId, 'OrderId':o.orderId, 'OrderDate':o.orderDate }))
    .take(3);
  
  print("First 3 orders in WA:");
  first3WAOrders.forEach(print);
}
/*
First 3 orders in WA:
{CustomerId: LAZYK, OrderId: 10482, OrderDate: 1997-03-21 00:00:00.000}
{CustomerId: LAZYK, OrderId: 10545, OrderDate: 1997-05-22 00:00:00.000}
{CustomerId: TRAIH, OrderId: 10574, OrderDate: 1997-06-19 00:00:00.000}
*/

linq22(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  var allButFirst4Numbers = numbers.skip(4); 

  print("All but first 4 numbers:");
  allButFirst4Numbers.forEach(print);
}
/*
All but first 4 numbers:
9
8
6
7
2
0
*/

linq23(){
  var customers = customersList(); 
  
  var waOrders = customers
    .where((c) => c.region == "WA")
    .expand((c) => c.orders
      .map((o) => { 'CustomerId': c.customerId, 'OrderId':o.orderId, 'OrderDate':o.orderDate }));

  var allButFirst2Orders = waOrders.skip(2);
  
  print("All but first 2 orders in WA:");
  allButFirst2Orders.forEach(print);
}
/*
All but first 2 orders in WA:
{CustomerId: TRAIH, OrderId: 10574, OrderDate: 1997-06-19 00:00:00.000}
{CustomerId: TRAIH, OrderId: 10577, OrderDate: 1997-06-23 00:00:00.000}
{CustomerId: TRAIH, OrderId: 10822, OrderDate: 1998-01-08 00:00:00.000}
{CustomerId: WHITC, OrderId: 10269, OrderDate: 1996-07-31 00:00:00.000}
{CustomerId: WHITC, OrderId: 10344, OrderDate: 1996-11-01 00:00:00.000}
{CustomerId: WHITC, OrderId: 10469, OrderDate: 1997-03-10 00:00:00.000}
{CustomerId: WHITC, OrderId: 10483, OrderDate: 1997-03-24 00:00:00.000}
{CustomerId: WHITC, OrderId: 10504, OrderDate: 1997-04-11 00:00:00.000}
{CustomerId: WHITC, OrderId: 10596, OrderDate: 1997-07-11 00:00:00.000}
{CustomerId: WHITC, OrderId: 10693, OrderDate: 1997-10-06 00:00:00.000}
{CustomerId: WHITC, OrderId: 10696, OrderDate: 1997-10-08 00:00:00.000}
{CustomerId: WHITC, OrderId: 10723, OrderDate: 1997-10-30 00:00:00.000}
{CustomerId: WHITC, OrderId: 10740, OrderDate: 1997-11-13 00:00:00.000}
{CustomerId: WHITC, OrderId: 10861, OrderDate: 1998-01-30 00:00:00.000}
{CustomerId: WHITC, OrderId: 10904, OrderDate: 1998-02-24 00:00:00.000}
{CustomerId: WHITC, OrderId: 11032, OrderDate: 1998-04-17 00:00:00.000}
{CustomerId: WHITC, OrderId: 11066, OrderDate: 1998-05-01 00:00:00.000}
*/

linq24(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  var firstNumbersLessThan6 = numbers.takeWhile((n) => n < 6); 
  
  print("First numbers less than 6:"); 
  firstNumbersLessThan6.forEach(print);
}
/*
First numbers less than 6:
5
4
1
3
*/

linq25(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  int index = 0;
  var firstSmallNumbers = numbers.takeWhile((n) => n >= index++); 

  print("First numbers not less than their position:"); 
  firstSmallNumbers.forEach(print);
}
/*
First numbers not less than their position:
5
4
*/

linq26(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  var allButFirst3Numbers = numbers.skipWhile((n) => n % 3 != 0); 
  print("All elements starting from first element divisible by 3:"); 
  allButFirst3Numbers.forEach(print);
}
/*
All elements starting from first element divisible by 3:
3
9
8
6
7
2
0
*/

linq27(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  int index = 0;
  var laterNumbers = numbers.skipWhile((n) => n >= index++); 
  
  print("All elements starting from first element less than its position:"); 
  laterNumbers.forEach(print);
}
/*
All elements starting from first element less than its position:
1
3
9
8
6
7
2
0
*/

