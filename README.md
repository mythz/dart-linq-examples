101 LINQ Samples in Dart
========================

Port of the [C# 101 LINQ Samples](http://code.msdn.microsoft.com/101-LINQ-Samples-3fb9811b) rewritten into idiomatic Dart and utilizing its functional collection mixins.

Compare Dart to other LINQ examples written in:

 - [Python](https://github.com/rogerwcpt/python-linq-samples)
 - [Swift](https://github.com/mythz/swift-linq-examples)
 - [Java](https://github.com/mythz/java-linq-examples)
 - [Kotlin](https://github.com/mythz/kotlin-linq-examples)
 - [Clojure](https://github.com/mythz/clojure-linq-examples)
 - [Elixir](https://github.com/omnibs/elixir-linq-examples)
 - [Groovy](https://gitlab.com/svermeulen/groovy-linq-samples)
 - [#Script](https://sharpscript.net/linq/restriction-operators)

## [Call .NET Web Services from Dart](http://docs.servicestack.net/dart-add-servicestack-reference)

If you're looking for an effortles typed API for consuming .NET Web Services in Flutter, Dart VM, AngularDart or Dart Web Apps checkout ServiceStack's [Dart Add ServiceStack Reference](http://docs.servicestack.net/dart-add-servicestack-reference).

### Running the examples

You can choose to run specific examples by commenting the sections you're not interested in [play.dart](https://github.com/dartist/101LinqSamples/blob/master/bin/play.dart). 

To see the full output of all the examples, run [play.dart](https://github.com/dartist/101LinqSamples/blob/master/bin/play.dart) locally.

### Contents

The samples below mirrors the C# LINQ samples layout with the names of the top-level Dart methods matching their corresponding C# examples.

#### [LINQ - Restriction Operators](https://github.com/dartist/101LinqSamples/blob/master/bin/linq-restrictions.dart) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Restriction-Operators-b15d29ca)
#### [LINQ - Projection Operators](https://github.com/dartist/101LinqSamples/blob/master/bin/linq-projections.dart) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-to-DataSets-09787825)
#### [LINQ - Partitioning Operators](https://github.com/dartist/101LinqSamples/blob/master/bin/linq-partitioning.dart) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Partitioning-Operators-c68aaccc)
#### [LINQ - Ordering Operators](https://github.com/dartist/101LinqSamples/blob/master/bin/linq-ordering.dart) / [MSDN C#](http://code.msdn.microsoft.com/SQL-Ordering-Operators-050af19e)
#### [LINQ - Grouping Operators](https://github.com/dartist/101LinqSamples/blob/master/bin/linq-grouping.dart) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-to-DataSets-Grouping-c62703ea)
#### [LINQ - Set Operators](https://github.com/dartist/101LinqSamples/blob/master/bin/linq-setoperations.dart) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Set-Operators-374f34fe)
#### [LINQ - Conversion Operators](https://github.com/dartist/101LinqSamples/blob/master/bin/linq-conversionoperations.dart) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Conversion-Operators-e4e59714)
#### [LINQ - Element Operators](https://github.com/dartist/101LinqSamples/blob/master/bin/linq-elementoperations.dart) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Element-Operators-0f3f12ce)
#### [LINQ - Generation Operators](https://github.com/dartist/101LinqSamples/blob/master/bin/linq-generationoperations.dart) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Generation-Operators-8a3fbff7)
#### [LINQ - Quantifiers](https://github.com/dartist/101LinqSamples/blob/master/bin/linq-quantifiers.dart) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Quantifiers-f00e7e3e)
#### [LINQ - Aggregate Operators](https://github.com/dartist/101LinqSamples/blob/master/bin/linq-aggregateoperations.dart) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Aggregate-Operators-c51b3869)
#### [LINQ - Miscellaneous Operators](https://github.com/dartist/101LinqSamples/blob/master/bin/linq-miscellaneousoperations.dart) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Miscellaneous-6b72bb2a)
#### [LINQ - Query Execution](https://github.com/dartist/101LinqSamples/blob/master/bin/linq-queryexecution.dart) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Query-Execution-ce0d3b95)
#### [LINQ - Join Operators](https://github.com/dartist/101LinqSamples/blob/master/bin/linq-joinoperators.dart) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Join-Operators-dabef4e9)

##  Side-by-side - C# LINQ vs Dart functional collections

For a side-by-side comparison, the original **C#** source code is displayed above the equivalent **Dart** translation. 

  - The **Output** shows the console output of running the **Dart** sample. 
  - Outputs ending with `...` illustrates only a partial response is displayed. 
  - The source-code for C# and Dart utils used are included once under the first section they're used in.
  - The C# ObjectDumper util used is downloadable from MSDN - [ObjectDumper.zip](http://code.msdn.microsoft.com/Visual-Studio-2008-C-d295cdba/file/46086/1/ObjectDumper.zip)

LINQ - Restriction Operators
----------------------------

### linq1: Where - Simple 1

```csharp
//c#
public void Linq1() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    var lowNums = 
        from n in numbers 
        where n < 5 
        select n; 
  
    Console.WriteLine("Numbers < 5:"); 
    foreach (var x in lowNums) 
    { 
        Console.WriteLine(x); 
    } 
}  
```
```dart
//dart
linq1(){
  var numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]; 
  
  var lowNums = numbers
    .where((n) => n < 5); 
  
  print("Numbers < 5:"); 
  lowNums.forEach(print);
}
```
#### Output

    Numbers < 5:
    4
    1
    3
    2
    0
  
### linq2: Where - Simple 2
```csharp
//c#
public void Linq2() 
{ 
    List<Product> products = GetProductList(); 
  
    var soldOutProducts = 
        from p in products 
        where p.UnitsInStock == 0 
        select p; 
  
    Console.WriteLine("Sold out products:"); 
    foreach (var product in soldOutProducts) 
    { 
        Console.WriteLine("{0} is sold out!", product.ProductName); 
    } 
} 
```
```dart
//dart
linq2(){
  var products = productsList(); 
  
  var soldOutProducts = products
    .where((p) => p.unitsInStock == 0);
  
  print("Sold out products:");
  soldOutProducts.forEach((p) => print("${p.productName} is sold out!"));
}
```
#### Output

    Sold out products:
    Chef Anton's Gumbo Mix is sold out!
    Alice Mutton is sold out!
    Th�ringer Rostbratwurst is sold out!
    Gorgonzola Telino is sold out!
    Perth Pasties is sold out!

### linq3: Where - Simple 3
```csharp
//c#
public void Linq3() 
{ 
    List<Product> products = GetProductList(); 
  
    var expensiveInStockProducts = 
        from p in products 
        where p.UnitsInStock > 0 && p.UnitPrice > 3.00M 
        select p; 
  
    Console.WriteLine("In-stock products that cost more than 3.00:"); 
    foreach (var product in expensiveInStockProducts) 
    { 
        Console.WriteLine("{0} is in stock and costs more than 3.00.", product.ProductName); 
    } 
} 
```
```dart
//dart
linq3(){  
  var products = productsList(); 
  
  var expensiveInStockProducts = products
    .where((p) => p.unitsInStock > 0 && p.unitPrice > 3.00);
      
  print("In-stock products that cost more than 3.00:");
  expensiveInStockProducts.forEach((p) =>
    print("${p.productName} is in stock and costs more than 3.00."));
} 
```
#### Output

    In-stock products that cost more than 3.00:
    Chai is in stock and costs more than 3.00.
    Chang is in stock and costs more than 3.00.
    Aniseed Syrup is in stock and costs more than 3.00.
    ...

### linq4: Where - Drilldown
```csharp
//c#
public void Linq4() 
{ 
    List<Customer> customers = GetCustomerList(); 
  
    var waCustomers = 
        from c in customers 
        where c.Region == "WA" 
        select c; 
  
    Console.WriteLine("Customers from Washington and their orders:"); 
    foreach (var customer in waCustomers) 
    { 
        Console.WriteLine("Customer {0}: {1}", customer.CustomerID, customer.CompanyName); 
        foreach (var order in customer.Orders) 
        { 
            Console.WriteLine("  Order {0}: {1}", order.OrderID, order.OrderDate); 
        } 
    } 
} 
```
```dart
//dart
linq4(){
  var customers = customersList(); 
  var waCustomers = customers
      .where((c) => c.region == "WA"); 

  print("Customers from Washington and their orders:");
  waCustomers.forEach((Customer c){
    print("Customer ${c.customerId}: ${c.companyName}");
    c.orders.forEach((o) => print("  Order ${o.orderId}: ${o.orderDate}"));
  });
}
```
#### Output

    Customers from Washington and their orders:
    Customer LAZYK: Lazy K Kountry Store
      Order 10482: 1997-03-21T00:00:00
      Order 10545: 1997-05-22T00:00:00
    Customer TRAIH: Trail's Head Gourmet Provisioners
      Order 10574: 1997-06-19T00:00:00
      Order 10577: 1997-06-23T00:00:00
      Order 10822: 1998-01-08T00:00:00
    ...

### linq5: Where - Indexed
```csharp
//c#
public void Linq5() 
{ 
    string[] digits = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" }; 
  
    var shortDigits = digits.Where((digit, index) => digit.Length < index); 
  
    Console.WriteLine("Short digits:"); 
    foreach (var d in shortDigits) 
    { 
        Console.WriteLine("The word {0} is shorter than its value.", d); 
    } 
}
```
```dart
//dart
linq5(){ 
  var digits = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]; 
  
  int index=0;
  var shortDigits = digits.where((digit) => digit.length < index++); 
  
  print("Short digits:"); 
  shortDigits.forEach((d) => print("The word $d is shorter than its value."));
}
```
#### Output

    Short digits:
    The word five is shorter than its value.
    The word six is shorter than its value.
    The word seven is shorter than its value.
    The word eight is shorter than its value.
    The word nine is shorter than its value.


LINQ - Projection Operators
---------------------------

### linq6: Select - Simple 1
```csharp
//c#
public void Linq6() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    var numsPlusOne = 
        from n in numbers 
        select n + 1; 
  
    Console.WriteLine("Numbers + 1:"); 
    foreach (var i in numsPlusOne) 
    { 
        Console.WriteLine(i); 
    } 
}
```
```dart
//dart
linq6(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  var numsPlusOne = numbers
    .map((n) => n + 1); 
  
  print("Numbers + 1:"); 
  numsPlusOne.forEach(print);
}
```
#### Output

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

### linq7: Select - Simple 2
```csharp
//c#
public void Linq7() 
{ 
    List<Product> products = GetProductList(); 
  
    var productNames = 
        from p in products 
        select p.ProductName; 
  
    Console.WriteLine("Product Names:"); 
    foreach (var productName in productNames) 
    { 
        Console.WriteLine(productName); 
    } 
}
```
```dart
//dart
linq7(){
  var products = productsList(); 
  
  var productNames = products
    .map((p) => p.productName); 
  
  print("Product Names:"); 
  productNames.forEach(print);  
}
```
#### Output

    Product Names:
    Chai
    Chang
    Aniseed Syrup
    Chef Anton's Cajun Seasoning
    Chef Anton's Gumbo Mix
    ...

### linq8: Select - Transformation
```csharp
//c#
public void Linq8() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
    string[] strings = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" }; 
  
    var textNums = 
        from n in numbers 
        select strings[n]; 
  
    Console.WriteLine("Number strings:"); 
    foreach (var s in textNums) 
    { 
        Console.WriteLine(s); 
    } 
}
```
```dart
//dart
linq8(){
  var numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]; 
  var strings = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]; 
  
  var textNums = numbers
    .map((n) => strings[n]); 
  
  print("Number strings:"); 
  textNums.forEach(print);  
}
```
#### Output

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

### linq9: Select - Anonymous Types 1
```csharp
//c#
public void Linq9() 
{ 
    string[] words = { "aPPLE", "BlUeBeRrY", "cHeRry" }; 
  
    var upperLowerWords = 
        from w in words 
        select new { Upper = w.ToUpper(), Lower = w.ToLower() }; 
  
    foreach (var ul in upperLowerWords) 
    { 
        Console.WriteLine("Uppercase: {0}, Lowercase: {1}", ul.Upper, ul.Lower); 
    } 
}
```
```dart
//dart
linq9(){
  var words = ["aPPLE", "BlUeBeRrY", "cHeRry"]; 
  
  var upperLowerWords = words 
    .map((w) => { 'Upper': w.toUpperCase(), 'Lower': w.toLowerCase() });
      
  upperLowerWords.forEach((ul) => 
    print("Uppercase: ${ul['Upper']}, Lowercase: ${ul['Lower']}")); 
}
```
#### Output

    Uppercase: APPLE, Lowercase: apple
    Uppercase: BLUEBERRY, Lowercase: blueberry
    Uppercase: CHERRY, Lowercase: cherry

### linq10: Select - Anonymous Types 2
```csharp
//c#
public void Linq10() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
    string[] strings = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" }; 
  
    var digitOddEvens = 
        from n in numbers 
        select new { Digit = strings[n], Even = (n % 2 == 0) }; 
  
    foreach (var d in digitOddEvens) 
    { 
        Console.WriteLine("The digit {0} is {1}.", d.Digit, d.Even ? "even" : "odd"); 
    } 
}
```
```dart
//dart
linq10(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  var strings = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]; 
  
  var digitOddEvens = numbers 
    .map((n) => { 'Digit': strings[n], 'Even': (n % 2 == 0) }); 
      
  digitOddEvens.forEach((d) => 
    print("The digit ${d['Digit']} is ${d['Even'] ? 'even' : 'odd'}.")); 
}
```
#### Output

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

### linq11: Select - Anonymous Types 3
```csharp
//c#
public void Linq11() 
{ 
    List<Product> products = GetProductList(); 
  
    var productInfos = 
        from p in products 
        select new { p.ProductName, p.Category, Price = p.UnitPrice }; 
  
    Console.WriteLine("Product Info:"); 
    foreach (var productInfo in productInfos) 
    { 
        Console.WriteLine("{0} is in the category {1} and costs {2} per unit.", productInfo.ProductName, productInfo.Category, productInfo.Price); 
    } 
}
```
```dart
//dart
linq11(){
  var products = productsList(); 
  
  var productInfos = products 
    .map((p) => { 'ProductName':p.productName, 'Category':p.category, 'Price': p.unitPrice }); 
      
  print("Product Info:"); 
  productInfos.forEach((p) =>
    print("${p['ProductName']} is in the category ${p['Category']} and costs ${p['Price']} per unit."));
}
```
#### Output

    Product Info:
    Chai is in the category Beverages and costs 18.0 per unit.
    Chang is in the category Beverages and costs 19.0 per unit.
    Aniseed Syrup is in the category Condiments and costs 10.0 per unit.
    ...

### linq12: Select - Indexed
```csharp
//c#
public void Linq12() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    var numsInPlace = numbers.Select((num, index) => new { Num = num, InPlace = (num == index) }); 
  
    Console.WriteLine("Number: In-place?"); 
    foreach (var n in numsInPlace) 
    { 
        Console.WriteLine("{0}: {1}", n.Num, n.InPlace); 
    } 
}
```
```dart
//dart
linq12(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  int index = 0;
  var numsInPlace = numbers
    .map((num) => { 'Num': num, 'InPlace': (num == index++) }); 
  
  print("Number: In-place?"); 
  numsInPlace.forEach((n) =>
    print("${n['Num']}: ${n['InPlace']}"));
}
```
#### Output

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

### linq13: Select - Filtered
```csharp
//c#
public void Linq13() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
    string[] digits = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" }; 
  
    var lowNums = 
        from n in numbers 
        where n < 5 
        select digits[n]; 
  
    Console.WriteLine("Numbers < 5:"); 
    foreach (var num in lowNums) 
    { 
        Console.WriteLine(num); 
    } 
}
```
```dart
//dart
linq13(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  var digits = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]; 
  
  var lowNums = numbers 
    .where((n) => n < 5)
    .map((n) => digits[n]); 
  
  print("Numbers < 5:"); 
  lowNums.forEach(print);   
}
```
#### Output

    Numbers < 5:
    four
    one
    three
    two
    zero

### linq14: SelectMany - Compound from 1
```csharp
//c#
public void Linq14() 
{ 
    int[] numbersA = { 0, 2, 4, 5, 6, 8, 9 }; 
    int[] numbersB = { 1, 3, 5, 7, 8 }; 
  
    var pairs = 
        from a in numbersA 
        from b in numbersB 
        where a < b 
        select new { a, b }; 
  
    Console.WriteLine("Pairs where a < b:"); 
    foreach (var pair in pairs) 
    { 
        Console.WriteLine("{0} is less than {1}", pair.a, pair.b); 
    } 
}
```
```dart
//dart
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
```
#### Output

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

### linq15: SelectMany - Compound from 2
```csharp
//c#
public void Linq15() 
{ 
    List<Customer> customers = GetCustomerList(); 
  
    var orders = 
        from c in customers 
        from o in c.Orders 
        where o.Total < 500.00M 
        select new { c.CustomerID, o.OrderID, o.Total }; 
  
    ObjectDumper.Write(orders); 
}
```
```dart
//dart
linq15(){
  var customers = customersList(); 
  
  var orders = customers
    .expand((c) => c.orders
      .where((o) => o.total < 500)
      .map((o) => { 'CustomerId': c.customerId, 'OrderId':o.orderId, 'Total':o.total }));
  
  orders.forEach(print);   
}
```
#### Output

    {CustomerId: ALFKI, OrderId: 10702, Total: 330.0}
    {CustomerId: ALFKI, OrderId: 10952, Total: 471.2}
    {CustomerId: ANATR, OrderId: 10308, Total: 88.8}
    {CustomerId: ANATR, OrderId: 10625, Total: 479.75}
    ...

### linq16: SelectMany - Compound from 3
```csharp
//c#
public void Linq16() 
{ 
    List<Customer> customers = GetCustomerList(); 
  
    var orders = 
        from c in customers 
        from o in c.Orders 
        where o.OrderDate >= new DateTime(1998, 1, 1) 
        select new { c.CustomerID, o.OrderID, o.OrderDate }; 
  
    ObjectDumper.Write(orders); 
}
```
```dart
//dart
linq16(){
  var customers = customersList(); 
  
  var orders = customers
    .expand((c) => c.orders
      .where((o) => o.orderDate.isAfter(new DateTime(1998, 1, 1)))
      .map((o) => { 'CustomerId': c.customerId, 'OrderId':o.orderId, 'OrderDate':o.orderDate }));
  
  orders.forEach(print);   
}
```
#### Output

    {CustomerId: ALFKI, OrderId: 10835, OrderDate: 1998-01-15 00:00:00.000}
    {CustomerId: ALFKI, OrderId: 10952, OrderDate: 1998-03-16 00:00:00.000}
    {CustomerId: ALFKI, OrderId: 11011, OrderDate: 1998-04-09 00:00:00.000}
    {CustomerId: ANATR, OrderId: 10926, OrderDate: 1998-03-04 00:00:00.000}
    {CustomerId: ANTON, OrderId: 10856, OrderDate: 1998-01-28 00:00:00.000}
    ...

### linq17: SelectMany - from Assignment
```csharp
//c#
public void Linq17() 
{ 
    List<Customer> customers = GetCustomerList(); 
  
    var orders = 
        from c in customers 
        from o in c.Orders 
        where o.Total >= 2000.0M 
        select new { c.CustomerID, o.OrderID, o.Total }; 
  
    ObjectDumper.Write(orders); 
}
```
```dart
//dart
linq17(){
  var customers = customersList(); 
  
  var orders = customers
    .expand((c) => c.orders
      .where((o) => o.total >= 2000)
      .map((o) => { 'CustomerId': c.customerId, 'OrderId':o.orderId, 'Total':o.total }));
  
  orders.forEach(print);   
}
```
#### Output

    {CustomerId: ANTON, OrderId: 10573, Total: 2082.0}
    {CustomerId: AROUT, OrderId: 10558, Total: 2142.9}
    {CustomerId: AROUT, OrderId: 10953, Total: 4441.25}
    {CustomerId: BERGS, OrderId: 10384, Total: 2222.4}
    {CustomerId: BERGS, OrderId: 10524, Total: 3192.65}
    ...

### linq18: SelectMany - Multiple from
```csharp
//c#
public void Linq18() 
{ 
    List<Customer> customers = GetCustomerList(); 
  
    DateTime cutoffDate = new DateTime(1997, 1, 1); 
  
    var orders = 
        from c in customers 
        where c.Region == "WA" 
        from o in c.Orders 
        where o.OrderDate >= cutoffDate 
        select new { c.CustomerID, o.OrderID }; 
  
    ObjectDumper.Write(orders); 
}
```
```dart
//dart
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
```
#### Output

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

### linq19: SelectMany - Indexed
```csharp
//c#
public void Linq19() 
{ 
    List<Customer> customers = GetCustomerList(); 
  
    var customerOrders = 
        customers.SelectMany( 
            (cust, custIndex) => 
            cust.Orders.Select(o => "Customer #" + (custIndex + 1) + 
                                    " has an order with OrderID " + o.OrderID)); 
  
    ObjectDumper.Write(customerOrders); 
}
```
```dart
//dart
linq19(){
  var customers = customersList(); 

  int custIndex = 0;
  var customerOrders = 
    customers.expand((cust){
      custIndex++;
      return cust.orders.map((o) => 
        "Customer #${custIndex} has an order with OrderID ${o.orderId}");
    }); 
    
  customerOrders.forEach(print);   
}
```
#### Output

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

LINQ - Partitioning Operators
-----------------------------

### linq20: Take - Simple
```csharp
//c#
public void Linq20() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 

    var first3Numbers = numbers.Take(3); 
  
    Console.WriteLine("First 3 numbers:"); 
  
    foreach (var n in first3Numbers) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```dart
//dart
linq20(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  var first3Numbers = numbers.take(3); 

  print("First 3 numbers:"); 
  first3Numbers.forEach(print); 
}
```
#### Output

    First 3 numbers:
    5
    4
    1

### linq21: Take - Nested
```csharp
//c#
public void Linq21()   
{ 
    List<Customer> customers = GetCustomerList(); 
  
    var first3WAOrders = ( 
        from c in customers 
        from o in c.Orders 
        where c.Region == "WA" 
        select new { c.CustomerID, o.OrderID, o.OrderDate }) 
        .Take(3); 
  
    Console.WriteLine("First 3 orders in WA:"); 
    foreach (var order in first3WAOrders) 
    { 
        ObjectDumper.Write(order); 
    } 
}
```
```dart
//dart
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
```
#### Output

    First 3 orders in WA:
    {CustomerId: LAZYK, OrderId: 10482, OrderDate: 1997-03-21 00:00:00.000}
    {CustomerId: LAZYK, OrderId: 10545, OrderDate: 1997-05-22 00:00:00.000}
    {CustomerId: TRAIH, OrderId: 10574, OrderDate: 1997-06-19 00:00:00.000}


### linq22: Skip - Simple
```csharp
//c#
public void Linq22() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    var allButFirst4Numbers = numbers.Skip(4); 
  
    Console.WriteLine("All but first 4 numbers:"); 
    foreach (var n in allButFirst4Numbers) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```dart
//dart
linq22(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  var allButFirst4Numbers = numbers.skip(4); 

  print("All but first 4 numbers:");
  allButFirst4Numbers.forEach(print);
}
```
#### Output

    All but first 4 numbers:
    9
    8
    6
    7
    2
    0

### linq23: Skip - Nested
```csharp
//c#
public void Linq23()   
{ 
    List<Customer> customers = GetCustomerList(); 
  
    var waOrders = 
        from c in customers 
        from o in c.Orders 
        where c.Region == "WA" 
        select new { c.CustomerID, o.OrderID, o.OrderDate }; 
  
    var allButFirst2Orders = waOrders.Skip(2); 
  
    Console.WriteLine("All but first 2 orders in WA:"); 
    foreach (var order in allButFirst2Orders) 
    { 
        ObjectDumper.Write(order); 
    } 
}
```
```dart
//dart
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
```
#### Output

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

### linq24: TakeWhile - Simple
```csharp
//c#
public void Linq24() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    var firstNumbersLessThan6 = numbers.TakeWhile(n => n < 6); 
  
    Console.WriteLine("First numbers less than 6:"); 
    foreach (var n in firstNumbersLessThan6) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```dart
//dart
linq24(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  var firstNumbersLessThan6 = numbers.takeWhile((n) => n < 6); 
  
  print("First numbers less than 6:"); 
  firstNumbersLessThan6.forEach(print);
}
```
#### Output

    First numbers less than 6:
    5
    4
    1
    3

### linq25: TakeWhile - Indexed
```csharp
//c#
public void Linq25() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    var firstSmallNumbers = numbers.TakeWhile((n, index) => n >= index); 
  
    Console.WriteLine("First numbers not less than their position:"); 
    foreach (var n in firstSmallNumbers) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```dart
//dart
linq25(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  int index = 0;
  var firstSmallNumbers = numbers.takeWhile((n) => n >= index++); 

  print("First numbers not less than their position:"); 
  firstSmallNumbers.forEach(print);
}
```
#### Output

    First numbers not less than their position:
    5
    4

### linq26: SkipWhile - Simple
```csharp
//c#
public void Linq26() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    var allButFirst3Numbers = numbers.SkipWhile(n => n % 3 != 0); 
  
    Console.WriteLine("All elements starting from first element divisible by 3:"); 
    foreach (var n in allButFirst3Numbers) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```dart
//dart
linq26(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  var allButFirst3Numbers = numbers.skipWhile((n) => n % 3 != 0); 
  print("All elements starting from first element divisible by 3:"); 
  allButFirst3Numbers.forEach(print);
}
```
#### Output

    All elements starting from first element divisible by 3:
    3
    9
    8
    6
    7
    2
    0

### linq27: SkipWhile - Indexed
```csharp
//c#
public void Linq27() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    var laterNumbers = numbers.SkipWhile((n, index) => n >= index); 
  
    Console.WriteLine("All elements starting from first element less than its position:"); 
    foreach (var n in laterNumbers) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```dart
//dart
linq27(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  int index = 0;
  var laterNumbers = numbers.skipWhile((n) => n >= index++); 
  
  print("All elements starting from first element less than its position:"); 
  laterNumbers.forEach(print);
}
```
#### Output

    All elements starting from first element less than its position:
    1
    3
    9
    8
    6
    7
    2
    0


LINQ - Ordering Operators
-------------------------

### C# utils added

```csharp  
public class CaseInsensitiveComparer : IComparer<string> 
{ 
    public int Compare(string x, string y) 
    { 
        return string.Compare(x, y, StringComparison.OrdinalIgnoreCase); 
    } 
}
```

### Dart utils added

```dart
wrap(value, fn(x)) => fn(value);

order(List seq, {Comparator by, List<Comparator> byAll, on(x), List<Function> onAll}) =>
  by != null ? 
    (seq..sort(by)) 
  : byAll != null ?
    (seq..sort((a,b) => byAll
      .firstWhere((compare) => compare(a,b) != 0, orElse:() => (x,y) => 0)(a,b)))
  : on != null ? 
    (seq..sort((a,b) => on(a).compareTo(on(b)))) 
  : onAll != null ?
    (seq..sort((a,b) =>
      wrap(onAll.firstWhere((_on) => _on(a).compareTo(_on(b)) != 0, orElse:() => (x) => 0),
        (_on) => _on(a).compareTo(_on(b)) 
    ))) 
  : (seq..sort()); 

caseInsensitiveComparer(a,b) => 
  a.toUpperCase().compareTo(b.toUpperCase());
```

### linq28: OrderBy - Simple 1
```csharp
//c#
public void Linq28() 
{ 
    string[] words = { "cherry", "apple", "blueberry" }; 
  
    var sortedWords = 
        from w in words 
        orderby w 
        select w; 
  
    Console.WriteLine("The sorted list of words:"); 
    foreach (var w in sortedWords) 
    { 
        Console.WriteLine(w); 
    } 
}
```
```dart
//dart
linq28(){
  var words = [ "cherry", "apple", "blueberry" ]; 
  
  var sortedWords = order(words);
  
  print("The sorted list of words:"); 
  sortedWords.forEach(print);
}
```
#### Output

    The sorted list of words:
    apple
    blueberry
    cherry

### linq29: OrderBy - Simple 2
```csharp
//c#
public void Linq29() 
{ 
    string[] words = { "cherry", "apple", "blueberry" }; 
  
    var sortedWords = 
        from w in words 
        orderby w.Length 
        select w; 
  
    Console.WriteLine("The sorted list of words (by length):"); 
    foreach (var w in sortedWords) 
    { 
        Console.WriteLine(w); 
    } 
}
```
```dart
//dart
linq29(){
  var words = [ "cherry", "apple", "blueberry" ]; 
  
  var sortedWords = order(words, on:(a) => a.length);
  
  print("The sorted list of words (by length):"); 
  sortedWords.forEach(print);
}
```
#### Output

    The sorted list of words (by length):
    apple
    cherry
    blueberry

### linq30: OrderBy - Simple 3
```csharp
//c#
public void Linq30() 
{ 
    List<Product> products = GetProductList(); 
  
    var sortedProducts = 
        from p in products 
        orderby p.ProductName 
        select p; 
  
    ObjectDumper.Write(sortedProducts); 
}
```
```dart
//dart
linq30(){
  var products = productsList(); 
  
  var sortedProducts = order(products, on:(a) => a.productName);
  
  sortedProducts.forEach(print);
}
```
#### Output

    {productId: 17, productName: Alice Mutton, category: Meat/Poultry, unitPrice: 39.0, unitsInStock: 0}
    {productId: 3, productName: Aniseed Syrup, category: Condiments, unitPrice: 10.0, unitsInStock: 13}
    {productId: 40, productName: Boston Crab Meat, category: Seafood, unitPrice: 18.4, unitsInStock: 123}
    {productId: 60, productName: Camembert Pierrot, category: Dairy Products, unitPrice: 34.0, unitsInStock: 19}
    {productId: 18, productName: Carnarvon Tigers, category: Seafood, unitPrice: 62.5, unitsInStock: 42}
    ...

### linq31: OrderBy - Comparer
```csharp
//c#
public void Linq31() 
{ 
    string[] words = { "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" }; 
  
    var sortedWords = words.OrderBy(a => a, new CaseInsensitiveComparer()); 
  
    ObjectDumper.Write(sortedWords); 
} 
```
```dart
//dart
linq31(){
  var words = [ "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" ]; 
  
  var sortedWords = order(words, by:caseInsensitiveComparer); 
  
  sortedWords.forEach(print);
}
```
#### Output

    AbAcUs
    aPPLE
    BlUeBeRrY
    bRaNcH
    cHeRry
    ClOvEr

### linq32: OrderByDescending - Simple 1
```csharp
//c#
public void Linq32() 
{ 
    double[] doubles = { 1.7, 2.3, 1.9, 4.1, 2.9 }; 
  
    var sortedDoubles = 
        from d in doubles 
        orderby d descending 
        select d; 
  
    Console.WriteLine("The doubles from highest to lowest:"); 
    foreach (var d in sortedDoubles) 
    { 
        Console.WriteLine(d); 
    } 
}
```
```dart
//dart
linq32(){
  var doubles = [ 1.7, 2.3, 1.9, 4.1, 2.9 ]; 
  
  var sortedDoubles = order(doubles).reversed; 
  
  print("The doubles from highest to lowest:");   
  sortedDoubles.forEach(print);
}
```
#### Output

    The doubles from highest to lowest:
    4.1
    2.9
    2.3
    1.9
    1.7

### linq33: OrderByDescending - Simple 2
```csharp
//c#
public void Linq33() 
{ 
    List<Product> products = GetProductList(); 
  
    var sortedProducts = 
        from p in products 
        orderby p.UnitsInStock descending 
        select p; 
  
    ObjectDumper.Write(sortedProducts); 
}
```
```dart
//dart
linq33(){
  var products = productsList(); 
  
  var sortedProducts = order(products, on:(a) => a.unitsInStock).reversed; 
  
  sortedProducts.forEach(print);
}
```
#### Output

    {productId: 75, productName: Rh�nbr�u Klosterbier, category: Beverages, unitPrice: 7.75, unitsInStock: 125}
    {productId: 40, productName: Boston Crab Meat, category: Seafood, unitPrice: 18.4, unitsInStock: 123}
    {productId: 6, productName: Grandma's Boysenberry Spread, category: Condiments, unitPrice: 25.0, unitsInStock: 120}
    {productId: 55, productName: P�t� chinois, category: Meat/Poultry, unitPrice: 24.0, unitsInStock: 115}
    {productId: 61, productName: Sirop d'�rable, category: Condiments, unitPrice: 28.5, unitsInStock: 113}
    ...

### linq34: OrderByDescending - Comparer
```csharp
//c#
public void Linq34() 
{ 
    string[] words = { "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" }; 
  
    var sortedWords = words.OrderByDescending(a => a, new CaseInsensitiveComparer()); 
  
    ObjectDumper.Write(sortedWords); 
} 
```
```dart
//dart
linq34(){
  var words = [ "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" ]; 
  
  var sortedWords = order(words, by:caseInsensitiveComparer).reversed;
  
  sortedWords.forEach(print);
}
```
#### Output

    ClOvEr
    cHeRry
    bRaNcH
    BlUeBeRrY
    aPPLE
    AbAcUs

### linq35: ThenBy - Simple
```csharp
//c#
public void Linq35() 
{ 
    string[] digits = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" }; 
  
    var sortedDigits = 
        from d in digits 
        orderby d.Length, d 
        select d; 
  
    Console.WriteLine("Sorted digits:"); 
    foreach (var d in sortedDigits) 
    { 
        Console.WriteLine(d); 
    } 
}
```
```dart
//dart
linq35(){
  var digits = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]; 
  
  var sortedDigits = order(digits, onAll:[(a) => a.length, (a) => a]);
  
  print("Sorted digits:"); 
  sortedDigits.forEach(print);
}
```
#### Output

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

### linq36: ThenBy - Comparer
```csharp
//c#
public void Linq36() 
{ 
    string[] words = { "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" }; 
  
    var sortedWords = 
        words.OrderBy(a => a.Length) 
             .ThenBy(a => a, new CaseInsensitiveComparer()); 
  
    ObjectDumper.Write(sortedWords); 
} 
```
```dart
//dart
linq36(){
  var words = [ "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" ]; 
  
  var sortedWords = order(words, byAll:[(a,b) => a.length.compareTo(b.length), caseInsensitiveComparer]);
  
  sortedWords.forEach(print);
}
```
#### Output

    aPPLE
    AbAcUs
    bRaNcH
    cHeRry
    ClOvEr
    BlUeBeRrY

### linq37: ThenByDescending - Simple
```csharp
//c#
public void Linq37() 
{ 
    List<Product> products = GetProductList(); 
  
    var sortedProducts = 
        from p in products 
        orderby p.Category, p.UnitPrice descending 
        select p; 
  
    ObjectDumper.Write(sortedProducts); 
}
```
```dart
//dart
linq37(){
  var products = productsList(); 

  var sortedProducts = order(products, onAll:[(a) => a.category, (a) => a.unitPrice * -1]);
  
  sortedProducts.forEach(print);
}
```
#### Output

    {productId: 38, productName: C�te de Blaye, category: Beverages, unitPrice: 263.5, unitsInStock: 17}
    {productId: 43, productName: Ipoh Coffee, category: Beverages, unitPrice: 46.0, unitsInStock: 17}
    {productId: 2, productName: Chang, category: Beverages, unitPrice: 19.0, unitsInStock: 17}
    {productId: 76, productName: Lakkalik��ri, category: Beverages, unitPrice: 18.0, unitsInStock: 57}
    {productId: 39, productName: Chartreuse verte, category: Beverages, unitPrice: 18.0, unitsInStock: 69}
    {productId: 1, productName: Chai, category: Beverages, unitPrice: 18.0, unitsInStock: 39}
    {productId: 35, productName: Steeleye Stout, category: Beverages, unitPrice: 18.0, unitsInStock: 20}
    {productId: 70, productName: Outback Lager, category: Beverages, unitPrice: 15.0, unitsInStock: 15}
    {productId: 34, productName: Sasquatch Ale, category: Beverages, unitPrice: 14.0, unitsInStock: 111}
    ...

### linq38: ThenByDescending - Comparer
```csharp
//c#
public void Linq38() 
{ 
    string[] words = { "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" }; 
  
    var sortedWords = 
        words.OrderBy(a => a.Length) 
             .ThenByDescending(a => a, new CaseInsensitiveComparer()); 
  
    ObjectDumper.Write(sortedWords); 
} 
```
```dart
//dart
linq38(){
  var words = [ "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" ]; 
  
  var sortedWords = order(words, 
    byAll:[(a,b) => a.length.compareTo(b.length), (a,b) => caseInsensitiveComparer(b,a)]); 

  sortedWords.forEach(print);
}
```
#### Output

    aPPLE
    ClOvEr
    cHeRry
    bRaNcH
    AbAcUs
    BlUeBeRrY

### linq39: Reverse
```csharp
//c#
public void Linq39() 
{ 
    string[] digits = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" }; 
  
    var reversedIDigits = ( 
        from d in digits 
        where d[1] == 'i' 
        select d) 
        .Reverse(); 
  
    Console.WriteLine("A backwards list of the digits with a second character of 'i':"); 
    foreach (var d in reversedIDigits) 
    { 
        Console.WriteLine(d); 
    } 
}
```
```dart
//dart
linq39(){
  var digits = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]; 
  
  var reversedIDigits = digits
    .where((d) => d[1] == 'i')
    .toList()
    .reversed; 
  
  print("A backwards list of the digits with a second character of 'i':");
  reversedIDigits.forEach(print);
}
```
#### Output

    A backwards list of the digits with a second character of 'i':
    nine
    eight
    six
    five


LINQ - Grouping Operators
-------------------------

### C# utils added

```csharp
public class AnagramEqualityComparer : IEqualityComparer<string> 
{ 
    public bool Equals(string x, string y) 
    { 
        return getCanonicalString(x) == getCanonicalString(y); 
    } 
  
    public int GetHashCode(string obj) 
    { 
        return getCanonicalString(obj).GetHashCode(); 
    } 
  
    private string getCanonicalString(string word) 
    { 
        char[] wordChars = word.ToCharArray(); 
        Array.Sort<char>(wordChars); 
        return new string(wordChars); 
    } 
} 
```

### Dart utils added

```dart
anagramEqualityComparer(a, b) => 
  new String.fromCharCodes(orderBy(a.codeUnits.toList()))
  .compareTo(new String.fromCharCodes(orderBy(b.codeUnits.toList())));

List<Group> group(Iterable seq, {by(x):null, Comparator matchWith:null, valuesAs(x):null}){
  var ret = [];
  var map = new Map<dynamic, Group>();
  seq.forEach((x){
    var val = by(x);
    var key = matchWith != null
      ? map.keys.firstWhere((k) => matchWith(val, k) == 0, orElse:() => val)
      : val;
    
    if (!map.containsKey(key))
      map[key] = new Group(val);
    
    if (valuesAs != null)
      x = valuesAs(x);
    
    map[key].add(x);
  });
  return map.values.toList();
}

class Group extends IterableBase {
  var key;
  List _list;
  Group(this.key) : _list = [];

  get iterator => _list.iterator;
  void add(e) => _list.add(e);  
  get values => _list;
}
```

### linq40: GroupBy - Simple 1
```csharp
//c#
public void Linq40() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    var numberGroups = 
        from n in numbers 
        group n by n % 5 into g 
        select new { Remainder = g.Key, Numbers = g }; 
  
    foreach (var g in numberGroups) 
    { 
        Console.WriteLine("Numbers with a remainder of {0} when divided by 5:", g.Remainder); 
        foreach (var n in g.Numbers) 
        { 
            Console.WriteLine(n); 
        } 
    } 
}
```
```dart
//dart
linq40(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  var numberGroups = group(numbers, by:(n) => n % 5)
    .map((g) => {'Remainder':g.key, 'Numbers':g});
      
  numberGroups.forEach((g){
    print("Numbers with a remainder of ${g['Remainder']} when divided by 5:"); 
    g['Numbers'].forEach(print);
  });
}
```
#### Output

    Numbers with a remainder of 0 when divided by 5:
    5
    0
    Numbers with a remainder of 1 when divided by 5:
    1
    6
    Numbers with a remainder of 2 when divided by 5:
    7
    2
    Numbers with a remainder of 3 when divided by 5:
    3
    8
    Numbers with a remainder of 4 when divided by 5:
    4
    9

### linq41: GroupBy - Simple 2
```csharp
//c#
public void Linq41() 
{ 
    string[] words = { "blueberry", "chimpanzee", "abacus", "banana", "apple", "cheese" }; 
  
    var wordGroups = 
        from w in words 
        group w by w[0] into g 
        select new { FirstLetter = g.Key, Words = g }; 
  
    foreach (var g in wordGroups) 
    { 
        Console.WriteLine("Words that start with the letter '{0}':", g.FirstLetter); 
        foreach (var w in g.Words) 
        { 
            Console.WriteLine(w); 
        } 
    } 
}
```
```dart
linq41(){
  var words = [ "blueberry", "chimpanzee", "abacus", "banana", "apple", "cheese" ]; 
  
  var wordGroups = group(words, by:(w) => w[0])
    .map((g) => { 'FirstLetter': g.key, 'Words': g }); 
      
  wordGroups.forEach((g){
    print("Words that start with the letter '${g['FirstLetter']}':"); 
    g['Words'].forEach(print);
  });
}
```
#### Output

    //dart
    Words that start with the letter 'c':
    chimpanzee
    cheese
    Words that start with the letter 'a':
    abacus
    apple
    Words that start with the letter 'b':
    blueberry
    banana

### linq42: GroupBy - Simple 3
```csharp
//c#
public void Linq42() 
{ 
    List<Product> products = GetProductList(); 
  
    var orderGroups = 
        from p in products 
        group p by p.Category into g 
        select new { Category = g.Key, Products = g }; 
  
    ObjectDumper.Write(orderGroups, 1); 
} 
```
```dart
//dart
linq42(){
  var products = productsList(); 
  
  var orderGroups = group(products, by:(p) => p.category)
    .map((g) => { 'Category': g.key, 'Products': g });
 
  orderGroups.forEach(print);
}
```
#### Output

    {Category: Dairy Products, Products: {{productId: 11, productName: Queso Cabrales, category: Dairy Products, unitPrice: 21.0, unitsInStock: 22}, {productId: 12, productName: Queso Manchego La Pastora, category: Dairy Products, unitPrice: 38.0, unitsInStock: 86}, {productId: 31, productName: Gorgonzola Telino, category: Dairy Products, unitPrice: 12.5, unitsInStock: 0}, {productId: 32, productName: Mascarpone Fabioli, category: Dairy Products, unitPrice: 32.0, unitsInStock: 9}, {productId: 33, productName: Geitost, category: Dairy Products, unitPrice: 2.5, unitsInStock: 112}, {productId: 59, productName: Raclette Courdavault, category: Dairy Products, unitPrice: 55.0, unitsInStock: 79}, {productId: 60, productName: Camembert Pierrot, category: Dairy Products, unitPrice: 34.0, unitsInStock: 19}, {productId: 69, productName: Gudbrandsdalsost, category: Dairy Products, unitPrice: 36.0, unitsInStock: 26}, {productId: 71, productName: Flotemysost, category: Dairy Products, unitPrice: 21.5, unitsInStock: 26}, {productId: 72, productName: Mozzarella di Giovanni, category: Dairy Products, unitPrice: 34.8, unitsInStock: 14}}}
    {Category: Grains/Cereals, Products: {{productId: 22, productName: Gustaf's Kn�ckebr�d, category: Grains/Cereals, unitPrice: 21.0, unitsInStock: 104}, {productId: 23, productName: Tunnbr�d, category: Grains/Cereals, unitPrice: 9.0, unitsInStock: 61}, {productId: 42, productName: Singaporean Hokkien Fried Mee, category: Grains/Cereals, unitPrice: 14.0, unitsInStock: 26}, {productId: 52, productName: Filo Mix, category: Grains/Cereals, unitPrice: 7.0, unitsInStock: 38}, {productId: 56, productName: Gnocchi di nonna Alice, category: Grains/Cereals, unitPrice: 38.0, unitsInStock: 21}, {productId: 57, productName: Ravioli Angelo, category: Grains/Cereals, unitPrice: 19.5, unitsInStock: 36}, {productId: 64, productName: Wimmers gute Semmelkn�del, category: Grains/Cereals, unitPrice: 33.25, unitsInStock: 22}}}

### linq43: GroupBy - Nested
```csharp
//c#
public void Linq43() 
{ 
    List<Customer> customers = GetCustomerList(); 
  
    var customerOrderGroups = 
        from c in customers 
        select 
            new 
            { 
                c.CompanyName, 
                YearGroups = 
                    from o in c.Orders 
                    group o by o.OrderDate.Year into yg 
                    select 
                        new 
                        { 
                            Year = yg.Key, 
                            MonthGroups = 
                                from o in yg 
                                group o by o.OrderDate.Month into mg 
                                select new { Month = mg.Key, Orders = mg } 
                        } 
            }; 
  
    ObjectDumper.Write(customerOrderGroups, 3); 
} 
```
```dart
//dart
linq43(){
  var customers = customersList(); 
  
  var customerOrderGroups = customers
      .map((c) => {
        'CompanyName': c.companyName, 
        'YearGroups': group(c.orders, by:(o) => o.orderDate.year)
          .map((yg) => {
            'Year': yg.key, 
            'MonthGroups': group(yg, by:(o) => o.orderDate.month)
              .map((mg) => { 'Month': mg.key, 'Orders': mg }) 
          })
      });

  customerOrderGroups.forEach(print);
}
```
#### Output

    {CompanyName: Alfreds Futterkiste, YearGroups: {{Year: 1997, MonthGroups: {{Month: 8, Orders: {{orderId: 10643, orderDate: 1997-08-25 00:00:00.000, total: 814.5}}}, {Month: 10, Orders: {{orderId: 10692, orderDate: 1997-10-03 00:00:00.000, total: 878.0}, {orderId: 10702, orderDate: 1997-10-13 00:00:00.000, total: 330.0}}}}}, {Year: 1998, MonthGroups: {{Month: 1, Orders: {{orderId: 10835, orderDate: 1998-01-15 00:00:00.000, total: 845.8}}}, {Month: 3, Orders: {{orderId: 10952, orderDate: 1998-03-16 00:00:00.000, total: 471.2}}}, {Month: 4, Orders: {{orderId: 11011, orderDate: 1998-04-09 00:00:00.000, total: 933.5}}}}}}}
    {CompanyName: Ana Trujillo Emparedados y helados, YearGroups: {{Year: 1996, MonthGroups: {{Month: 9, Orders: {{orderId: 10308, orderDate: 1996-09-18 00:00:00.000, total: 88.8}}}}}, {Year: 1997, MonthGroups: {{Month: 8, Orders: {{orderId: 10625, orderDate: 1997-08-08 00:00:00.000, total: 479.75}}}, {Month: 11, Orders: {{orderId: 10759, orderDate: 1997-11-28 00:00:00.000, total: 320.0}}}}}, {Year: 1998, MonthGroups: {{Month: 3, Orders: {{orderId: 10926, orderDate: 1998-03-04 00:00:00.000, total: 514.4}}}}}}}

### linq44: GroupBy - Comparer
```csharp
//c#
public void Linq44() 
{ 
    string[] anagrams = { "from   ", " salt", " earn ", "  last   ", " near ", " form  " }; 
  
    var orderGroups = anagrams.GroupBy(w => w.Trim(), new AnagramEqualityComparer()); 
  
    ObjectDumper.Write(orderGroups, 1); 
} 
```
```dart
//dart
linq44(){
  var anagrams = [ "from   ", " salt", " earn ", "  last   ", " near ", " form  " ]; 
  
  var orderGroups = group(anagrams, by:(w) => w.trim(), matchWith:anagramEqualityComparer); 
  
  orderGroups.forEach((x) => print(x.values)); 
}
```
#### Output

    [ salt,   last   ]
    [ earn ,  near ]
    [from   ,  form  ]

### linq45: GroupBy - Comparer, Mapped    
```csharp
//c#
public void Linq45() 
{ 
    string[] anagrams = { "from   ", " salt", " earn ", "  last   ", " near ", " form  " }; 
  
    var orderGroups = anagrams.GroupBy( 
                w => w.Trim(), 
                a => a.ToUpper(), 
                new AnagramEqualityComparer() 
                ); 
  
    ObjectDumper.Write(orderGroups, 1); 
} 
```
```dart
//dart
linq45(){
  var anagrams = [ "from   ", " salt", " earn ", "  last   ", " near ", " form  " ]; 
  
  var orderGroups = group(anagrams, 
    by: (w) => w.trim(), 
    matchWith: anagramEqualityComparer, 
    valuesAs: (w) => w.toUpperCase()); 
  
  orderGroups.forEach((x) => print(x.values)); 
}
```
#### Output

    [ SALT,   LAST   ]
    [ EARN ,  NEAR ]
    [FROM   ,  FORM  ]


LINQ - Set Operators
--------------------

### linq46: Distinct - 1
```csharp
//c#
public void Linq46() 
{ 
    int[] factorsOf300 = { 2, 2, 3, 5, 5 }; 
  
    var uniqueFactors = factorsOf300.Distinct(); 
  
    Console.WriteLine("Prime factors of 300:"); 
    foreach (var f in uniqueFactors) 
    { 
        Console.WriteLine(f); 
    } 
}
```
```dart
//dart
linq46(){
  var factorsOf300 = [ 2, 2, 3, 5, 5 ]; 
  
  var uniqueFactors = factorsOf300.toSet(); 

  print("Prime factors of 300:");
  uniqueFactors.forEach(print);
}
```
#### Output

    Prime factors of 300:
    2
    3
    5

### linq47: Distinct - 2
```csharp
//c#
public void Linq47() 
{ 
    List<Product> products = GetProductList(); 
  
    var categoryNames = ( 
        from p in products 
        select p.Category) 
        .Distinct(); 
  
    Console.WriteLine("Category names:"); 
    foreach (var n in categoryNames) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```dart
//dart
linq47(){
  var products = productsList(); 
  
  var categoryNames = products 
    .map((p) => p.category)
    .toSet(); 
  
  print("Category names:"); 
  categoryNames.forEach(print);
}
```
#### Output

    Category names:
    Dairy Products
    Grains/Cereals
    Confections
    Seafood
    Condiments
    Meat/Poultry
    Produce
    Beverages

### linq48: Union - 1
```csharp
//c#
public void Linq48() 
{ 
    int[] numbersA = { 0, 2, 4, 5, 6, 8, 9 }; 
    int[] numbersB = { 1, 3, 5, 7, 8 }; 
  
    var uniqueNumbers = numbersA.Union(numbersB); 
  
    Console.WriteLine("Unique numbers from both arrays:"); 
    foreach (var n in uniqueNumbers) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```dart
//dart
linq48(){
  var numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]; 
  var numbersB = [ 1, 3, 5, 7, 8 ]; 
  
  var uniqueNumbers = numbersA.toSet().union(numbersB.toSet()); 
  
  print("Unique numbers from both arrays:"); 
  uniqueNumbers.forEach(print);
}
```
#### Output

    Unique numbers from both arrays:
    0
    1
    2
    3
    4
    5
    6
    7
    8
    9

### linq49: Union - 2
```csharp
//c#
public void Linq49() 
{ 
    List<Product> products = GetProductList(); 
    List<Customer> customers = GetCustomerList(); 
  
    var productFirstChars = 
        from p in products 
        select p.ProductName[0]; 
    var customerFirstChars = 
        from c in customers 
        select c.CompanyName[0]; 
  
    var uniqueFirstChars = productFirstChars.Union(customerFirstChars); 
  
    Console.WriteLine("Unique first letters from Product names and Customer names:"); 
    foreach (var ch in uniqueFirstChars) 
    { 
        Console.WriteLine(ch); 
    } 
}
```
```dart
//dart
linq49(){
  var products = productsList(); 
  var customers = customersList(); 
  
  var productFirstChars = products 
    .map((p) => p.productName[0]); 
  var customerFirstChars = customers
    .map((c) => c.companyName[0]); 
  
  var uniqueFirstChars = productFirstChars.toSet().union(customerFirstChars.toSet()); 
  
  print("Unique first letters from Product names and Customer names:"); 
  uniqueFirstChars.forEach(print);
}
```
#### Output

    Unique first letters from Product names and Customer names:
    S
    F
    T
    N
    K
    E
    V
    Z
    Q
    M
    C
    L
    A
    J
    W
    P
    B
    O
    H
    D
    R
    I
    G
    U

### linq50: Intersect - 1
```csharp
//c#
public void Linq50() 
{ 
    int[] numbersA = { 0, 2, 4, 5, 6, 8, 9 }; 
    int[] numbersB = { 1, 3, 5, 7, 8 }; 
  
    var commonNumbers = numbersA.Intersect(numbersB); 
  
    Console.WriteLine("Common numbers shared by both arrays:"); 
    foreach (var n in commonNumbers) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```dart
//dart
linq50(){
  var numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]; 
  var numbersB = [ 1, 3, 5, 7, 8 ]; 
  
  var commonNumbers = numbersA.toSet().intersection(numbersB.toSet()); 
  
  print("Common numbers shared by both arrays:"); 
  commonNumbers.forEach(print);
}
```
#### Output

    Common numbers shared by both arrays:
    8
    5

### linq51: Intersect - 2
```csharp
//c#
public void Linq51() 
{ 
    List<Product> products = GetProductList(); 
    List<Customer> customers = GetCustomerList(); 
  
    var productFirstChars = 
        from p in products 
        select p.ProductName[0]; 
    var customerFirstChars = 
        from c in customers 
        select c.CompanyName[0]; 
  
    var commonFirstChars = productFirstChars.Intersect(customerFirstChars); 
  
    Console.WriteLine("Common first letters from Product names and Customer names:"); 
    foreach (var ch in commonFirstChars) 
    { 
        Console.WriteLine(ch); 
    } 
}
```
```dart
//dart
linq51(){
  var products = productsList(); 
  var customers = customersList(); 
  
  var productFirstChars = products 
    .map((p) => p.productName[0]); 
  var customerFirstChars = customers
    .map((c) => c.companyName[0]); 
  
  var commonFirstChars = productFirstChars.toSet().intersection(customerFirstChars.toSet()); 
  
  print("Common first letters from Product names and Customer names:"); 
  commonFirstChars.forEach(print);
}
```
#### Output

    Common first letters from Product names and Customer names:
    F
    S
    T
    N
    K
    E
    V
    Q
    M
    C
    L
    A
    O
    W
    P
    B
    I
    G
    R

### linq52: Except - 1
```csharp
//c#
public void Linq52() 
{ 
    int[] numbersA = { 0, 2, 4, 5, 6, 8, 9 }; 
    int[] numbersB = { 1, 3, 5, 7, 8 }; 
  
    IEnumerable<int> aOnlyNumbers = numbersA.Except(numbersB); 
  
    Console.WriteLine("Numbers in first array but not second array:"); 
    foreach (var n in aOnlyNumbers) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```dart
//dart
linq52(){
  var numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]; 
  var numbersB = [ 1, 3, 5, 7, 8 ]; 
  
  var aOnlyNumbers = numbersA.toSet().difference(numbersB.toSet()); 
  
  print("Numbers in first array but not second array:"); 
  aOnlyNumbers.forEach(print);
}
```
#### Output

    Numbers in first array but not second array:
    0
    9
    2
    4
    6

### linq53: Except - 2
```csharp
//c#
public void Linq53() 
{ 
    List<Product> products = GetProductList(); 
    List<Customer> customers = GetCustomerList(); 
  
    var productFirstChars = 
        from p in products 
        select p.ProductName[0]; 
    var customerFirstChars = 
        from c in customers 
        select c.CompanyName[0]; 
  
    var productOnlyFirstChars = productFirstChars.Except(customerFirstChars); 
  
    Console.WriteLine("First letters from Product names, but not from Customer names:"); 
    foreach (var ch in productOnlyFirstChars) 
    { 
        Console.WriteLine(ch); 
    } 
}
```
```dart
//dart
linq53(){
  var products = productsList(); 
  var customers = customersList(); 
  
  var productFirstChars = products 
    .map((p) => p.productName[0]); 
  var customerFirstChars = customers
    .map((c) => c.companyName[0]); 
  
  var productOnlyFirstChars = productFirstChars.toSet().difference(customerFirstChars.toSet()); 
  
  print("First letters from Product names, but not from Customer names:"); 
  productOnlyFirstChars.forEach(print);
}
```
#### Output

    First letters from Product names, but not from Customer names:
    Z
    J
    U


LINQ - Conversion Operators
---------------------------

### Dart utils added

```dart
toMap(List seq, f(x)){
  var map = {};
  seq.forEach((x) => map[f(x)] = x);
  return map;
}

ofType(List seq, type) =>
  seq.where((x) => reflect(x).type.qualifiedName == reflectClass(type).qualifiedName);
```

### linq54: ToArray
```csharp
//c#
public void Linq54() 
{ 
    double[] doubles = { 1.7, 2.3, 1.9, 4.1, 2.9 }; 
  
    var sortedDoubles = 
        from d in doubles 
        orderby d descending 
        select d; 
    var doublesArray = sortedDoubles.ToArray(); 
  
    Console.WriteLine("Every other double from highest to lowest:"); 
    for (int d = 0; d < doublesArray.Length; d += 2) 
    { 
        Console.WriteLine(doublesArray[d]); 
    } 
}
```
```dart
//dart
linq54(){
  var doubles = [ 1.7, 2.3, 1.9, 4.1, 2.9 ]; 
  
  var sortedDoubles = order(doubles).reversed;

  var doublesArray = sortedDoubles.toList(growable:false); 
  
  print("Every other double from highest to lowest:"); 
  for (int d = 0; d < doublesArray.length; d += 2){ 
    print(doublesArray[d]); 
  } 
}
```
#### Output

    Every other double from highest to lowest:
    4.1
    2.3
    1.7

### linq55: ToList
```csharp
//c#
public void Linq55() 
{ 
    string[] words = { "cherry", "apple", "blueberry" }; 
  
    var sortedWords = 
        from w in words 
        orderby w 
        select w; 
    var wordList = sortedWords.ToList(); 
  
    Console.WriteLine("The sorted word list:"); 
    foreach (var w in wordList) 
    { 
        Console.WriteLine(w); 
    } 
}
```
```dart
//dart
linq55(){
  var words = [ "cherry", "apple", "blueberry" ]; 
  
  var sortedWords = orderBy(words);
  
  var wordList = sortedWords.toList(); 
  
  print("The sorted word list:"); 
  wordList.forEach(print);
}
```
#### Output

    The sorted word list:
    apple
    blueberry
    cherry

### linq56: ToDictionary
```csharp
//c#
public void Linq56() 
{ 
    var scoreRecords = new[] { new {Name = "Alice", Score = 50}, 
                                new {Name = "Bob"  , Score = 40}, 
                                new {Name = "Cathy", Score = 45} 
                            }; 
  
    var scoreRecordsDict = scoreRecords.ToDictionary(sr => sr.Name); 
  
    Console.WriteLine("Bob's score: {0}", scoreRecordsDict["Bob"]); 
}
```
```dart
//dart
linq56(){
  var scoreRecords = [{ 'Name': "Alice", 'Score': 50}, 
                      { 'Name': "Bob"  , 'Score': 40}, 
                      { 'Name': "Cathy", 'Score': 45}];
  
  var scoreRecordsDict = toMap(scoreRecords, (sr) => sr['Name']); 
  
  print("Bob's score: ${scoreRecordsDict['Bob']}"); 
}
```
#### Output

    Bob's score: {Name: Bob, Score: 40}

### linq57: OfType    
```csharp
//c#
public void Linq57() 
{ 
    object[] numbers = { null, 1.0, "two", 3, "four", 5, "six", 7.0 }; 
  
    var doubles = numbers.OfType<double>(); 
  
    Console.WriteLine("Numbers stored as doubles:"); 
    foreach (var d in doubles) 
    { 
        Console.WriteLine(d); 
    } 
}
```
```dart
//dart
linq57(){
  var numbers = [ null, 1.0, "two", 3, "four", 5, "six", 7.0 ]; 
  
  var doubles = ofType(numbers, double); 
  
  print("Numbers stored as doubles:"); 
  doubles.forEach(print);
}
```
#### Output

    Numbers stored as doubles:
    1.0
    7.0


LINQ - Element Operators
------------------------

### linq58: First - Simple
```csharp
//c#
public void Linq58() 
{ 
    List<Product> products = GetProductList(); 
 
    Product product12 = ( 
        from p in products 
        where p.ProductID == 12 
        select p) 
        .First(); 
  
    ObjectDumper.Write(product12); 
}
```
```dart
//dart
linq58(){
  var products = productsList(); 
  
  var product12 = products 
    .where((p) => p.productId == 12)
    .first; 
  
  print(product12); 
}
```
#### Output

    {productId: 12, productName: Queso Manchego La Pastora, category: Dairy Products, unitPrice: 38.0, unitsInStock: 86}

### linq59: First - Condition
```csharp
//c#
public void Linq59() 
{ 
    string[] strings = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" }; 
  
    string startsWithO = strings.First(s => s[0] == 'o'); 
  
    Console.WriteLine("A string starting with 'o': {0}", startsWithO); 
}
```
```dart
//dart
linq59(){
  var strings = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]; 
  
  var startsWithO = strings.firstWhere((s) => s[0] == 'o'); 
  
  print("A string starting with 'o': $startsWithO"); 
}
```
#### Output

    A string starting with 'o': one

### linq61: FirstOrDefault - Simple
```csharp
//c#
public void Linq61() 
{ 
    int[] numbers = { }; 
  
    int firstNumOrDefault = numbers.FirstOrDefault(); 
  
    Console.WriteLine(firstNumOrDefault); 
}
```
```dart
//dart
linq61(){
  var numbers = []; 
  
  int firstNumOrDefault = numbers.firstWhere((x) => true, orElse:() => 0); 
  
  print(firstNumOrDefault); 
}
```
#### Output

    0

### linq62: FirstOrDefault - Condition
```csharp
//c#
public void Linq62() 
{ 
    List<Product> products = GetProductList(); 
  
    Product product789 = products.FirstOrDefault(p => p.ProductID == 789); 
 
    Console.WriteLine("Product 789 exists: {0}", product789 != null); 
}
```
```dart
//dart
linq62(){
  var products = productsList(); 
  
  var product789 = products.firstWhere((p) => p.productId == 789, orElse:() => null); 
  
  print("Product 789 exists: ${product789 != null}"); 
}
```
#### Output

    Product 789 exists: false

### linq64: ElementAt
```csharp
//c#
public void Linq64() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    int fourthLowNum = ( 
        from n in numbers 
        where n > 5 
        select n) 
        .ElementAt(1);  // second number is index 1 because sequences use 0-based indexing 
 
    Console.WriteLine("Second number > 5: {0}", fourthLowNum); 
}
```
```dart
//dart
linq64(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  int fourthLowNum = numbers 
    .where((n) => n > 5)
    .elementAt(1); 
  
  print("Second number > 5: $fourthLowNum"); 
}
```
#### Output

    Second number > 5: 8


LINQ - Generation Operators
---------------------------
### Dart utils added

```dart
List range(int from, [int to]) =>
  to != null 
    ? new List.generate(to, (x) => x + from)
    : new List.generate(from, (x) => x);
```

### linq65: Range
```csharp
//c#
public void Linq65() 
{ 
    var numbers = 
        from n in Enumerable.Range(100, 50) 
  
        select new { Number = n, OddEven = n % 2 == 1 ? "odd" : "even" }; 
  
    foreach (var n in numbers) 
    { 
        Console.WriteLine("The number {0} is {1}.", n.Number, n.OddEven); 
    } 
}
```
```dart
//dart
linq65(){
  var numbers = range(100, 50)
    .map((n) => { 'Number': n, 'OddEven': n % 2 == 1 ? "odd" : "even" }); 
      
  numbers.forEach((n) =>
    print("The number ${n['Number']} is ${n['OddEven']}.")); 
}
```
#### Output

    The number 100 is even.
    The number 101 is odd.
    The number 102 is even.
    The number 103 is odd.
    The number 104 is even.
    The number 105 is odd.
    The number 106 is even.
    The number 107 is odd.
    The number 108 is even.
    The number 109 is odd.
    The number 110 is even.
    ...

### linq66: Repeat
```csharp
//c#
public void Linq66() 
{ 
    var numbers = Enumerable.Repeat(7, 10); 
  
    foreach (var n in numbers) 
    {  
        Console.WriteLine(n); 
    } 
}
```
```dart
//dart
linq66(){
  var numbers = new List.filled(10, 7); 

  numbers.forEach(print);
}
```
#### Output

    7
    7
    7
    7
    7
    7
    7
    7
    7
    7


LINQ - Quantifiers
------------------

### linq67: Any - Simple
```csharp
//c#
public void Linq67() 
{ 
    string[] words = { "believe", "relief", "receipt", "field" }; 
  
    bool iAfterE = words.Any(w => w.Contains("ei")); 
 
    Console.WriteLine("There is a word that contains in the list that contains 'ei': {0}", iAfterE); 
}
```
```dart
//dart
linq67(){
  var words = [ "believe", "relief", "receipt", "field" ]; 
  
  bool iAfterE = words.any((w) => w.contains("ei")); 
  
  print("There is a word that contains in the list that contains 'ei': $iAfterE"); 
}
```
#### Output

    There is a word that contains in the list that contains 'ei': true

### linq69: Any - Grouped
```csharp
//c#
public void Linq69() 
{ 
    List<Product> products = GetProductList(); 
    var productGroups = 
        from p in products 
        group p by p.Category into g 
        where g.Any(p => p.UnitsInStock == 0) 
        select new { Category = g.Key, Products = g }; 
 
    ObjectDumper.Write(productGroups, 1);  
}
```
```dart
//dart
linq69(){
  var products = productsList(); 
  var productGroups = group(products, by:(p) => p.category)
    .where((g) => g.values.any((p) => p.unitsInStock == 0))
    .map((g) => { 'Category': g.key, 'Products': g });

   productGroups.forEach(print);
}
```
#### Output

    {Category: Condiments, Products: {{productId: 3, productName: Aniseed Syrup, category: Condiments, unitPrice: 10.0, unitsInStock: 13}, {productId: 4, productName: Chef Anton's Cajun Seasoning, category: Condiments, unitPrice: 22.0, unitsInStock: 53}, {productId: 5, productName: Chef Anton's Gumbo Mix, category: Condiments, unitPrice: 21.35, unitsInStock: 0}, {productId: 6, productName: Grandma's Boysenberry Spread, category: Condiments, unitPrice: 25.0, unitsInStock: 120}, {productId: 8, productName: Northwoods Cranberry Sauce, category: Condiments, unitPrice: 40.0, unitsInStock: 6}, {productId: 15, productName: Genen Shouyu, category: Condiments, unitPrice: 15.5, unitsInStock: 39}, {productId: 44, productName: Gula Malacca, category: Condiments, unitPrice: 19.45, unitsInStock: 27}, {productId: 61, productName: Sirop d'�rable, category: Condiments, unitPrice: 28.5, unitsInStock: 113}, {productId: 63, productName: Vegie-spread, category: Condiments, unitPrice: 43.9, unitsInStock: 24}, {productId: 65, productName: Louisiana Fiery Hot Pepper Sauce, category: Condiments, unitPrice: 21.05, unitsInStock: 76}, {productId: 66, productName: Louisiana Hot Spiced Okra, category: Condiments, unitPrice: 17.0, unitsInStock: 4}, {productId: 77, productName: Original Frankfurter gr�ne So�e, category: Condiments, unitPrice: 13.0, unitsInStock: 32}}}
    ...

### linq70: All - Simple
```csharp
//c#
public void Linq70() 
{  
    int[] numbers = { 1, 11, 3, 19, 41, 65, 19 }; 
  
    bool onlyOdd = numbers.All(n => n % 2 == 1); 
  
    Console.WriteLine("The list contains only odd numbers: {0}", onlyOdd); 
}
```
```dart
//dart
linq70(){
  var numbers = [ 1, 11, 3, 19, 41, 65, 19 ]; 
  
  bool onlyOdd = numbers.every((n) => n % 2 == 1); 
  
  print("The list contains only odd numbers: $onlyOdd"); 
}
```
#### Output

    The list contains only odd numbers: true

### linq72: All - Grouped    
```csharp
//c#
public void Linq72() 
{ 
    List<Product> products = GetProductList(); 
  
    var productGroups = 
        from p in products 
        group p by p.Category into g 
        where g.All(p => p.UnitsInStock > 0) 
        select new { Category = g.Key, Products = g }; 
     
    ObjectDumper.Write(productGroups, 1); 
}
```
```dart
//dart
linq72(){
  var products = productsList(); 
  
  var productGroups = group(products, by:(p) => p.category)
    .where((g) => g.values.every((p) => p.unitsInStock > 0))
    .map((g) => { 'Category': g.key, 'Products': g });
      
  productGroups.forEach(print);
}
```
#### Output

    {Category: Grains/Cereals, Products: {{productId: 22, productName: Gustaf's Kn�ckebr�d, category: Grains/Cereals, unitPrice: 21.0, unitsInStock: 104}, {productId: 23, productName: Tunnbr�d, category: Grains/Cereals, unitPrice: 9.0, unitsInStock: 61}, {productId: 42, productName: Singaporean Hokkien Fried Mee, category: Grains/Cereals, unitPrice: 14.0, unitsInStock: 26}, {productId: 52, productName: Filo Mix, category: Grains/Cereals, unitPrice: 7.0, unitsInStock: 38}, {productId: 56, productName: Gnocchi di nonna Alice, category: Grains/Cereals, unitPrice: 38.0, unitsInStock: 21}, {productId: 57, productName: Ravioli Angelo, category: Grains/Cereals, unitPrice: 19.5, unitsInStock: 36}, {productId: 64, productName: Wimmers gute Semmelkn�del, category: Grains/Cereals, unitPrice: 33.25, unitsInStock: 22}}}
    ...


LINQ - Aggregate Operators
--------------------------

### Dart utils added

```dart
sum(Iterable seq, [fn(x)]) =>
  seq.fold(0, (prev, element) => prev + (fn != null ? fn(element) : element));

min(Iterable seq) =>
  seq.fold(double.MAX_FINITE, (prev, element) => prev.compareTo(element) > 0 ? element : prev);

max(Iterable seq) =>
  seq.fold(double.MIN_POSITIVE, (prev, element) => prev.compareTo(element) > 0 ? prev : element);

avg(Iterable seq) => sum(seq) / seq.length;
```

### linq73: Count - Simple
```csharp
//c#
public void Linq73() 
{ 
    int[] factorsOf300 = { 2, 2, 3, 5, 5 }; 
  
    int uniqueFactors = factorsOf300.Distinct().Count(); 
  
    Console.WriteLine("There are {0} unique factors of 300.", uniqueFactors); 
}
```
```dart
//dart
linq73(){
  var factorsOf300 = [ 2, 2, 3, 5, 5 ]; 
  
  int uniqueFactors = factorsOf300.toSet().length; 
  
  print("There are $uniqueFactors unique factors of 300."); 
}
```
#### Output

    There are 3 unique factors of 300.

### linq74: Count - Conditional
```csharp
//c#
public void Linq74() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    int oddNumbers = numbers.Count(n => n % 2 == 1); 
  
    Console.WriteLine("There are {0} odd numbers in the list.", oddNumbers); 
}
```
```dart
//dart
linq74(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  int oddNumbers = numbers.where((n) => n % 2 == 1).length; 
  
  print("There are $oddNumbers odd numbers in the list."); 
}
```
#### Output

    There are 5 odd numbers in the list.

### linq76: Count - Nested
```csharp
//c#
public void Linq76() 
{ 
    List<Customer> customers = GetCustomerList(); 
  
    var orderCounts = 
        from c in customers 
        select new { c.CustomerID, OrderCount = c.Orders.Count() }; 
  
    ObjectDumper.Write(orderCounts); 
}
```
```dart
//dart
linq76(){
  var customers = customersList(); 
  
  var orderCounts = customers
    .map((c) => { 'CustomerId': c.customerId, 'OrderCount': c.orders.length }); 

  orderCounts.forEach(print);
}
```
#### Output

    {CustomerId: ALFKI, OrderCount: 6}
    {CustomerId: ANATR, OrderCount: 4}
    {CustomerId: ANTON, OrderCount: 7}
    {CustomerId: AROUT, OrderCount: 13}
    {CustomerId: BERGS, OrderCount: 18}
    {CustomerId: BLAUS, OrderCount: 7}
    {CustomerId: BLONP, OrderCount: 11}
    ...

### linq77: Count - Grouped
```csharp
//c#
public void Linq77() 
{ 
    List<Product> products = GetProductList(); 
  
    var categoryCounts = 
        from p in products 
        group p by p.Category into g 
        select new { Category = g.Key, ProductCount = g.Count() }; 
  
    ObjectDumper.Write(categoryCounts 
}
```
```dart
//dart
linq77(){
  var products = productsList(); 
  
  var categoryCounts = group(products, by:(p) => p.category)
    .map((g) => { 'Category': g.key, 'ProductCount': g.length });      

  categoryCounts.forEach(print);
}
```
#### Output

    {Category: Dairy Products, ProductCount: 10}
    {Category: Grains/Cereals, ProductCount: 7}
    {Category: Confections, ProductCount: 13}
    {Category: Seafood, ProductCount: 12}
    {Category: Condiments, ProductCount: 12}
    {Category: Meat/Poultry, ProductCount: 6}
    {Category: Produce, ProductCount: 5}
    {Category: Beverages, ProductCount: 12}

### linq78: Sum - Simple
```csharp
//c#
public void Linq78() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    double numSum = numbers.Sum(); 
  
    Console.WriteLine("The sum of the numbers is {0}.", numSum); 
}
```
```dart
//dart
linq78(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  var numSum = sum(numbers); 
  
  print("The sum of the numbers is $numSum."); 
}
```
#### Output

    The sum of the numbers is 45.

### linq79: Sum - Projection
```csharp
//c#
public void Linq79() 
{ 
    string[] words = { "cherry", "apple", "blueberry" }; 
  
    double totalChars = words.Sum(w => w.Length); 
  
    Console.WriteLine("There are a total of {0} characters in these words.", totalChars); 
}
```
```dart
//dart
linq79(){
  var words = [ "cherry", "apple", "blueberry" ]; 
  
  var totalChars = sum(words, (w) => w.length); 
  
  print("There are a total of $totalChars characters in these words.");
}
```
#### Output

    There are a total of 20 characters in these words.

### linq80: Sum - Grouped
```csharp
//c#
public void Linq80() 
{ 
    List<Product> products = GetProductList(); 
  
    var categories = 
        from p in products 
        group p by p.Category into g 
        select new { Category = g.Key, TotalUnitsInStock = g.Sum(p => p.UnitsInStock) }; 
  
    ObjectDumper.Write(categories); 
}
```
```dart
//dart
linq80(){
  var products = productsList(); 
  
  var categories = group(products, by:(p) => p.category)
    .map((g) => { 'Category': g.key, 'TotalUnitsInStock': sum(g.values, (p) => p.unitsInStock) }); 
      
  categories.forEach(print);
}
```
#### Output

    {Category: Dairy Products, TotalUnitsInStock: 393}
    {Category: Grains/Cereals, TotalUnitsInStock: 308}
    {Category: Confections, TotalUnitsInStock: 386}
    {Category: Seafood, TotalUnitsInStock: 701}
    {Category: Condiments, TotalUnitsInStock: 507}
    {Category: Meat/Poultry, TotalUnitsInStock: 165}
    {Category: Produce, TotalUnitsInStock: 100}
    {Category: Beverages, TotalUnitsInStock: 559}

### linq81: Min - Simple
```csharp
//c#
public void Linq81() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    int minNum = numbers.Min(); 
  
    Console.WriteLine("The minimum number is {0}.", minNum); 
}
```
```dart
//dart
linq81(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  int minNum = min(numbers); 
  
  print("The minimum number is $minNum.");
}
```
#### Output

    The minimum number is 0.

### linq82: Min - Projection
```csharp
//c#
public void Linq82() 
{ 
    string[] words = { "cherry", "apple", "blueberry" }; 
  
    int shortestWord = words.Min(w => w.Length); 
  
    Console.WriteLine("The shortest word is {0} characters long.", shortestWord); 
}
```
```dart
//dart
linq82(){
  var words = [ "cherry", "apple", "blueberry" ]; 
  
  var shortestWord = min(words.map((x) => x.length));
  
  print("The shortest word is $shortestWord characters long."); 
}
```
#### Output

    The shortest word is 5 characters long.

### linq83: Min - Grouped
```csharp
//c#
public void Linq83() 
{ 
    List<Product> products = GetProductList(); 
  
    var categories = 
        from p in products 
        group p by p.Category into g 
        select new { Category = g.Key, CheapestPrice = g.Min(p => p.UnitPrice) }; 
  
    ObjectDumper.Write(categories); 
}
```
```dart
//dart
linq83(){
  var products = productsList(); 
  
  var categories = group(products, by:(p) => p.category)
    .map((g) => { 'Category': g.key, 'CheapestPrice': min(g.values.map((p) => p.unitPrice)) });

  categories.forEach(print);
}
```
#### Output

    {Category: Dairy Products, CheapestPrice: 2.5}
    {Category: Grains/Cereals, CheapestPrice: 7.0}
    {Category: Confections, CheapestPrice: 9.2}
    {Category: Seafood, CheapestPrice: 6.0}
    {Category: Condiments, CheapestPrice: 10.0}
    {Category: Meat/Poultry, CheapestPrice: 7.45}
    {Category: Produce, CheapestPrice: 10.0}
    {Category: Beverages, CheapestPrice: 4.5}

### linq84: Min - Elements
```csharp
//c#
public void Linq84() 
{ 
    List<Product> products = GetProductList(); 
  
    var categories = 
        from p in products 
        group p by p.Category into g 
        let minPrice = g.Min(p => p.UnitPrice) 
        select new { Category = g.Key, CheapestProducts = g.Where(p => p.UnitPrice == minPrice) }; 
  
    ObjectDumper.Write(categories, 1); 
}
```
```dart
//dart
linq84(){
  var products = productsList(); 
  
  var categories = group(products, by:(p) => p.category)
    .map((g){
      var minPrice = min(g.values.map((p) => p.unitPrice));
      return { 'Category': g.key, 'CheapestProducts': g.values.where((p) => p.unitPrice == minPrice) };
    });

  categories.forEach(print);
}
```
#### Output

    {Category: Dairy Products, CheapestProducts: {{productId: 33, productName: Geitost, category: Dairy Products, unitPrice: 2.5, unitsInStock: 112}}}
    {Category: Grains/Cereals, CheapestProducts: {{productId: 52, productName: Filo Mix, category: Grains/Cereals, unitPrice: 7.0, unitsInStock: 38}}}
    {Category: Confections, CheapestProducts: {{productId: 19, productName: Teatime Chocolate Biscuits, category: Confections, unitPrice: 9.2, unitsInStock: 25}}}
    {Category: Seafood, CheapestProducts: {{productId: 13, productName: Konbu, category: Seafood, unitPrice: 6.0, unitsInStock: 24}}}
    {Category: Condiments, CheapestProducts: {{productId: 3, productName: Aniseed Syrup, category: Condiments, unitPrice: 10.0, unitsInStock: 13}}}
    {Category: Meat/Poultry, CheapestProducts: {{productId: 54, productName: Tourti�re, category: Meat/Poultry, unitPrice: 7.45, unitsInStock: 21}}}
    {Category: Produce, CheapestProducts: {{productId: 74, productName: Longlife Tofu, category: Produce, unitPrice: 10.0, unitsInStock: 4}}}
    {Category: Beverages, CheapestProducts: {{productId: 24, productName: Guaran� Fant�stica, category: Beverages, unitPrice: 4.5, unitsInStock: 20}}}

### linq85: Max - Simple
```csharp
//c#
public void Linq85() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    int maxNum = numbers.Max(); 
  
    Console.WriteLine("The maximum number is {0}.", maxNum); 
}
```
```dart
//dart
linq85(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  var maxNum = max(numbers); 
  
  print("The maximum number is $maxNum."); 
}
```
#### Output

    The maximum number is 9.

### linq86: Max - Projection
```csharp
//c#
public void Linq86() 
{ 
    string[] words = { "cherry", "apple", "blueberry" }; 
  
    int longestLength = words.Max(w => w.Length); 
  
    Console.WriteLine("The longest word is {0} characters long.", longestLength); 
}
```
```dart
//dart
linq86(){
  var words = [ "cherry", "apple", "blueberry" ]; 
  
  int longestLength = max(words.map((w) => w.length)); 
  
  print("The longest word is $longestLength characters long."); 
}
```
#### Output

    The longest word is 9 characters long.

### linq87: Max - Grouped
```csharp
//c#
public void Linq87() 
{ 
    List<Product> products = GetProductList(); 
  
    var categories = 
        from p in products 
        group p by p.Category into g 
        select new { Category = g.Key, MostExpensivePrice = g.Max(p => p.UnitPrice) }; 
  
    ObjectDumper.Write(categories); 
}
```
```dart
//dart
linq87(){
  var products = productsList(); 
  
  var categories = group(products, by:(p) => p.category)
    .map((g) => { 'Category': g.key, 'MostExpensivePrice': max(g.values.map((p) => p.unitPrice)) });      

  categories.forEach(print);
}
```
#### Output

    {Category: Dairy Products, MostExpensivePrice: 55.0}
    {Category: Grains/Cereals, MostExpensivePrice: 38.0}
    {Category: Confections, MostExpensivePrice: 81.0}
    {Category: Seafood, MostExpensivePrice: 62.5}
    {Category: Condiments, MostExpensivePrice: 43.9}
    {Category: Meat/Poultry, MostExpensivePrice: 123.79}
    {Category: Produce, MostExpensivePrice: 53.0}
    {Category: Beverages, MostExpensivePrice: 263.5}

### linq88: Max - Elements
```csharp
//c#
public void Linq88() 
{ 
    List<Product> products = GetProductList(); 
  
    var categories = 
        from p in products 
        group p by p.Category into g 
        let maxPrice = g.Max(p => p.UnitPrice) 
        select new { Category = g.Key, MostExpensiveProducts = g.Where(p => p.UnitPrice == maxPrice) }; 
  
    ObjectDumper.Write(categories, 1); 
}
```
```dart
//dart
linq88(){
  var products = productsList(); 
  
  var categories = group(products, by:(p) => p.category)
    .map((g){
      var maxPrice = max(g.values.map((p) => p.unitPrice));
      return { 'Category': g.key, 'MostExpensiveProducts': g.values.where((p) => p.unitPrice == maxPrice) };
    });

  categories.forEach(print);
}
```
#### Output

    {Category: Dairy Products, MostExpensiveProducts: {{productId: 59, productName: Raclette Courdavault, category: Dairy Products, unitPrice: 55.0, unitsInStock: 79}}}
    {Category: Grains/Cereals, MostExpensiveProducts: {{productId: 56, productName: Gnocchi di nonna Alice, category: Grains/Cereals, unitPrice: 38.0, unitsInStock: 21}}}
    {Category: Confections, MostExpensiveProducts: {{productId: 20, productName: Sir Rodney's Marmalade, category: Confections, unitPrice: 81.0, unitsInStock: 40}}}
    {Category: Seafood, MostExpensiveProducts: {{productId: 18, productName: Carnarvon Tigers, category: Seafood, unitPrice: 62.5, unitsInStock: 42}}}
    {Category: Condiments, MostExpensiveProducts: {{productId: 63, productName: Vegie-spread, category: Condiments, unitPrice: 43.9, unitsInStock: 24}}}
    {Category: Meat/Poultry, MostExpensiveProducts: {{productId: 29, productName: Th�ringer Rostbratwurst, category: Meat/Poultry, unitPrice: 123.79, unitsInStock: 0}}}
    {Category: Produce, MostExpensiveProducts: {{productId: 51, productName: Manjimup Dried Apples, category: Produce, unitPrice: 53.0, unitsInStock: 20}}}
    {Category: Beverages, MostExpensiveProducts: {{productId: 38, productName: C�te de Blaye, category: Beverages, unitPrice: 263.5, unitsInStock: 17}}}

### linq89: Average - Simple
```csharp
//c#
public void Linq89() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    double averageNum = numbers.Average(); 
  
    Console.WriteLine("The average number is {0}.", averageNum); 
}
```
```dart
//dart
linq89(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  var averageNum = avg(numbers); 
  
  print("The average number is $averageNum.");
}
```
#### Output

    The average number is 4.5.

### linq90: Average - Projection
```csharp
//c#
public void Linq90() 
{ 
    string[] words = { "cherry", "apple", "blueberry" }; 
  
    double averageLength = words.Average(w => w.Length); 
  
    Console.WriteLine("The average word length is {0} characters.", averageLength); 
}
```
```dart
//dart
linq90(){
  var words = [ "cherry", "apple", "blueberry" ]; 
  
  var averageLength = avg(words.map((w) => w.length)); 
  
  print("The average word length is $averageLength characters."); 
}
```
#### Output

    The average word length is 6.666666666666667 characters.

### linq91: Average - Grouped
```csharp
//c#
public void Linq91() 
{ 
    List<Product> products = GetProductList(); 
  
    var categories = 
        from p in products 
        group p by p.Category into g 
        select new { Category = g.Key, AveragePrice = g.Average(p => p.UnitPrice) }; 
  
    ObjectDumper.Write(categories); 
}
```
```dart
//dart
linq91(){
  var products = productsList(); 
  
  var categories = group(products, by:(p) => p.category)
    .map((g) => { 'Category': g.key, 'AveragePrice': avg(g.values.map((p) => p.unitPrice)) });

  categories.forEach(print);
}
```
#### Output

    {Category: Dairy Products, AveragePrice: 28.73}
    {Category: Grains/Cereals, AveragePrice: 20.25}
    {Category: Confections, AveragePrice: 25.16}
    {Category: Seafood, AveragePrice: 20.6825}
    {Category: Condiments, AveragePrice: 23.0625}
    {Category: Meat/Poultry, AveragePrice: 54.00666666666667}
    {Category: Produce, AveragePrice: 32.37}
    {Category: Beverages, AveragePrice: 37.979166666666664}

### linq92: Aggregate - Simple
```csharp
//c#
public void Linq92() 
{ 
    double[] doubles = { 1.7, 2.3, 1.9, 4.1, 2.9 }; 
  
    double product = doubles.Aggregate((runningProduct, nextFactor) => runningProduct * nextFactor); 
  
    Console.WriteLine("Total product of all numbers: {0}", product); 
}
```
```dart
//dart
linq92(){
  var doubles = [ 1.7, 2.3, 1.9, 4.1, 2.9 ]; 
  
  var product = doubles.reduce((runningProduct, nextFactor) => runningProduct * nextFactor); 
  
  print("Total product of all numbers: $product");
}
```
#### Output

    Total product of all numbers: 88.33080999999999

### linq93: Aggregate - Seed
```csharp
//c#
public void Linq93() 
{ 
    double startBalance = 100.0; 
  
    int[] attemptedWithdrawals = { 20, 10, 40, 50, 10, 70, 30 }; 
  
    double endBalance = 
        attemptedWithdrawals.Aggregate(startBalance, 
            (balance, nextWithdrawal) => 
                ((nextWithdrawal <= balance) ? (balance - nextWithdrawal) : balance)); 
  
    Console.WriteLine("Ending balance: {0}", endBalance); 
}
```
```dart
//dart
linq93(){
  var startBalance = 100.0; 
  
  var attemptedWithdrawals = [ 20, 10, 40, 50, 10, 70, 30 ]; 
  
  var endBalance = attemptedWithdrawals.fold(startBalance, 
    (balance, nextWithdrawal) => 
      ((nextWithdrawal <= balance) ? (balance - nextWithdrawal) : balance)); 
  
  print("Ending balance: $endBalance"); 
}
```
#### Output

    Ending balance: 20.0


LINQ - Miscellaneous Operators
------------------------------

### Dart utils added

```dart
concat(Iterable seq, Iterable withSeq) =>
  seq.toList()..addAll(withSeq);

bool seqEq(Iterable seq, Iterable withSeq) =>    
  seq.length == withSeq.length 
  && range(seq.length).every((i) => seq.elementAt(i) == withSeq.elementAt(i));
```

### linq94: Concat - 1
```csharp
//c#
public void Linq94() 
{ 
    int[] numbersA = { 0, 2, 4, 5, 6, 8, 9 }; 
    int[] numbersB = { 1, 3, 5, 7, 8 }; 
  
    var allNumbers = numbersA.Concat(numbersB); 
  
    Console.WriteLine("All numbers from both arrays:"); 
    foreach (var n in allNumbers) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```dart
//dart
linq94(){
  var numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]; 
  var numbersB = [ 1, 3, 5, 7, 8 ]; 
  
  var allNumbers = concat(numbersA, numbersB); 
  
  print("All numbers from both arrays:");
  allNumbers.forEach(print);
}
```
#### Output

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

### linq95: Concat - 2
```csharp
//c#
public void Linq95() 
{ 
    List<Customer> customers = GetCustomerList(); 
    List<Product> products = GetProductList(); 
  
    var customerNames = 
        from c in customers 
        select c.CompanyName; 
    var productNames = 
        from p in products 
        select p.ProductName; 
  
    var allNames = customerNames.Concat(productNames); 
  
    Console.WriteLine("Customer and product names:"); 
    foreach (var n in allNames) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```dart
//dart
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
```
#### Output

    Customer and product names:
    Alfreds Futterkiste
    Ana Trujillo Emparedados y helados
    Antonio Moreno Taquer�a
    Around the Horn
    Berglunds snabbk�p
    Blauer See Delikatessen
    ...

### linq96: EqualAll - 1
```csharp
//c#
public void Linq96() 
{ 
    var wordsA = new string[] { "cherry", "apple", "blueberry" }; 
    var wordsB = new string[] { "cherry", "apple", "blueberry" }; 
  
    bool match = wordsA.SequenceEqual(wordsB); 
  
    Console.WriteLine("The sequences match: {0}", match); 
}
```
```dart
//dart
linq96(){
  var wordsA = [ "cherry", "apple", "blueberry" ]; 
  var wordsB = [ "cherry", "apple", "blueberry" ]; 
  
  bool match = seqEq(wordsA, wordsB); 
  
  print("The sequences match: $match");
}
```
#### Output

    The sequences match: true

### linq97: EqualAll - 2
```csharp
//c#
public void Linq97() 
{ 
    var wordsA = new string[] { "cherry", "apple", "blueberry" }; 
    var wordsB = new string[] { "apple", "blueberry", "cherry" }; 
  
    bool match = wordsA.SequenceEqual(wordsB); 
  
    Console.WriteLine("The sequences match: {0}", match); 
}
```
```dart
//dart
linq97(){
  var wordsA = [ "cherry", "apple", "blueberry" ]; 
  var wordsB = [ "apple", "blueberry", "cherry" ]; 
  
  bool match = seqEq(wordsA, wordsB); 
  
  print("The sequences match: $match");
}
```
#### Output

    The sequences match: false

LINQ - Query Execution
----------------------

### linq99: Deferred Execution
```csharp
//c#
public void Linq99() 
{ 
    // Sequence operators form first-class queries that 
    // are not executed until you enumerate over them. 
  
    int[] numbers = new int[] { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    int i = 0; 
    var q = 
        from n in numbers 
        select ++i; 
  
    // Note, the local variable 'i' is not incremented 
    // until each element is evaluated (as a side-effect): 
    foreach (var v in q) 
    { 
        Console.WriteLine("v = {0}, i = {1}", v, i); 
    } 
}
```
```dart
//dart
linq99(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  var i = 0; 
  var q = numbers.map((n) => ++i);
  
  q.forEach((v) => 
    print("v = $v, i = $i"));
}
```
#### Output

    v = 1, i = 1
    v = 2, i = 2
    v = 3, i = 3
    v = 4, i = 4
    v = 5, i = 5
    v = 6, i = 6
    v = 7, i = 7
    v = 8, i = 8
    v = 9, i = 9
    v = 10, i = 10

### linq100: Immediate Execution
```csharp
//c#
public void Linq100() 
{ 
    // Methods like ToList() cause the query to be 
    // executed immediately, caching the results. 
  
    int[] numbers = new int[] { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    int i = 0; 
    var q = ( 
        from n in numbers 
        select ++i) 
        .ToList(); 
  
    // The local variable i has already been fully 
    // incremented before we iterate the results: 
    foreach (var v in q) 
    { 
        Console.WriteLine("v = {0}, i = {1}", v, i); 
    } 
} 
```
```dart
//dart
linq100(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  var i = 0; 
  var q = numbers.map((n) => ++i).toList();
  
  q.forEach((v) => 
    print("v = $v, i = $i"));
}
```
#### Output

    v = 1, i = 10
    v = 2, i = 10
    v = 3, i = 10
    v = 4, i = 10
    v = 5, i = 10
    v = 6, i = 10
    v = 7, i = 10
    v = 8, i = 10
    v = 9, i = 10
    v = 10, i = 10

### linq101: Query Reuse
```csharp
//c#
public void Linq101() 
{ 
    // Deferred execution lets us define a query once 
    // and then reuse it later after data changes. 
  
    int[] numbers = new int[] { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
    var lowNumbers = 
        from n in numbers 
        where n <= 3 
        select n; 
  
    Console.WriteLine("First run numbers <= 3:"); 
    foreach (int n in lowNumbers) 
    { 
        Console.WriteLine(n); 
    } 
  
    for (int i = 0; i < 10; i++) 
    { 
        numbers[i] = -numbers[i]; 
    } 
  
    // During this second run, the same query object, 
    // lowNumbers, will be iterating over the new state 
    // of numbers[], producing different results: 
    Console.WriteLine("Second run numbers <= 3:"); 
    foreach (int n in lowNumbers) 
    { 
        Console.WriteLine(n); 
    } 
} 
```
```dart
//dart
linq101(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  var lowNumbers = numbers
    .where((n) => n <= 3); 
  
  print("First run numbers <= 3:");
  lowNumbers.forEach(print);
  
  for (int i = 0; i < 10; i++){ 
    numbers[i] = -numbers[i]; 
  } 
  
  print("Second run numbers <= 3:"); 
  lowNumbers.forEach(print);
}
```
#### Output

    First run numbers <= 3:
    1
    3
    2
    0
    Second run numbers <= 3:
    -5
    -4
    -1
    -3
    -9
    -8
    -6
    -7
    -2
    0


LINQ - Join Operators
---------------------

### Dart utils added

```dart
join(Iterable seq, Iterable withSeq, bool match(x,y)) =>
  seq.expand((x) => withSeq
    .where((y) => match(x,y))
    .map((y) => [x,y]));

joinGroup(Iterable seq, Iterable withSeq, bool match(x,y)) =>
  group(join(seq, withSeq, match), by:(j) => j[0]);  
```

### linq102: Cross Join
```csharp
//c#
public void Linq102() 
{ 
    string[] categories = new string[]{  
        "Beverages",   
        "Condiments",   
        "Vegetables",   
        "Dairy Products",   
        "Seafood" };  
  
    List<Product> products = GetProductList(); 
  
    var q = 
        from c in categories 
        join p in products on c equals p.Category 
        select new { Category = c, p.ProductName }; 
 
    foreach (var v in q) 
    { 
        Console.WriteLine(v.ProductName + ": " + v.Category);  
    } 
}
```
```dart
//dart
linq102(){
  var categories = [ "Beverages", "Condiments", "Vegetables", "Dairy Products", "Seafood" ];  
  
  var products = productsList(); 
  
  var q = join(categories, products, (c,p) => c == p.category)
    .map((j) => { 'Category': j[0], 'ProductName': j[1].productName });

  q.forEach(print);
}
```
#### Output

    {Category: Beverages, ProductName: Chai}
    {Category: Beverages, ProductName: Chang}
    {Category: Beverages, ProductName: Guaran� Fant�stica}
    {Category: Beverages, ProductName: Sasquatch Ale}
    {Category: Beverages, ProductName: Steeleye Stout}
    {Category: Beverages, ProductName: C�te de Blaye}
    {Category: Beverages, ProductName: Chartreuse verte}
    {Category: Beverages, ProductName: Ipoh Coffee}
    ...

### linq103: Group Join
```csharp
//c#
public void Linq103() 
{ 
    string[] categories = new string[]{  
        "Beverages",  
        "Condiments",  
        "Vegetables",  
        "Dairy Products",  
        "Seafood" }; 
  
    List<Product> products = GetProductList(); 
  
    var q = 
        from c in categories 
        join p in products on c equals p.Category into ps 
        select new { Category = c, Products = ps }; 
  
    foreach (var v in q) 
    { 
        Console.WriteLine(v.Category + ":"); 
        foreach (var p in v.Products) 
        { 
            Console.WriteLine("   " + p.ProductName); 
        } 
    } 
}
```
```dart
//dart
linq103(){
  var categories = [ "Beverages", "Condiments", "Vegetables", "Dairy Products", "Seafood" ];  
  
  var products = productsList(); 
  
  var q = joinGroup(categories, products, (c,p) => c == p.category)
    .map((j) => { 'Category': j.key, 'Products': j.values.map((g) => g[1]) });

  q.forEach((v){
    print("${v['Category']}:");
    v['Products'].forEach((p) => print("   ${p.productName}"));
  });
}
```
#### Output

    Dairy Products:
       Queso Cabrales
       Queso Manchego La Pastora
       Gorgonzola Telino
       Mascarpone Fabioli
       Geitost
       Raclette Courdavault
       Camembert Pierrot
       Gudbrandsdalsost
       Flotemysost
       Mozzarella di Giovanni
    Condiments:
       Aniseed Syrup
       Chef Anton's Cajun Seasoning
       Chef Anton's Gumbo Mix
       Grandma's Boysenberry Spread
       Northwoods Cranberry Sauce
       Genen Shouyu
       Gula Malacca
       Sirop d'�rable
       Vegie-spread
       Louisiana Fiery Hot Pepper Sauce
       Louisiana Hot Spiced Okra
       Original Frankfurter gr�ne So�e
    ...

### linq104: Cross Join with Group Join
```csharp
//c#
public void Linq104() 
{ 
    string[] categories = new string[]{   
        "Beverages",  
        "Condiments",  
        "Vegetables", 
        "Dairy Products",   
        "Seafood" }; 
  
    List<Product> products = GetProductList(); 
  
    var q = 
        from c in categories 
        join p in products on c equals p.Category into ps 
        from p in ps 
        select new { Category = c, p.ProductName }; 
  
    foreach (var v in q) 
    { 
        Console.WriteLine(v.ProductName + ": " + v.Category); 
    } 
}
```
```dart
//dart
linq104(){
  var categories = [ "Beverages", "Condiments", "Vegetables", "Dairy Products", "Seafood" ];  
  
  var products = productsList(); 
  
  var q = joinGroup(categories, products, (c,p) => c == p.category)
    .expand((j) => j.values.map((g) => g[1])
      .map((p) => { 'Category': j.key, 'ProductName': p.productName }));

  q.forEach((v) => 
    print("${v['ProductName']}: ${v['Category']}"));
}
```
#### Output

    Queso Cabrales: Dairy Products
    Queso Manchego La Pastora: Dairy Products
    Gorgonzola Telino: Dairy Products
    Mascarpone Fabioli: Dairy Products
    Geitost: Dairy Products
    Raclette Courdavault: Dairy Products
    Camembert Pierrot: Dairy Products
    Gudbrandsdalsost: Dairy Products
    Flotemysost: Dairy Products
    Mozzarella di Giovanni: Dairy Products
    Aniseed Syrup: Condiments
    Chef Anton's Cajun Seasoning: Condiments
    Chef Anton's Gumbo Mix: Condiments
    ...

### linq105: Left Outer Join
```csharp
//c#
public void Linq105()  
{ 
    string[] categories = new string[]{   
        "Beverages",  
        "Condiments",   
        "Vegetables",   
        "Dairy Products",  
        "Seafood" }; 
  
    List<Product> products = GetProductList(); 
  
    var q = 
        from c in categories 
        join p in products on c equals p.Category into ps 
        from p in ps.DefaultIfEmpty() 
        select new { Category = c, ProductName = p == null ? "(No products)" : p.ProductName }; 
  
    foreach (var v in q) 
    { 
        Console.WriteLine(v.ProductName + ": " + v.Category); 
    } 
}
```
```dart
//dart
linq105(){
  var categories = [ "Beverages", "Condiments", "Vegetables", "Dairy Products", "Seafood" ];  
  
  var products = productsList(); 
  
  var q = categories
    .expand((c){
      var catProducts = products.where((p) => c == p.category);
      return catProducts.isEmpty 
        ? [{ 'Category': c, 'ProductName': "(No products)" }]
        : catProducts.map((p) => { 'Category': c, 'ProductName': p.productName });
    });

  q.forEach((v) => 
    print("${v['ProductName']}: ${v['Category']}"));
}
```
#### Output

    Chai: Beverages
    Chang: Beverages
    Guaran� Fant�stica: Beverages
    Sasquatch Ale: Beverages
    Steeleye Stout: Beverages
    C�te de Blaye: Beverages
    Chartreuse verte: Beverages
    Ipoh Coffee: Beverages
    Laughing Lumberjack Lager: Beverages
    Outback Lager: Beverages
    Rh�nbr�u Klosterbier: Beverages
    Lakkalik��ri: Beverages
    Aniseed Syrup: Condiments
    Chef Anton's Cajun Seasoning: Condiments
    Chef Anton's Gumbo Mix: Condiments
    Grandma's Boysenberry Spread: Condiments
    Northwoods Cranberry Sauce: Condiments
    Genen Shouyu: Condiments
    Gula Malacca: Condiments
    Sirop d'�rable: Condiments
    Vegie-spread: Condiments
    Louisiana Fiery Hot Pepper Sauce: Condiments
    Louisiana Hot Spiced Okra: Condiments
    Original Frankfurter gr�ne So�e: Condiments
    (No products): Vegetables
    ...


### Contributors

  - [mythz](https://github.com/mythz) (Demis Bellot)

