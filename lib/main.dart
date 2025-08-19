import 'package:flutter/material.dart';
import 'package:quick_action/screen/home_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}



// // ignore_for_file: avoid_print
//
// import 'dart:async';
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'TutorialCoachMark Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const AutoAdvanceTutorialPage(),
//     );
//   }
// }
// class AutoAdvanceTutorialPage extends StatefulWidget {
//   const AutoAdvanceTutorialPage({super.key});
//
//   @override
//   State<AutoAdvanceTutorialPage> createState() => _AutoAdvanceTutorialPageState();
// }
//
// class _AutoAdvanceTutorialPageState extends State<AutoAdvanceTutorialPage> {
//   final GlobalKey _fabKey = GlobalKey();
//   final GlobalKey _textKey = GlobalKey();
//   final GlobalKey _buttonKey = GlobalKey();
//
//   List<TargetFocus> targets = [];
//   TutorialCoachMark? tutorialCoachMark; // TutorialCoachMark ইনস্ট্যান্স স্টোর করার জন্য
//
//   int _currentIndex = 0; // বর্তমান টার্গেটের ইনডেক্স
//   Timer? _timer; // টাইমার অবজেক্ট
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _initTargets();
//       _showTutorial();
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel(); // উইজেট ডিসপোজ হওয়ার সময় টাইমার বন্ধ করুন
//     super.dispose();
//   }
//
//   void _initTargets() {
//     targets.add(
//       TargetFocus(
//         keyTarget: _fabKey,
//         alignSkip: Alignment.topRight,
//         contents: [
//           TargetContent(
//             align: ContentAlign.top,
//             child: const Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   "এটি আপনার অ্যাড বাটন!",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     fontSize: 20.0,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 10.0),
//                   child: Text(
//                     "এখানে ক্লিক করে নতুন আইটেম যোগ করুন। (৩ সেকেন্ড পর পরিবর্তন)",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//
//     targets.add(
//       TargetFocus(
//         keyTarget: _textKey,
//         contents: [
//           TargetContent(
//             align: ContentAlign.bottom,
//             child: const Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Text(
//                   "এটি একটি গুরুত্বপূর্ণ টেক্সট",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     fontSize: 20.0,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 10.0),
//                   child: Text(
//                     "এখানে আপনার অ্যাপের মূল তথ্য দেখানো হবে। (৩ সেকেন্ড পর পরিবর্তন)",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//
//     targets.add(
//       TargetFocus(
//         keyTarget: _buttonKey,
//         contents: [
//           TargetContent(
//             align: ContentAlign.top,
//             child: const Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Text(
//                   "এই বাটনটি টিউটোরিয়াল দেখায়",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     fontSize: 20.0,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 10.0),
//                   child: Text(
//                     "আপনার টিউটোরিয়াল এখানেই শেষ!",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   void _showTutorial() {
//     tutorialCoachMark = TutorialCoachMark(
//       targets: targets,
//       colorShadow: Colors.black,
//       opacityShadow: 0.8,
//       onFinish: () {
//         print("টিউটোরিয়াল শেষ!");
//         _timer?.cancel(); // শেষ হলে টাইমার বন্ধ করুন
//         _currentIndex = 0; // ইনডেক্স রিসেট করুন
//       },
//       onClickTarget: (target) {
//         print("টার্গেটে ক্লিক করা হয়েছে: ${target.keyTarget}");
//         // যদি ক্লিক করার মাধ্যমে পরের ধাপে যেতে চান, তাহলে এখানে logic লিখুন
//         _timer?.cancel(); // ক্লিক করলে টাইমার বন্ধ করুন
//         _nextTarget(); // পরের টার্গেটে যান
//       },
//       onClickOverlay: (target) {
//         print("ওভারলেতে ক্লিক করা হয়েছে: ${target.keyTarget}");
//         _timer?.cancel(); // ক্লিক করলে টাইমার বন্ধ করুন
//         _nextTarget(); // পরের টার্গেটে যান
//       },
//       onSkip: () {
//         print("টিউটোরিয়াল স্কিপ করা হয়েছে!");
//         _timer?.cancel(); // স্কিপ করলে টাইমার বন্ধ করুন
//         _currentIndex = 0; // ইনডেক্স রিসেট করুন
//         return true;
//       },
//       hideSkip: false,
//       textSkip: "বাদ দিন",
//       paddingFocus: 10,
//     );
//
//     tutorialCoachMark!.show(context: context);
//     // _startTimer(); // প্রথম টার্গেটের জন্য টাইমার শুরু করুন
//   }
//
//   void _startTimer() {
//     _timer?.cancel(); // পুরনো টাইমার থাকলে বন্ধ করুন
//     if (_currentIndex < targets.length) {
//       _timer = Timer(const Duration(seconds: 3), () {
//         // ৩ সেকেন্ড পর এই ফাংশনটি কল হবে
//         _nextTarget();
//       });
//     }
//   }
//
//   void _nextTarget() {
//     if (_currentIndex < targets.length - 1) {
//       _currentIndex++;
//       tutorialCoachMark?.next(); // পরের টার্গেটে যান
//       _startTimer(); // পরের টার্গেটের জন্য টাইমার শুরু করুন
//     } else {
//       // এটি শেষ টার্গেট ছিল, টিউটোরিয়াল শেষ
//       tutorialCoachMark?.finish();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("স্বয়ংক্রিয় টিউটোরিয়াল"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "হ্যালো, ফ্লটার!",
//               key: _textKey,
//               style: const TextStyle(fontSize: 24),
//             ),
//             const SizedBox(height: 50),
//             ElevatedButton(
//               key: _buttonKey, // এখানেও Key যোগ করুন
//               onPressed: () {
//                 _showTutorial();
//               },
//               child: const Text("টিউটোরিয়াল দেখান"),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         key: _fabKey,
//         onPressed: () {},
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }