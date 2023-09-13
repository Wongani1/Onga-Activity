import 'package:flutter/material.dart';
import 'package:xyz/constants.dart';
import 'package:xyz/pages/edit/zuser.dart';
import 'package:xyz/pages/home/components/drawer.dart';
import 'package:xyz/pages/login/login_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(title: Text("Onga Activity Manager"), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            Constants.prefs.setBool("isLoggedIn", false);
            Navigator.pushReplacementNamed(context, LoginPage.routeName);
          },
        ),
        IconButton(
          icon: Icon(Icons.access_alarms),
          onPressed: () {
            Navigator.pushReplacementNamed(context, UserPage.routeName);
          },
        ),
      ]),
      body: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
            children: <Widget>[
              ProductBox(
                name: "iPhone",
                description: "iPhone is the stylist phone ever",
                price: 1000,
                // image: "Sleep.svg",
              ),
              ProductBox(
                name: "Pixel",
                description: "Pixel is the most featureful phone ever",
                price: 800,
                // image: "Study.svg",
              ),
              ProductBox(
                name: "Laptop",
                description: "Laptop is most productive development tool",
                price: 2000,
                // image: "Eating.svg",
              ),
              ProductBox(
                name: "Tablet",
                description:
                    "Tablet is the most useful device ever for meeting",
                price: 1500,
                // image: "Motivation.png",
              ),
              ProductBox(
                name: "Pendrive",
                description: "Pendrive is useful storage medium",
                price: 100,
                // image: "Dance.png",
              ),
              ProductBox(
                name: "Floppy Drive",
                description: "Floppy drive is useful rescue storage medium",
                price: 20,
                // image: "Exercise.png",
              ),
            ],
          );
        },
      ),
      drawer: TheDrawer(),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({Key key, this.name, this.description, this.price, this.image})
      : super(key: key);
  final String name;
  final String description;
  final int price;
  final String image;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              // Image.asset("assets/images/home/" + image),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.description),
                          Text("Price: " + this.price.toString()),
                        ],
                      )))
            ])));
  }
}
