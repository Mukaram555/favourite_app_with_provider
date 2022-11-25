import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favourite_item_provider.dart';

class FavouriteItem extends StatefulWidget {
  const FavouriteItem({Key? key}) : super(key: key);

  @override
  State<FavouriteItem> createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
  @override
  Widget build(BuildContext context) {
    final favouritecount = Provider.of<FavouriteItemProvider>(context);
    return  Scaffold(
      appBar: AppBar(title: const Text("Next Page App Bar"),),
      body: ListView.builder(
        itemCount: favouritecount.favouriteCount.length,
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


    );;
  }
}
