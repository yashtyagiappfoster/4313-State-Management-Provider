import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Screen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child:
              Consumer<FavouriteProvider>(builder: (context, val, child) {
            return ListView.builder(
                itemCount: val.selectedvalue.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      val.removeValue(index);
                    },
                    title: Text('Item ${val.selectedvalue[index]}'),
                    trailing: const Icon(Icons.favorite),
                  );
                });
          })),
        ],
      ),
    );
  }
}
