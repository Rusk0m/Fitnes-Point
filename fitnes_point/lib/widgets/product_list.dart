import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnes_point/functional_classes/products.dart';


class ProductList extends StatefulWidget {
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    getProductStram();
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }
  
  _onSearchChanged(){
    print(_searchController.text);
    searchResultList();
  }

  List products = [];
  List _resultList = [];

  searchResultList(){
    var showResult = [];
    if(_searchController.text !=''){
      for(var clientSnapShot in products){
        var name = clientSnapShot['name'].toString().toLowerCase();
        if(name.contains(_searchController.text.toLowerCase())){
          showResult.add(clientSnapShot);
        }
      }
    }
    else{
      showResult = List.from(products);
    }
    setState(() {
      _resultList = showResult;
    });
  }

  getProductStram() async {
    var data = await FirebaseFirestore.instance.collection('product').orderBy('name').get();

    setState(() {
      products = data.docs;
    });
    searchResultList();
  }

  void dispose(){
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getProductStram();
    super.didChangeDependencies();
  }

  final TextEditingController _searchController = TextEditingController();
/*

  List<Product> display_list = List.from(products);
  void updateList(String value) {
    setState(() {
      display_list = products
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _searchController,
              /*onChanged: (value) => updateList(value),*/
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
        Expanded(
          child: ListView.builder(
            itemCount: _resultList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  //key: Key(products[index][name]),
                  title: Text(_resultList[index]['name']),
                  //subtitle: Text(products[index].calories.toString()),
              );
            },
          ),
        ),
      ],
    );
  }
}
