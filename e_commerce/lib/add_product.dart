import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './database/brand.dart';
import './database/category.dart';

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
  String _currentCategory;
  String _currentBrand;

  List<DropdownMenuItem<String>> getCategoriesDropdown(){
    List<DropdownMenuItem<String>> items = List();
    for(int i = 0; i < categories.length; i++){
      setState(() {
        categoriesDropdown.insert(0, DropdownMenuItem(
          child: Text(categories[i]["categoryName"]),
          value: categories[i]["categoryName"])
        );
      });
    }
    return items; 
  }

  _getCategories() async {
    List<DocumentSnapshot> data = await _categoryService.getCategories();
    setState(() {
      categories = data;
    });
  }

  changeSelectedCategory(String selectedCategory){
    setState(() {
      _currentCategory = selectedCategory;
    });
  }

  @override
  void initState(){
    _getCategories();
    //_getBrands();
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
                  hintText: "Price",
                ),
                validator: (value){
                  if(value.isEmpty){
                    return ("You must enter a price for the product");
                  }
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(categories[index]["categoryName"]),
                  );
                },
              ),
            ),
            // Center(
            //   child: DropdownButton(
            //     items: categoriesDropdown,
            //     onChanged: changeSelectedCategory,
            //     value: _currentCategory,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
