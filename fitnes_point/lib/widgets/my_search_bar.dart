/*
import 'package:flutter/material.dart';

import '../functional_classes/products.dart';

class MySearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;

  MySearchBar({super.key, required this.onChanged});

static List <Product> products = [];

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  final TextEditingController _searchController = TextEditingController();

  void _clearTextField() {
    _searchController.clear();
    widget.onChanged('');
  }

  void _onChanged() {
    widget.onChanged(_searchController.text);
  }

  List<Product> display_list = List.from(MySearchBar.products);

  void updateList(String value){
    setState(() {
      display_list = MySearchBar.products.where((element) => element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return
  }
}
*/
