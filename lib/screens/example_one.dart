import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/count_provider.dart';
import 'package:provider/provider.dart';

class ExampleOne extends StatelessWidget {
  const ExampleOne({super.key});

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print('Whole widget builds');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example One'),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<CountProvider>(
          builder: (context, value, child) {
            print('only this widget builds');
            return Text(
              value.count.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
