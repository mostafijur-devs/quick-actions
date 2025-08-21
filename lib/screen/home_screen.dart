import 'package:flutter/material.dart';
import 'package:quick_action/screen/search/search_demo.dart';
import 'package:quick_action/screen/search/show_search_screen.dart';
import 'package:quick_action/screen/secend_screen.dart';
import 'package:quick_actions/quick_actions.dart';

import 'frist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  QuickActions quickActions = QuickActions();

  String searchText = 'polok';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _quickAction();
  }

  void _quickAction()  {
    quickActions.setShortcutItems(<ShortcutItem>[
      ShortcutItem(
        type: 'homePage',
        localizedTitle: 'Home Page',
        icon: 'home',
        localizedSubtitle: 'this is home page',
      ),

      ShortcutItem(
        type: 'frist_screen',
        localizedTitle: 'Go To Frist Screen',
        icon: 'ic_launcher',
      ),
      ShortcutItem(
        type: 'secend_screen',
        localizedTitle: 'Go To Second Screen',
        icon: 'images',
        localizedSubtitle: 'open second screen',
      ),
    ]);
    quickActions.initialize((type) {
      if (type == 'homePage') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else if (type == 'frist_screen') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FristScreen()),
        );
      } else if (type == 'secend_screen') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecendScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'), centerTitle: true,actions: [
        IconButton(onPressed: () async {
          // showSearch(context: context, delegate: )
         String result = await showSearch(context: context, delegate: ShowSearchScreen() );
         print(' ***********$result*********');
         if(result != null && result.isNotEmpty) {
           setState(() {
             searchText = result;
           });
         }
        }, icon: Icon(Icons.search_rounded))
      ],),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(searchText,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            // Text(
            //   'This is homeo page',
            //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FristScreen()),
                );
              },
              child: Text('Go To First Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecendScreen()),
                );
              },
              child: Text('Go To Second Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchDemo()),
                );
              },
              child: Text('Go To Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Custom Search Delegate
class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Orange",
    "Pineapple",
    "Grapes",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // search box clear
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // back button press -> search close
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchQuery[index]),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchQuery[index]),
          onTap: () {
            query = matchQuery[index]; // suggestion click করলে query সেট হবে
            showResults(context); // search result দেখাবে
          },
        );
      },
    );
  }
}

class SearchdDemo extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }


}
