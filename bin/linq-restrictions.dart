part of linq_samples;

doRestrictions() =>
  runSamples("LINQ - Restriction Operators", 
    {'linq1': 'Where - Simple 1', 
     'linq2': 'Where - Simple 2',
     'linq3': 'Where - Simple 3',
     'linq4': 'Where - Drilldown',
     'linq5': 'Where - Indexed'});

linq1(){
  var numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]; 
  
  var lowNums = numbers
    .where((n) => n < 5); 
  
  print("Numbers < 5:"); 
  lowNums.forEach(print);
}
/*
Numbers < 5:
4
1
3
2
0
*/

linq2() {
  var products = productsList(); 
  
  var soldOutProducts = products
    .where((p) => p.unitsInStock == 0);
  
  print("Sold out products:");
  soldOutProducts.forEach((p) => print("${p.productName} is sold out!"));
}
/*
Sold out products:
Chef Anton's Gumbo Mix is sold out!
Alice Mutton is sold out!
Thüringer Rostbratwurst is sold out!
Gorgonzola Telino is sold out!
Perth Pasties is sold out!
*/

linq3(){  
  var products = productsList(); 
  
  var expensiveInStockProducts = products
    .where((p) => p.unitsInStock > 0 && p.unitPrice > 3.00);
      
  print("In-stock products that cost more than 3.00:");
  expensiveInStockProducts.forEach((p) =>
    print("${p.productName} is in stock and costs more than 3.00."));
} 
/*
In-stock products that cost more than 3.00:
Chai is in stock and costs more than 3.00.
Chang is in stock and costs more than 3.00.
Aniseed Syrup is in stock and costs more than 3.00.
...
*/

linq4(){
  var customers = customersList(); 
  var waCustomers = customers
      .where((c) => c.region == "WA"); 

  print("Customers from Washington and their orders:");
  waCustomers.forEach((Customer c) {
    print("Customer ${c.customerId}: ${c.companyName}");
    c.orders.forEach((o) => print("  Order ${o.orderId}: ${o.orderDate}"));
  });
}
/*
Customers from Washington and their orders:
Customer LAZYK: Lazy K Kountry Store
  Order 10482: 1997-03-21T00:00:00
  Order 10545: 1997-05-22T00:00:00
Customer TRAIH: Trail's Head Gourmet Provisioners
  Order 10574: 1997-06-19T00:00:00
  Order 10577: 1997-06-23T00:00:00
  Order 10822: 1998-01-08T00:00:00
...
*/

linq5() { 
  var digits = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]; 
  
  int index=0;
  var shortDigits = digits.where((digit) => digit.length < index++); 
  
  print("Short digits:"); 
  shortDigits.forEach((d) => print("The word $d is shorter than its value."));
}
/*
Short digits:
The word five is shorter than its value.
The word six is shorter than its value.
The word seven is shorter than its value.
The word eight is shorter than its value.
The word nine is shorter than its value.
*/

