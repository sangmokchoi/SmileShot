import 'package:flutter/material.dart';

import 'VIew/photoScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my Smile Shot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFEE4A5)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        PhotoScreen.id : (context) => PhotoScreen(),
      },
      home: const MyHomePage(title: 'my Smile Shot'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/mySmileShot_logo.png'),
              Text(
                '오늘도 웃어보아요!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 15.0,),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, PhotoScreen.id);
              }, child: Text(
                '홈 화면으로'
              )),
            ],
          ),
        ),
      ),
    );
  }
}
