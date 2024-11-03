import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnes_point/functional_classes/products.dart';

import '../pages/add_product_page.dart';

class ProductList extends StatefulWidget {
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    getProductStream();
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }

  _onSearchChanged(){
    print(_searchController.text);
    searchResultList();
  }

  List<Product> products = [];
  List<Product> _resultList = [];

  searchResultList(){
    List<Product> showResult = [];
    if(_searchController.text.isNotEmpty){
      for(var product in products){
        if(product.name.toLowerCase().contains(_searchController.text.toLowerCase())){
          showResult.add(product);
        }
      }
    } else {
      showResult = List.from(products);
    }
    setState(() {
      _resultList = showResult;
    });
  }

  getProductStream() async {
    var data = await FirebaseFirestore.instance.collection('product').orderBy('name').get();
    List<Product> productList = data.docs.map((doc) => Product.fromFirestore(doc)).toList();

    setState(() {
      products = productList;
    });
    searchResultList();
  }

  @override
  void dispose(){
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getProductStream();
    super.didChangeDependencies();
  }

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(width: 0.3),
              ),
              hintText: 'Search Food',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _resultList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_resultList[index].name),
                subtitle: Text('${_resultList[index].calories} calories'),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return AddProductPage(product: _resultList[index],userId: 'UserId',);
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
