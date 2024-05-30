import 'package:fitnes_point/widgets/product_list.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  String _searchQuery = '';

  void _updateSearchQuery(String newQuery) {
    setState(() {
      _searchQuery = newQuery;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.black87,
            height: 43,
            padding: const EdgeInsets.all(10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios, color: Colors.lightGreen),
                Text('ЕДА', style: TextStyle(color: Colors.white70)),
                Icon(Icons.arrow_forward_ios, color: Colors.lightGreen),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
          ),
          Expanded(
            child: ProductList(),
          ),
        ],
      ),
    );
  }
}
