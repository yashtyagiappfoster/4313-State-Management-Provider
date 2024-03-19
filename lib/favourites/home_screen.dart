import 'package:flutter/material.dart';
import 'package:flutter_provider/favourites/favourite_screen.dart';
import 'package:flutter_provider/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FavouriteScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.favorite))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Consumer<FavouriteProvider>(
                          builder: (context, val, child) {
                        return ListTile(
                          onTap: () {
                            if (val.selectedvalue.contains(index)) {
                              val.removeValue(index);
                            } else {
                              val.addValue(index);
                            }
                          },
                          title: Text('Item ${index}'),
                          trailing: Icon(val.selectedvalue.contains(index)
                              ? Icons.favorite
                              : Icons.favorite_border),
                        );
                      }),
                    );
                  }))
        ],
      ),
    );
  }
}
