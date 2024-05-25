import 'package:flutter/material.dart';

class RowKBGU extends StatelessWidget {
  const RowKBGU({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 5,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: 1.2,
        children: <Widget>[
          const Padding(
            padding: const EdgeInsets.all(5.0),
            child:   Column(
              children: [
                Align(alignment: Alignment.centerRight,child: Text('Protein', maxLines: 1, overflow: TextOverflow.fade,)),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Align(alignment: Alignment.bottomCenter,child: Text('6'),),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: const  Column(
                children: [
                  Align(alignment: Alignment.center,child: Text('Fats', maxLines: 1, overflow: TextOverflow.fade,)),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Align(alignment: Alignment.bottomCenter,child: Text('6'),),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: const  Column(
                children: [
                  Align(alignment: Alignment.center,child: Text('Carb', maxLines: 1, overflow: TextOverflow.fade,)),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Align(alignment: Alignment.bottomCenter,child: Text('6'),),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: const  Column(
                children: [
                  Align(alignment: Alignment.center,child: Text('RPD', maxLines: 1, overflow: TextOverflow.fade,)),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Align(alignment: Alignment.bottomCenter,child: Text('6'),),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: const  Column(
                children: [
                  Align(alignment: Alignment.center,child: Text('kkal', maxLines: 1, overflow: TextOverflow.clip,style: TextStyle(fontSize: 20),)),
                  Align(alignment: Alignment.center,child: Text('6421'),)
                ],
              ),
            ),
          )
        ]
    );
  }
}
