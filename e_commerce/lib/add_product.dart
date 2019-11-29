import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './database/brand.dart';
import './database/category.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  Color white = Colors.white;
  Color black = Colors.black;
  Color grey = Colors.grey;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  List<DocumentSnapshot> brands = <DocumentSnapshot>[];
  List<DocumentSnapshot> categories = <DocumentSnapshot>[];
  List<DropdownMenuItem<String>> brandsDropdown = <DropdownMenuItem<String>>[];
  List<DropdownMenuItem<String>> categoriesDropdown = <DropdownMenuItem<String>>[];
  CategoryService _categoryService = CategoryService();
  BrandService _brandService = BrandService();
  List<String> selectedSizes = <String>[];
  String _currentCategory;
  String _currentBrand;

  List<DropdownMenuItem<String>> getCategoriesDropdown(){
    List<DropdownMenuItem<String>> items = List();
    for(int i = 0; i < categories.length; i++){
      setState(() {
        items.insert(0, DropdownMenuItem(
          child: Text(categories[i].data["categoryName"]),
          value: categories[i].data["categoryName"])
        );
      });
    }
    return items; 
  }

  _getCategories() async {
    List<DocumentSnapshot> data = await _categoryService.getCategories();
    setState(() {
      categories = data;
      categoriesDropdown = getCategoriesDropdown();
      _currentCategory = categories[0].data["categoryName"];
    });
  }

  changeSelectedCategory(String selectedCategory){
    setState(() {
      _currentCategory = selectedCategory;
    });
  }

  void changeSelectedSize(String size){
    if(selectedSizes.contains(size)){
      setState(() {
        selectedSizes.remove(size);
      });
    }else {
      setState(() {
        selectedSizes.insert(0,size);
      });
    }
  }

  @override
  void initState(){
    _getCategories();
    getCategoriesDropdown();
    //_currentCategory = categoriesDropdown[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: white,
        leading: Icon(Icons.close, color: black),
        title: Text("Add Product", style: TextStyle(color: black),),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: OutlineButton(
                      borderSide: BorderSide(color: grey.withOpacity(0.5), width: 2.5),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(14.0, 26.0, 14.0, 26.0),
                        child: Icon(Icons.add, color: grey),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: OutlineButton(
                      borderSide: BorderSide(color: grey.withOpacity(0.5), width: 2.5),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(14.0, 26.0, 14.0, 26.0),
                        child: Icon(Icons.add, color: grey),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: OutlineButton(
                      borderSide: BorderSide(color: grey.withOpacity(0.5), width: 2.5),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(14.0, 26.0, 14.0, 26.0),
                        child: Icon(Icons.add, color: grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextFormField(
                controller: productNameController,
                decoration: InputDecoration(
                  hintText: "Product name",
                ),
                validator: (value){
                  if(value.isEmpty){
                    return ("You must enter the name of the product");
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextFormField(
                controller: productDescriptionController,
                decoration: InputDecoration(
                  hintText: "Product description",
                ),
                validator: (value){
                  if(value.isEmpty){
                    return ("You must enter a description for the product");
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextFormField(
                controller: productPriceController,
                decoration: InputDecoration(
                  hintText: "Price in \$",
                ),
                validator: (value){
                  if(value.isEmpty){
                    return ("You must enter a price for the product");
                  }
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextFormField(
                controller: productPriceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Quantity",
                ),
                validator: (value){
                  if(value.isEmpty){
                    return ("You must enter a quantity for the product");
                  }
                },
              ),
            ),

            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Category: ", 
                  style: TextStyle(color: Colors.red),
                  ),
                ),
                DropdownButton(
                  items: categoriesDropdown,
                  onChanged: changeSelectedCategory,
                  value: _currentCategory,
                ),
              ],
            ),
           /*Visibility(
              visible: _currentCategory != null,
              child: InkWell(
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(_currentCategory ?? "",
                            style: TextStyle(color: white)),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, color: white,),
                            onPressed: () {
                              setState(() {
                                _currentCategory = "";
                              });
                            } ,),
                        ],
                      ),
                    ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "Add a category",
                  )
                ),
                suggestionsCallback: (pattern) async {
                  return await _categoryService.getSuggestions(pattern);
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    leading: Icon(Icons.category),
                    title: Text(suggestion['categoryName']),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  setState(() {
                    _currentCategory = suggestion;
                  });
                },
              )
            ),*/

           /* Visibility(
              visible: _currentBrand != null,
              child: InkWell(
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(_currentBrand ?? "",
                            style: TextStyle(color: white)),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, color: white,),
                            onPressed: () {
                              setState(() {
                                _currentBrand = "";
                              });
                            } ,),
                        ],
                      ),
                    ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "add a brand",
                  )
                ),
                suggestionsCallback: (pattern) async {
                  return await _brandService.getSuggestions(pattern);
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    leading: Icon(Icons.category),
                    title: Text(suggestion['brandName']),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  setState(() {
                    _currentBrand = suggestion;
                  });
                },
              )
            ),*/

            Row(
              children: <Widget>[
                Checkbox(value: selectedSizes.contains('XS'), onChanged: (value) => 
                changeSelectedSize("XS")), 
                Text("XS"),
                Checkbox(value: false, onChanged: null,), 
                Text("S"),
                Checkbox(value: false, onChanged: null,), 
                Text("M"),
                Checkbox(value: false, onChanged: null,), 
                Text("L"),
                Checkbox(value: false, onChanged: null,), 
                Text("Xl"),
                Checkbox(value: false, onChanged: null,), 
                Text("Paupiette"),
              ],
            ),

            FlatButton(
              color: Colors.red,
              textColor: white,
              child: Text("Add Product"),
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}