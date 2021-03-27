import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catapp/pages/cat.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/MM_background.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            title: Text('Magical Menagerie',
                style: TextStyle(
                  fontFamily: 'Tangerine',
                  fontSize: 50,
                  color: Colors.white,
                )),
            centerTitle: true,
            backgroundColor: Colors.brown[600],
          ),
          body: ListView(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 100.0, bottom: 100.0),
              decoration: new BoxDecoration(
                color: Colors.brown[300],
              ),
              padding: EdgeInsets.all(40.0),
              child: Text(
                  'Welcome to Magical Menagerie. Due to the certain C word that shall not be named, we are currently on shortage of owls and toads. However, our lucky selves have an abundance of felines. Select the button below to see who shall be accompanying you to Hogwarts this year!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontFamily: 'Tangerine',
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 120.0, right: 120.0, top: 0.0, bottom: 50.0),
              child: RaisedButton(
                onPressed: () {
                  Get.to(Cat());
                },
                color: Colors.brown[300],
                child: Text('find my cat now',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Tangerine',
                    )),
              ),
            ),
          ]))
    ]);
  }
}
