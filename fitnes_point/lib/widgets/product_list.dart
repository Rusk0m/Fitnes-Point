import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnes_point/functional_classes/products.dart';

import 'my_search_bar.dart';

class ProductList extends StatefulWidget {
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  static List<Product> products = [];

  final TextEditingController _searchController = TextEditingController();


  List<Product> display_list = List.from(products);
  void updateList(String value) {
    setState(() {
      display_list = products
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
   return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('product').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              'Нет записей',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          );
        }
        List<Product> products = snapshot.data!.docs.map((doc) {
          return Product.fromFirestore(doc);
        }).toList();

        return Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) => updateList(value),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.3),
                ),
                hintText: 'Search Food',
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: (){},
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: display_list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    key: Key(display_list[index].name), // Предположим, что `name` уникален
                    child: ListTile(
                      title: Text(display_list[index].name),
                      //subtitle: Text(products[index].calories.toString()),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
