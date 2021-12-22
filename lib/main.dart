import 'package:controlled_animations/controlled_animations_page.dart';
import 'package:controlled_animations/exercise_one_page.dart';
import 'package:controlled_animations/exercise_two_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutterando Masterclass'),
      ),
      body: Column(
        children: [
          GoToListTileWidget(
            goTo: ControlledAnimationsPage(),
            title: '1 - Controlled Animations',
          ),
          GoToListTileWidget(
            goTo: ExerciseOnePage(),
            title: '2 - Exercise One',
          ),
          GoToListTileWidget(
            goTo: ExerciseTwoPage(),
            title: '3 - Exercise Two',
          ),
        ],
      ),
    );
  }
}

class GoToListTileWidget extends StatelessWidget {
  final Widget goTo;
  final String title;

  const GoToListTileWidget({Key? key, required this.goTo, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => goTo),
      ),
    );
  }
}
