part of linq_samples;

doQueryExecution() =>
  doAll([linq99,
         linq100,
         linq101]);

linq99(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  var i = 0; 
  var q = numbers.map((n) => ++i);
  
  q.forEach((v) => 
    print("v = $v, i = $i"));
}
/*
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
*/

linq100(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  var i = 0; 
  var q = numbers.map((n) => ++i).toList();
  
  q.forEach((v) => 
    print("v = $v, i = $i"));
}
/*
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
*/

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
/*
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
*/
