part of linq_samples;

doJoinOperators() =>
  runSamples("LINQ - Join Operators",
    {'linq102': 'Cross Join',
     'linq103': 'Group Join',
     'linq104': 'Cross Join with Group Join',
     'linq105': 'Left Outer Join'});

join(Iterable seq, Iterable withSeq, bool match(x,y)) {
  var ret = [];
  seq.forEach((x) => withSeq
    .forEach((y){
      if (match(x,y))
        ret.add([x,y]);
    }));
  return ret;
}

joinGroup(Iterable seq, Iterable withSeq, bool match(x,y)) =>
  group(join(seq, withSeq, match), by:(j) => j[0]);  

linq102(){
  var categories = [ "Beverages", "Condiments", "Vegetables", "Dairy Products", "Seafood" ];  
  
  var products = productsList(); 
  
  var q = join(categories, products, (c,p) => c == p.category)
    .map((j) => { 'Category': j[0], 'ProductName': j[1].productName });

  q.forEach(print);
}
/*
{Category: Beverages, ProductName: Chai}
{Category: Beverages, ProductName: Chang}
{Category: Beverages, ProductName: Guaraná Fantástica}
{Category: Beverages, ProductName: Sasquatch Ale}
{Category: Beverages, ProductName: Steeleye Stout}
{Category: Beverages, ProductName: Côte de Blaye}
{Category: Beverages, ProductName: Chartreuse verte}
{Category: Beverages, ProductName: Ipoh Coffee}
...
*/

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
/*
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
   Sirop d'érable
   Vegie-spread
   Louisiana Fiery Hot Pepper Sauce
   Louisiana Hot Spiced Okra
   Original Frankfurter grüne Soße
...
*/

linq104(){
  var categories = [ "Beverages", "Condiments", "Vegetables", "Dairy Products", "Seafood" ];  
  
  var products = productsList(); 
  
  var q = joinGroup(categories, products, (c,p) => c == p.category)
    .expand((j) => j.values.map((g) => g[1])
      .map((p) => { 'Category': j.key, 'ProductName': p.productName }));

  q.forEach((v) => 
      print("${v['ProductName']}: ${v['Category']}"));
}
/*
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
*/

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
/*
Chai: Beverages
Chang: Beverages
Guaraná Fantástica: Beverages
Sasquatch Ale: Beverages
Steeleye Stout: Beverages
Côte de Blaye: Beverages
Chartreuse verte: Beverages
Ipoh Coffee: Beverages
Laughing Lumberjack Lager: Beverages
Outback Lager: Beverages
Rhönbräu Klosterbier: Beverages
Lakkalikööri: Beverages
Aniseed Syrup: Condiments
Chef Anton's Cajun Seasoning: Condiments
Chef Anton's Gumbo Mix: Condiments
Grandma's Boysenberry Spread: Condiments
Northwoods Cranberry Sauce: Condiments
Genen Shouyu: Condiments
Gula Malacca: Condiments
Sirop d'érable: Condiments
Vegie-spread: Condiments
Louisiana Fiery Hot Pepper Sauce: Condiments
Louisiana Hot Spiced Okra: Condiments
Original Frankfurter grüne Soße: Condiments
(No products): Vegetables
...
*/
