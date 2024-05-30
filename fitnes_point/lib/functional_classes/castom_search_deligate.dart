/*

import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate{

  @override
  List<Widget> buildActions(BuildContext context){
    return[
      IconButton(
          onPressed: (){
            query = '';
            },
          icon: const Icon(Icons.arrow_back)
      )
    ];
  }
  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
        onPressed: (){
          close(context, null);
        },
        icon: Icon(Icons.arrow_back)
    );
  }
  @override
  Widget buildResults(BuildContext context){
    List<String> matchQuery = [];

    for(var products in searchTerms){
      if(products.toLowerCase().conteins(query.toLowerCase())){
        matchQuery.add(products);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context,index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
  @override
  Widget buildSuggestions(BuildContext context){
    List<String> matchQuery = [];
    for(var products in searchTerms){
      if(products.toLowerCase().conteins(query.toLowerCase())){
        matchQuery.add(products);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context,index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
*/

