part of linq_samples;

doGrouping() =>
  runSamples("LINQ - Grouping Operators",
    {'linq40': 'GroupBy - Simple 1', 
     'linq41': 'GroupBy - Simple 2',
     'linq42': 'GroupBy - Simple 3',
     'linq43': 'GroupBy - Nested',
     'linq44': 'GroupBy - Comparer',
     'linq45': 'GroupBy - Comparer, Mapped'});

anagramEqualityComparer(a, b) => 
  new String.fromCharCodes(order(a.codeUnits.toList()))
  .compareTo(new String.fromCharCodes(order(b.codeUnits.toList())));

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


linq40(){
  var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]; 
  
  var numberGroups = group(numbers, by:(n) => n % 5)
    .map((g) => {'Remainder':g.key, 'Numbers':g});
      
  numberGroups.forEach((g){
    print("Numbers with a remainder of ${g['Remainder']} when divided by 5:"); 
    g['Numbers'].forEach(print);
  });
}
/*
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
*/

linq41(){
  var words = [ "blueberry", "chimpanzee", "abacus", "banana", "apple", "cheese" ]; 
  
  var wordGroups = group(words, by:(w) => w[0])
    .map((g) => { 'FirstLetter': g.key, 'Words': g }); 
      
  wordGroups.forEach((g){
    print("Words that start with the letter '${g['FirstLetter']}':"); 
    g['Words'].forEach(print);
  });
}
/*
Words that start with the letter 'c':
chimpanzee
cheese
Words that start with the letter 'a':
abacus
apple
Words that start with the letter 'b':
blueberry
banana
*/

linq42(){
  var products = productsList(); 
  
  var orderGroups = group(products, by:(p) => p.category)
    .map((g) => { 'Category': g.key, 'Products': g });
 
  orderGroups.forEach(print);
}
/*
{Category: Dairy Products, Products: {{productId: 11, productName: Queso Cabrales, category: Dairy Products, unitPrice: 21.0, unitsInStock: 22}, {productId: 12, productName: Queso Manchego La Pastora, category: Dairy Products, unitPrice: 38.0, unitsInStock: 86}, {productId: 31, productName: Gorgonzola Telino, category: Dairy Products, unitPrice: 12.5, unitsInStock: 0}, {productId: 32, productName: Mascarpone Fabioli, category: Dairy Products, unitPrice: 32.0, unitsInStock: 9}, {productId: 33, productName: Geitost, category: Dairy Products, unitPrice: 2.5, unitsInStock: 112}, {productId: 59, productName: Raclette Courdavault, category: Dairy Products, unitPrice: 55.0, unitsInStock: 79}, {productId: 60, productName: Camembert Pierrot, category: Dairy Products, unitPrice: 34.0, unitsInStock: 19}, {productId: 69, productName: Gudbrandsdalsost, category: Dairy Products, unitPrice: 36.0, unitsInStock: 26}, {productId: 71, productName: Flotemysost, category: Dairy Products, unitPrice: 21.5, unitsInStock: 26}, {productId: 72, productName: Mozzarella di Giovanni, category: Dairy Products, unitPrice: 34.8, unitsInStock: 14}}}
{Category: Grains/Cereals, Products: {{productId: 22, productName: Gustaf's Knäckebröd, category: Grains/Cereals, unitPrice: 21.0, unitsInStock: 104}, {productId: 23, productName: Tunnbröd, category: Grains/Cereals, unitPrice: 9.0, unitsInStock: 61}, {productId: 42, productName: Singaporean Hokkien Fried Mee, category: Grains/Cereals, unitPrice: 14.0, unitsInStock: 26}, {productId: 52, productName: Filo Mix, category: Grains/Cereals, unitPrice: 7.0, unitsInStock: 38}, {productId: 56, productName: Gnocchi di nonna Alice, category: Grains/Cereals, unitPrice: 38.0, unitsInStock: 21}, {productId: 57, productName: Ravioli Angelo, category: Grains/Cereals, unitPrice: 19.5, unitsInStock: 36}, {productId: 64, productName: Wimmers gute Semmelknödel, category: Grains/Cereals, unitPrice: 33.25, unitsInStock: 22}}}
*/

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
/*
{CompanyName: Alfreds Futterkiste, YearGroups: {{Year: 1997, MonthGroups: {{Month: 8, Orders: {{orderId: 10643, orderDate: 1997-08-25 00:00:00.000, total: 814.5}}}, {Month: 10, Orders: {{orderId: 10692, orderDate: 1997-10-03 00:00:00.000, total: 878.0}, {orderId: 10702, orderDate: 1997-10-13 00:00:00.000, total: 330.0}}}}}, {Year: 1998, MonthGroups: {{Month: 1, Orders: {{orderId: 10835, orderDate: 1998-01-15 00:00:00.000, total: 845.8}}}, {Month: 3, Orders: {{orderId: 10952, orderDate: 1998-03-16 00:00:00.000, total: 471.2}}}, {Month: 4, Orders: {{orderId: 11011, orderDate: 1998-04-09 00:00:00.000, total: 933.5}}}}}}}
{CompanyName: Ana Trujillo Emparedados y helados, YearGroups: {{Year: 1996, MonthGroups: {{Month: 9, Orders: {{orderId: 10308, orderDate: 1996-09-18 00:00:00.000, total: 88.8}}}}}, {Year: 1997, MonthGroups: {{Month: 8, Orders: {{orderId: 10625, orderDate: 1997-08-08 00:00:00.000, total: 479.75}}}, {Month: 11, Orders: {{orderId: 10759, orderDate: 1997-11-28 00:00:00.000, total: 320.0}}}}}, {Year: 1998, MonthGroups: {{Month: 3, Orders: {{orderId: 10926, orderDate: 1998-03-04 00:00:00.000, total: 514.4}}}}}}}
*/

linq44(){
  var anagrams = [ "from   ", " salt", " earn ", "  last   ", " near ", " form  " ]; 
  
  var orderGroups = group(anagrams, by:(w) => w.trim(), matchWith:anagramEqualityComparer); 
  
  orderGroups.forEach((x) => print(x.values)); 
}
/*
[ salt,   last   ]
[ earn ,  near ]
[from   ,  form  ]
*/

linq45(){
  var anagrams = [ "from   ", " salt", " earn ", "  last   ", " near ", " form  " ]; 
  
  var orderGroups = group(anagrams, 
    by: (w) => w.trim(), 
    matchWith: anagramEqualityComparer, 
    valuesAs: (w) => w.toUpperCase()); 
  
  orderGroups.forEach((x) => print(x.values)); 
}
/*
[ SALT,   LAST   ]
[ EARN ,  NEAR ]
[FROM   ,  FORM  ]
*/
