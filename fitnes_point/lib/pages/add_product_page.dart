import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../functional_classes/products.dart';

class AddProductPage extends StatefulWidget {
  final Product product;
  final String userId;

  const AddProductPage({super.key, required this.product, required this.userId});

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


  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _textController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _textController.removeListener(_onTextChanged);
    _textController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _inputValue = double.tryParse(_textController.text) ?? 0;
      _calculatedProteinValue = _calculateValue(_inputValue, double.parse(widget.product.protein.toStringAsFixed(1)));
      _calculatedFatValue = _calculateValue(_inputValue, double.parse(widget.product.fat.toStringAsFixed(1)));
      _calculatedCarbohydrateValue = _calculateValue(_inputValue,double.parse(widget.product.carbohydrates.toStringAsFixed(1)));
      _calculatedCaloriesValue = _calculateValue(_inputValue, double.parse(widget.product.calories.toStringAsFixed(1)));
    });
  }

  double _calculateValue(double gramm, double macroParametr) {
    return gramm * macroParametr / 100;
  }

  void _onSaveButtonPressed() async {
    await addEatenProduct(widget.userId, widget.product.name, _inputValue);

    setState(() {
      _calculatedProteinValue = _calculateValue(_inputValue, double.parse(widget.product.protein.toStringAsFixed(1)));
      _calculatedFatValue = _calculateValue(_inputValue, double.parse(widget.product.fat.toStringAsFixed(1)));
      _calculatedCarbohydrateValue = _calculateValue(_inputValue, double.parse(widget.product.carbohydrates.toStringAsFixed(1)));
      _calculatedCaloriesValue = _calculateValue(_inputValue, double.parse(widget.product.calories.toStringAsFixed(1)));
    });
  }

  Future<void> addEatenProduct(String userId, String productName, double weight) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Получаем текущую дату и время
    DateTime now = DateTime.now();

    // Создаем новый документ в подколлекции `eaten_products` для конкретного пользователя
    await firestore.collection('user').doc(userId).collection('eaten_products').add({
      'name': productName,
      'weight': weight,
      'date': Timestamp.fromDate(now),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          return SingleChildScrollView(
            reverse: isKeyboardVisible,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: isKeyboardVisible
                      ? MediaQuery.of(context).viewInsets.bottom
                      : 0),
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Add product to my diary',
                      style: TextStyle(fontSize: 30),
                    ),
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
                      child: Text('Save'),
                    ),
                    const SizedBox(
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
                            child: Text('Carbs: $_calculatedCarbohydrateValue'),
                            margin: EdgeInsets.all(10),
                          ),
                          Container(
                            decoration: BoxDecoration(color: Colors.lightGreen),
                            alignment: Alignment.center,
                            child: Text('Fiber: $_calculatedCaloriesValue'),
                            margin: EdgeInsets.all(10),
                          ),
                        ],
                      ),
                    )
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
