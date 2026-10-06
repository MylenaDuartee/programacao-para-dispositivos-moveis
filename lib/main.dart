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
      routes: {
        '/settings': (context) => const SecondRoute(),
        '/abastecer': (context) => AbastecerRoute(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({super.key, required this.title})
      : items = [
        ];

  final String title;
  final List<Item> items;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

  
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController controller = TextEditingController();
    double resultado = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: Text('Lista de estudos'),
        actions: <Widget>[
          Icon(Icons.book),
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
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, 
          builder: (context) {
            return AlertDialog(
              title: Text('Nova tarefa'),
              content: TextField(
                controller: controller,
              ),
              actions: [
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancelar'),
                ),
                TextButton(
                  onPressed: (){
                    final nome = controller.text.trim();

                    if (nome.isNotEmpty) {
                      setState(() {
                        widget.items.add(
                          Item(
                            nome: nome,
                            chek: false,
                          ),
                        );
                      });

                      controller.clear();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Adicionar'),
                ),
              ],
            );
          },);
        },
        child: Icon(Icons.library_add),
       ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.local_gas_station),
          label: 'Abastecer'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),
          label: 'Settings'),
        ],
        onTap: (index){
          if(index == 1) {
            Navigator.pushNamed(context, '/abastecer');
          }
          if(index == 2){
            Navigator.pushNamed(context, '/settings');          
          }
        },
        ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Voltar'),
        ),
      ),
    );
  }
}

class AbastecerRoute extends StatefulWidget {
  const AbastecerRoute({super.key});

  @override
  State<AbastecerRoute> createState() => _AbastecerRouteState();
}

class _AbastecerRouteState extends State<AbastecerRoute> {
  String resultadoText = '';
  final TextEditingController _textEditeControllerGasolina =
      TextEditingController();

  final TextEditingController _textEditeControllerAlcool =
      TextEditingController();

  void resulta(double gasolina, double alcool) {
    double resultado = alcool / gasolina * 100;
    setState(() {
      if (resultado <= 70) {
        resultadoText = 'Abasteça com álcool';
      } else {
        resultadoText = 'Abasteça com gasolina';
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: const Text('Gasolina x Álcool'),
      ),
      body: Center(
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child:Column(
                children: [
                  Text('Gasolina x Álcool',
                    style: TextStyle(
                      fontSize:20,
                    ),
                  ),
                  SizedBox(height: 15),
                  Image.network(
                    'https://www.c-store.com.au/wp-content/uploads/2018/09/iStock-504743184.jpg?w=1024',

                  ),
                  SizedBox(height: 15),
                  TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border:  OutlineInputBorder(),
                    labelText: 'Valor gasolina',
                    ),
                  controller: _textEditeControllerGasolina,
                ),
                SizedBox(height: 15),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border:  OutlineInputBorder(),
                    labelText: 'Valor álcool',
                    ),
                  controller: _textEditeControllerAlcool,
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    double gasolina = double.parse(_textEditeControllerGasolina.text);

                    double alcool = double.parse(_textEditeControllerAlcool.text);

                    resulta(gasolina,alcool);
                  },


                  child: Text('Calcular'),
                ),
                SizedBox(height: 15),
                Text(resultadoText),

                ],
              )
              
            )
          ],
        )
        )
      ),
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
