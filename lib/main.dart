import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu App',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.pinkAccent),
      ),
      home: const MyHomePage(title: 'Home'),
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

        title: Text('App Bar'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
            child: SizedBox(), 
            ),
            ListTile(
              title: Text('Saldo'),
            ),
            ListTile(
              title: Text('Extrato'),
            ),
            ListTile(
              title: Text('Pagamentos'),
            )
          ],
        ),
      ),
      body: Center(
      child: Container(
          child: Text('Hello World'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings),
          label: 'Settings'),
      ]),
    );
  }
}
