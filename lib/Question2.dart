import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          // DARK THEME
          ThemeData.dark(),

      // //LIGHT THEME
      // ThemeData(
      //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //     useMaterial3: true,
      //   ),

      home: const Ques2(),
    );
  }
}

class Ques2 extends StatelessWidget {
  const Ques2({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          "Recommeded for \nyour devices",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Text(
            "See All",
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
      body: const SingleChildScrollView (
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(
                  Icons.face,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Image(
            image: AssetImage("assets/airpods-pro-lite.png"),
            fit: BoxFit.cover,
          ),
          Text(
            "Free Engraving",
            style: TextStyle(color: Colors.amber),
          ),
          Text("AirPods Max - Silver"),
          Text("AT 899.00"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.black,
              ),
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.blue,
              ),
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.blueGrey,
              ),
              Text("  +1 more"),
            ],
          )
        ],
      ),),
    );
  }
}
