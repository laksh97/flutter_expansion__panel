import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      title: "Flutter Expansion Panel",
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyItem {
  bool isExpanded = false;
  final String header;
  final Widget body;

  MyItem({required this.isExpanded, required this.header, required this.body});
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<MyItem> _items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 10; i++) {
      _items.add(
        MyItem(
          isExpanded: false,
          header: "Item $i",
          body: Container(
            padding: EdgeInsets.all(5),
            child: Text("Hello world"),
          ),
        ),
      );
    }
  }

  ExpansionPanel _createItem(MyItem item) {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Container(
          padding: EdgeInsets.all(5),
          child: Text("Header ${item.header}"),
        );
      },
      body: Container(
        padding: EdgeInsets.all(5),
        child: item.body,
      ),
      isExpanded: item.isExpanded,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Expansion Panel"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _items[index].isExpanded = !_items[index].isExpanded;
                });
              },
              children: _items.map(_createItem).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
