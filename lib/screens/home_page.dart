import 'package:favouriteapp/provider/favourite_item_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteApp extends StatefulWidget {
  const FavouriteApp({Key? key}) : super(key: key);

  @override
  State<FavouriteApp> createState() => _FavouriteAppState();
}

class _FavouriteAppState extends State<FavouriteApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favourite App"),),
      body: ListView.builder(
        itemCount: 1000,
        itemBuilder: (context, index) {
          return Consumer<FavouriteItemProvider>(builder: (context,value,child){
           return ListTile(
             onTap: (){
               if(value.favouriteCount.contains(index)){
                 value.unlikeValue(index);
               }
               else{
                 value.getValue(index);
               }
             },
               title: const Text("Favourite "),
            leading: Text(index.toString()),
            trailing: value.favouriteCount.contains(index)? Icon(Icons.favorite) : Icon(Icons.favorite_outline),
            );
          });
        },),


    );
  }
}
