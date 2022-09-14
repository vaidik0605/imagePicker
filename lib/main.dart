import 'package:flutter/material.dart';
import 'package:imagepicker/imagePicker.dart';
import 'package:imagepicker/multiple_Imagepicker.dart';

void main() {
  runApp(MaterialApp(
    home: demo(),
    debugShowCheckedModeBanner: false,
  ));
}

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Image Picker"),
            centerTitle: true,
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.tab),
                child: Text("Tab 1"),
              ),
              Tab(
                icon: Icon(Icons.tab),
                child: Text("Tab 2"),
              ),
            ]),
          ),
          body: const TabBarView(children: [
            imagepicker(),
            demo1(),
          ]),
        ));
  }
}
