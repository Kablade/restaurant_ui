import 'package:flutter/material.dart';

class Customization extends StatefulWidget {
  const Customization({Key? key}) : super(key: key);

  @override
  State<Customization> createState() => _CustomizationState();
}

class _CustomizationState extends State<Customization> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant UI"),
      ),
      body: const Center(
          child: CircularProgressIndicator()
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
}
