import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MenuPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
      },
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  List<dynamic> courses = [];

  Future<void> getAllMenu() async {
    final String response = await rootBundle.loadString('assets/menu.json');
    final data = await json.decode(response);
    setState(() {
      courses = data["meals"];
    });
  }

  @override
  void initState() {
    getAllMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant UI"),
      ),
      body: Center(
        child: courses != [] ? createMenu() : const CircularProgressIndicator()
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 65.0,
        width: 65.0,
        child: FittedBox(
          child: FloatingActionButton(
            tooltip: "Panier",
            onPressed: () {},
            child: const Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
            // elevation: 5.0,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 75,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                padding: const EdgeInsets.only(left: 28.0),
                icon: const Icon(Icons.home),
                onPressed: () {
                  setState(() {

                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: const EdgeInsets.only(right: 28.0),
                icon: const Icon(Icons.search),
                onPressed: () {
                  setState(() {

                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: const EdgeInsets.only(left: 28.0),
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {
                  setState(() {

                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: const EdgeInsets.only(right: 28.0),
                icon: const Icon(Icons.list),
                onPressed: () {
                  setState(() {

                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }



  Widget createMenu(){
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20
        ),
        itemCount: courses.length,
        itemBuilder: (BuildContext ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(
                    20
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.shade100,
                    blurRadius: 0.1,
                    offset: const Offset(0, 6), // Shadow position
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    alignment: Alignment.topRight,
                    child: Text(courses[index]["price"].toString().replaceAll(
                        '.', '€')),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    child: Image.network(courses[index]["image"]),
                  ),
                  Container(
                      padding: const EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(courses[index]["name"].toString())
                  ),
                ],
              ),
            ),
          );
        });
  }
}
