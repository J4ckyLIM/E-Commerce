import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './database/brand.dart';
import './database/category.dart';
import './database/product.dart';
import 'package:image_picker/image_picker.dart';

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
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  List<DocumentSnapshot> brands = <DocumentSnapshot>[];
  List<DocumentSnapshot> categories = <DocumentSnapshot>[];
  List<DropdownMenuItem<String>> brandsDropdown = <DropdownMenuItem<String>>[];
  List<DropdownMenuItem<String>> categoriesDropdown = <DropdownMenuItem<String>>[];
  CategoryService _categoryService = CategoryService();
  BrandService _brandService = BrandService();
  ProductService _productService = ProductService();
  List<String> selectedSizes = <String>[];
  File _image;
  String _currentCategory;
  String _currentBrand;
  bool isLoading = false;

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

  void _selectImage(Future<File> pickImage, int imageNumber) async{
    File tempImg = await pickImage;
    switch(imageNumber) {
      case 1: setState(() {
        _image = tempImg;
      });
      break;
    }
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

  Future validateAndUpload() async {
    if(_formKey.currentState.validate()){
      setState(() {
        isLoading = true;
      });
      _productService.uploadProduct(
            productNameController.text,
            productDescriptionController.text,
            _currentCategory,
            selectedSizes,
            double.parse(priceController.text),
            int.parse(quantityController.text),
      );
      _formKey.currentState.reset();
            setState(() {
              isLoading = false;
      });
      Fluttertoast.showToast(msg: "Your product has been added to the shop");
      Navigator.pop(context);
    };
  }
      /*if(_image != null){
        String imageUrl;
        final FirebaseStorage storage = FirebaseStorage.instance;
        final String picture = "${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
        StorageUploadTask task = storage.ref().child(picture).putFile(_image);

        StorageTaskSnapshot theSnapshot = await task.onComplete.then((snapshot) => snapshot);
        task.onComplete.then((theSnaphot) async {
          imageUrl = await theSnapshot.ref.getDownloadURL();
          List<String> imageList = [imageUrl];*/
            
      
        /*else {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: "An image must be provided");
      }*/

  Widget _displayChild() {
    if(_image == null) {
      return Padding(
        padding: EdgeInsets.fromLTRB(14.0, 70.0, 14.0, 70.0),
        child: Icon(Icons.add, color: grey,),
      );
    } else {
      return Image.file(_image, fit: BoxFit.fill, width: double.infinity,);
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
        child: SingleChildScrollView(
          child: isLoading ? CircularProgressIndicator() : Column(
            children: <Widget>[
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
                  controller: priceController,
                  decoration: InputDecoration(
                    labelText: "Price in \$",
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
                  controller: quantityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Quantity",
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
<<<<<<< HEAD
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
=======

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
>>>>>>> Hugo

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
<<<<<<< HEAD
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
=======

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
>>>>>>> Hugo

              Row(
                children: <Widget>[
                  Checkbox(value: selectedSizes.contains('XS'), onChanged: (value) => 
                  changeSelectedSize("XS")), 
                  Text("XS"),
                  Checkbox(value: selectedSizes.contains('S'), onChanged: (value) => 
                  changeSelectedSize("S")), 
                  Text("S"),
                  Checkbox(value: selectedSizes.contains('M'), onChanged: (value) => 
                  changeSelectedSize("M")), 
                  Text("M"),
                  Checkbox(value: selectedSizes.contains('L'), onChanged: (value) => 
                  changeSelectedSize("L")), 
                  Text("L"),
                  Checkbox(value: selectedSizes.contains('XL'), onChanged: (value) => 
                  changeSelectedSize("XL")), 
                  Text("XL"),
                  Checkbox(value: selectedSizes.contains('Paupiette'), onChanged: (value) => 
                  changeSelectedSize("Paupiette")), 
                  Text("Paupiette"),
                ],
              ),

              FlatButton(
                color: Colors.red,
                textColor: white,
                child: Text("Add Product"),
                onPressed: (){
                  validateAndUpload();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}