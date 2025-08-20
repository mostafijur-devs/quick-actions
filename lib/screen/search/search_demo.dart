import 'package:flutter/material.dart';

class SearchDemo extends StatefulWidget {
  const SearchDemo({super.key});

  @override
  _SearchDemoState createState() => _SearchDemoState();
}

class _SearchDemoState extends State<SearchDemo> {
  List<String> items = [
    'Apple',
    'Banana',
    'Mango',
    'Orange',
    'Pineapple',
    'Grapes',
  ];

  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items;
  }

  void _filterSearchResults(String query) {
    List<String> dummyList = [];
    dummyList.addAll(items);
    if (query.isNotEmpty) {
      List<String> dummySearchList = [];
      for (var item in dummyList) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          dummySearchList.add(item);
        }
      }
      setState(() {
        filteredItems = dummySearchList;
      });
      return;
    } else {
      setState(() {
        filteredItems = items;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Demo"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                _filterSearchResults(value);
              },
              decoration: const InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredItems[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
