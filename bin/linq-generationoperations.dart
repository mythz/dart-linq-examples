part of linq_samples;

doGenerationOperations() =>
  runSamples("LINQ - Generation Operators", 
    {'linq65': 'Range', 
     'linq66': 'Repeat'});

List range(int from, [int to]) =>
  to != null 
    ? new List.generate(to, (x) => x + from)
    : new List.generate(from, (x) => x);
    
linq65(){
  var numbers = range(100, 50)
    .map((n) => { 'Number': n, 'OddEven': n % 2 == 1 ? "odd" : "even" }); 
      
  numbers.forEach((n) =>
      print("The number ${n['Number']} is ${n['OddEven']}.")); 
}
/*
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
*/

linq66(){
  var numbers = new List.filled(10, 7); 

  numbers.forEach(print);
}
/*
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
*/
