import 'package:flutter/material.dart';
import 'package:xyz/pages/login/login_page.dart';

class GreetPage extends StatefulWidget {
  static const String routeName = "/greet";
  @override
  _GreetPageState createState() => _GreetPageState();
}

class _GreetPageState extends State<GreetPage> {
  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 105.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return LoginPage();
          }));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Manage',
          style: TextStyle(
            color: Color(0xFF000000),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          "assets/images/fixeds.jpg",
          fit: BoxFit.cover,
          color: Colors.black.withOpacity(0.7),
          colorBlendMode: BlendMode.darken,
        ),
        // ListView.builder(itemBuilder: (context, index){
        //   return Constant(item: items[index]);
        // }),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Form(
                child: Center(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Welcome',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'To',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Onga ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                    fontSize: 30.0,
                                    color: Colors.red,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Act',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                    fontSize: 30.0,
                                    color: Colors.yellow[100],
                                  ),
                                ),
                                TextSpan(
                                  text: 'i',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                    fontSize: 30.0,
                                    color: Colors.yellow,
                                  ),
                                ),
                                TextSpan(
                                  text: 'v',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                    fontSize: 30.0,
                                    color: Colors.blue,
                                  ),
                                ),
                                TextSpan(
                                  text: 'i',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                    fontSize: 30.0,
                                    color: Colors.yellow[400],
                                  ),
                                ),
                                TextSpan(
                                  text: 't',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                    fontSize: 30.0,
                                    color: Colors.yellow[800],
                                  ),
                                ),
                                TextSpan(
                                  text: 'y',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                    fontSize: 30.0,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Manager',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // RaisedButton(
                          //   onPressed: () {
                          //     // Constants.item.setBool("isLoggedIn", true);
                          //     Navigator.pushReplacementNamed(
                          //         context, LoginPage.routeName);
                          //   },
                          //   child: Text("Log In"),
                          //   color: Colors.black,
                          //   textColor: Colors.white,
                          // )
                          _buildLoginBtn(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
