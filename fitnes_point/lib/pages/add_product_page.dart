import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Column(
        children: [
          Text('Add product to my diary'),
          TextField(
            decoration:InputDecoration(
              hintText: 'Count grams',
            ),
          )
        ],
      ),
    );
  }
}
