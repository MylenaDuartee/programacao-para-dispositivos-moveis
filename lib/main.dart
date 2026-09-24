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
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink.shade100),
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({super.key, required this.title})
      : items = [
          Item(nome: "Arroz", chek: true),
          Item(nome: "Feijão", chek: true),
          Item(nome: "Carne", chek: true),
        ];

  final String title;
  final List<Item> items;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: Text('Home'),
        actions: <Widget>[
          Icon(Icons.local_grocery_store),
        ],
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
      body: ListView.builder(
       itemCount: widget.items.length,
       itemBuilder: (BuildContext context,int index) {
        final item = widget.items[index];
        return CheckboxListTile(
           title: Text(item.nome),
           key: Key(item.nome),
           value: item.chek,
           onChanged: (value) {
            setState(() {
              item.chek = value!;
            });
           },
          );
       }),
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

class Item {
  String nome;
  bool chek;

  Item({
    required this.nome,
    required this.chek
    });
}
