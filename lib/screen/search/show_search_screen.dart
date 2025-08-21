import 'package:flutter/material.dart';

class ShowSearchScreen extends SearchDelegate {
  List<String> searchTopics = [
    "Variables",
    "Data Types",
    "Numbers",
    "Strings",
    "Booleans",
    "Lists",
    "Sets",
    "Maps",
    "Functions",
    "Anonymous Functions",
    "Arrow Functions",
    "Higher Order Functions",
    "Optional Parameters",
    "Named Parameters",
    "Null Safety",
    "Future",
    "Async",
    "Await",
    "Streams",
    "Classes",
    "Objects",
    "Constructors",
    "Named Constructors",
    "Factory Constructors",
    "Inheritance",
    "Polymorphism",
    "Encapsulation",
    "Abstraction",
    "Mixins",
    "Extensions",
    "Abstract Classes",
    "Interfaces",
    "Getters",
    "Setters",
    "Static Methods",
    // "Const",
    // "Final",
    // "Late Keyword",
    // "Exception Handling",
    // "Try Catch",
    // "Throw",
    // "Custom Exceptions",
    // "Generics",
    // "Type Inference",
    // "Is Operator",
    // "As Operator",
    // "Cascade Notation",
    // "Operators",
    // "Arithmetic Operators",
    // "Relational Operators",
    // "Logical Operators",
    // "Bitwise Operators",
    // "Conditional Expressions",
    // "Collections",
    // "Iterable",
    // "Spread Operator",
    // "Control Flow",
    // "If Else",
    // "Switch Case",
    // "For Loop",
    // "While Loop",
    // "Do While Loop",
    // "Break",
    // "Continue",
    // "Assertions",
    // "Enum",
    // "Record Types",
    // "Pattern Matching",
    // "Sealed Classes",
    // "Isolate",
    // "Compute Function",
    // "Reflection",
    // "Metadata",
    // "Annotations",
  ];

  // List<String> searchResults = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    List<String> matchQuery = [];
    for (var searchItem in searchTopics) {
      if (searchItem.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(searchItem);

      }
    }
    // print({'Result List : $matchQuery'});
    searchTopics.add(query);
    matchQuery.add(query);

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(onTap:() {
        close(context, matchQuery[index]);
      },title: Text(matchQuery[index])),
      itemCount: matchQuery.length,

    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var searchItem in searchTopics) {
      if (searchItem.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(searchItem);

      }
    }

    // print({'Suggestion List : $matchQuery'});

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(matchQuery[index]),
        onTap: () {
          query = matchQuery[index];
          // showResults(context);
          close(context, matchQuery[index]);

        },
      ),
      itemCount: matchQuery.length,
    );
  }
}
