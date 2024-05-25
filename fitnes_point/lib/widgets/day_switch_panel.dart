import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime currentDate = DateTime.now();
String dayOfWeek = DateFormat('EEEE').format(currentDate);

class DaySwitchPanel extends StatelessWidget {
  const DaySwitchPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 0),
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_back_ios_new_outlined),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    child: const Icon(Icons.calendar_month,color: Colors.green,),
                  ),
                ),
                Text('${DateFormat('dd.MM.yyyy').format(currentDate)}, ${dayOfWeek}'),
              ],
            ),
            const Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
    );
  }
}
