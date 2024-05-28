import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnes_point/widgets/my_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fitnes_point/theme/app_colors.dart';
import 'package:fitnes_point/theme/app_text_styles.dart';

class MealCard extends StatefulWidget {
  const MealCard(
      {Key? key,
        required this.title,
        this.subtitle,
        required this.icon,
        required this.iconColor})
      : super(key: key);

  final String title;
  final String? subtitle;
  final IconData icon;
  final Color iconColor;

  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 400,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    color: Colors.black87,
                    height: 43,
                    padding: EdgeInsets.all(10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back_ios, color: Colors.lightGreen,),
                        Text('ЕДА', style: TextStyle(color: Colors.white70),),
                        Icon(Icons.arrow_forward_ios,color: Colors.lightGreen,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MySearchBar(),
                  ),
                  Expanded(
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('product').snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Text(
                            'Нет записей',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black, // Changed to black for better visibility
                            ),
                          );
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              key: Key(snapshot.data!.docs[index].id),
                              child: ListTile(
                                title: Text(snapshot.data!.docs[index].get('name')),

                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 1.5,
              )
            ],
          ),
          child: Row(
            children: [
              Flexible(
                child: ListTile(
                  leading: Icon(
                    widget.icon,
                    color: widget.iconColor,
                  ),
                  title: Text(widget.title),
                  subtitle: widget.subtitle != null ? Text(widget.subtitle!) : null,
                ),
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.add_rounded,
                    color: Colors.blueAccent,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
