import 'package:favouriteapp/provider/favourite_item_provider.dart';
import 'package:favouriteapp/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favourite.dart';

class FavouriteApp extends StatefulWidget {
  const FavouriteApp({Key? key}) : super(key: key);

  @override
  State<FavouriteApp> createState() => _FavouriteAppState();
}

class _FavouriteAppState extends State<FavouriteApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite App"),
        actions: [
          const SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavouriteItem()));
            },
            child: const Icon(Icons.favorite),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Consumer<ThemeProvider>(
            builder: (context, value, child) {
              return Column(
                children: [
                  RadioListTile<ThemeMode>(
                      title: const Text("Light Mode"),
                      value: ThemeMode.light,
                      groupValue: value.themedata,
                      onChanged: value.getThemeData),
                  RadioListTile<ThemeMode>(
                      title: const Text("Dark Mode"),
                      value: ThemeMode.dark,
                      groupValue: value.themedata,
                      onChanged: value.getThemeData),
                  RadioListTile<ThemeMode>(
                      title: const Text("System Mode"),
                      value: ThemeMode.system,
                      groupValue: value.themedata,
                      onChanged: value.getThemeData),
                ],
              );
            },
          )),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: 1000,
              itemBuilder: (context, index) {
                return Consumer<FavouriteItemProvider>(
                    builder: (context, value, child) {
                  return ListTile(
                    onTap: () {
                      if (value.favouriteCount.contains(index)) {
                        value.unlikeValue(index);
                      } else {
                        value.getValue(index);
                      }
                    },
                    title: const Text("Favourite "),
                    leading: Text(index.toString()),
                    trailing: value.favouriteCount.contains(index)
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_outline),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
