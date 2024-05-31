import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../functional_classes/products.dart';

class AddProductPage extends StatefulWidget {

  const AddProductPage({super.key, required this.product});
  final Product product;
  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  late final TextEditingController _textController;
  double _inputValue = 0;
  double _calculatedProteinValue = 0;
  double _calculatedFatValue = 0;
  double _calculatedCarbohydrateValue = 0;
  double _calculatedCaloriesValue = 0;
  String? nameProduct;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _textController.addListener(_onTextChanged);
     nameProduct= widget.product.name.toString();
  }

  @override
  void dispose() {
    _textController.removeListener(_onTextChanged);
    _textController.dispose();
    super.dispose();
  }

  double _calculateValue(double gramm, num macroParametr) {
    // Замените эту функцию на ваши вычисления
    return gramm * macroParametr / 100;
  }

  void _onTextChanged() {
    setState(() {
      _inputValue = double.tryParse(_textController.text) ?? 0;
    });
  }

  void _onSaveButtonPressed() {
    setState(() {
      _calculatedProteinValue = _calculateValue(_inputValue, double.parse(widget.product.protein.toStringAsFixed(1)));
      _calculatedFatValue = _calculateValue(_inputValue, double.parse(widget.product.fat.toStringAsFixed(1)));
      _calculatedCarbohydrateValue = _calculateValue(_inputValue, double.parse(widget.product.carbohydrates.toStringAsFixed(1)));
      _calculatedCaloriesValue = _calculateValue(_inputValue, double.parse(widget.product.calories.toStringAsFixed(1)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add ${nameProduct} to my diary',
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      resizeToAvoidBottomInset: true,
      body: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          return SingleChildScrollView(
            reverse: isKeyboardVisible,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: isKeyboardVisible ? MediaQuery.of(context).viewInsets.bottom: 0,
              ),
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _textController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(width: 0.3),
                          ),
                          hintText: 'Count grams',
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: _onSaveButtonPressed,
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.lightGreen),
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 60.0),
                        ),
                      ),
                      child: Text('Update'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Flexible(
                      child: GridView.count(
                        crossAxisCount: 2,
                        physics: NeverScrollableScrollPhysics(),
                        childAspectRatio: 1.7,
                        padding: EdgeInsets.all(10),
                        shrinkWrap: true,
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.lightGreen,),
                            alignment: Alignment.center,
                            child: Text('Protein: $_calculatedProteinValue'),
                            margin: EdgeInsets.all(10),
                          ),
                          Container(
                            decoration: BoxDecoration(color: Colors.lightGreen),
                            alignment: Alignment.center,
                            child: Text('Fat: $_calculatedFatValue'),
                            margin: EdgeInsets.all(10),
                          ),
                          Container(
                            decoration: BoxDecoration(color: Colors.lightGreen),
                            alignment: Alignment.center,
                            child: Text('Carbohydrates: $_calculatedCarbohydrateValue'),
                            margin: EdgeInsets.all(10),
                          ),
                          Container(
                            decoration: BoxDecoration(color: Colors.lightGreen),
                            alignment: Alignment.center,
                            child: Text('Calories: $_calculatedCaloriesValue'),
                            margin: EdgeInsets.all(10),
                          ),
                        ],
                      ),
                    ),
                    //TextButton(onPressed: , child: child)

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
