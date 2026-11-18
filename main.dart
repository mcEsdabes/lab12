import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContainerProvider(),
      child: const MyApp(),
    ),
  );
}

class ContainerProvider extends ChangeNotifier {
  double width = 150.0;
  double height = 150.0;
  double topRightRadius = 30.0;

  void setWidth(double value) {
    width = value;
    notifyListeners();
  }

  void setHeight(double value) {
    height = value;
    notifyListeners();
  }

  void setRadius(double value) {
    topRightRadius = value;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Лабораторна робота 12'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SlidersSection(),
              SizedBox(height: 30),
              RedContainerSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class SlidersSection extends StatelessWidget {
  const SlidersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ContainerProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ширина: ${provider.width.toInt()}'),
        Slider(
          value: provider.width,
          min: 50,
          max: 300,
          onChanged: (value) {
            provider.setWidth(value);
          },
        ),
        Text('Висота: ${provider.height.toInt()}'),
        Slider(
          value: provider.height,
          min: 50,
          max: 300,
          onChanged: (value) {
            provider.setHeight(value);
          },
        ),
        Text('Радіус верхнього правого кутка: ${provider.topRightRadius.toInt()}'),
        Slider(
          value: provider.topRightRadius,
          min: 0,
          max: 150,
          onChanged: (value) {
            provider.setRadius(value);
          },
        ),
      ],
    );
  }
}

class RedContainerSection extends StatelessWidget {
  const RedContainerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ContainerProvider>();

    return Container(
      width: provider.width,
      height: provider.height,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(provider.topRightRadius),
        ),
      ),
    );
  }
}