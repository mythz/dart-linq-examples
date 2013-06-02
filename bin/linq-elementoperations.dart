part of linq_samples;

doElementOperations() =>
  doAll([linq58, 
         linq59,
         linq60,
         linq61,
         linq62,
         linq63,
         linq64]);

linq58(){
  var products = productsList(); 
  
  var product12 = products 
      .where((p) => p.productId == 12)
      .first; 
  
  print(product12); 
}
/*
{productId: 12, productName: Queso Manchego La Pastora, category: Dairy Products, unitPrice: 38.0, unitsInStock: 86}
*/

linq59(){
  var strings = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]; 
  
  var startsWithO = strings.firstWhere((s) => s[0] == 'o'); 
  
  print("A string starting with 'o': $startsWithO"); 
}
/*
A string starting with 'o': one
*/

//Missing in docs and LINQ Samples?
linq60(){
}
/*
*/

linq61(){
  var numbers = []; 
  
  int firstNumOrDefault = numbers.firstWhere((x) => true, orElse:() => 0); 
  
  print(firstNumOrDefault); 
}
/*
0
*/

linq62(){
  var products = productsList(); 
  
  var product789 = products.firstWhere((p) => p.productId == 789, orElse:() => null); 
  
  print("Product 789 exists: ${product789 != null}"); 
}
/*
Product 789 exists: false
*/

//Missing in docs and LINQ Samples?
linq63(){

}
/*

*/

linq64(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  int fourthLowNum = numbers 
      .where((n) => n > 5)
      .elementAt(1); 
  
  print("Second number > 5: $fourthLowNum"); 
}
/*
Second number > 5: 8
*/
