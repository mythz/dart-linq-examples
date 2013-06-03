part of linq_samples;

doSetOperations() =>
  runSamples("LINQ - Set Operators", 
    {'linq46': 'Distinct - 1', 
     'linq47': 'Distinct - 2',
     'linq48': 'Union - 1',
     'linq49': 'Union - 2',
     'linq50': 'Intersect - 1',
     'linq51': 'Intersect - 2',
     'linq52': 'Except - 1',
     'linq53': 'Except - 2'});

linq46(){
  var factorsOf300 = [ 2, 2, 3, 5, 5 ]; 
  
  var uniqueFactors = factorsOf300.toSet(); 

  print("Prime factors of 300:");
  uniqueFactors.forEach(print);
}
/*
Prime factors of 300:
2
3
5
*/

linq47(){
  var products = productsList(); 
  
  var categoryNames = products 
    .map((p) => p.category)
    .toSet(); 
  
  print("Category names:"); 
  categoryNames.forEach(print);
}
/*
Category names:
Dairy Products
Grains/Cereals
Confections
Seafood
Condiments
Meat/Poultry
Produce
Beverages
*/

linq48(){
  var numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]; 
  var numbersB = [ 1, 3, 5, 7, 8 ]; 
  
  var uniqueNumbers = numbersA.toSet().union(numbersB.toSet()); 
  
  print("Unique numbers from both arrays:"); 
  uniqueNumbers.forEach(print);
}
/*
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
*/

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
/*
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
*/

linq50(){
  var numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]; 
  var numbersB = [ 1, 3, 5, 7, 8 ]; 
  
  var commonNumbers = numbersA.toSet().intersection(numbersB.toSet()); 
  
  print("Common numbers shared by both arrays:"); 
  commonNumbers.forEach(print);
}
/*
Common numbers shared by both arrays:
8
5
*/

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
/*
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
*/

linq52(){
  var numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]; 
  var numbersB = [ 1, 3, 5, 7, 8 ]; 
  
  var aOnlyNumbers = numbersA.toSet().difference(numbersB.toSet()); 
  
  print("Numbers in first array but not second array:"); 
  aOnlyNumbers.forEach(print);
}
/*
Numbers in first array but not second array:
0
9
2
4
6
*/

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
/*
First letters from Product names, but not from Customer names:
Z
J
U
*/
