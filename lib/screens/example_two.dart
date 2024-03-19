import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/example_two_provider.dart';
import 'package:provider/provider.dart';

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Two'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleTwoProvider>(builder: (context, value, child) {
            print('build only');
            return Slider(
                min: 0,
                max: 1,
                value: value.opacity,
                onChanged: (val) {
                  value.setOpacity(val);
                });
          }),
          Consumer<ExampleTwoProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(value.opacity),
                    ),
                    child: const Center(
                      child: Text('Container 1'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(value.opacity),
                    ),
                    child: const Center(
                      child: Text('Container 1'),
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
