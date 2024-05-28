import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {

  final TextEditingController _controller = new TextEditingController();

  void _clearTextField(){
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: _controller,
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
          onPressed: _clearTextField,
        ),
      ),
    );
  }
}
