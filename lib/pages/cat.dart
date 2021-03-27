import 'package:flutter/material.dart';
import 'package:catapp/services/GetCat.dart';

class Cat extends StatefulWidget {
  @override
  _CatState createState() => _CatState();
}

class _CatState extends State<Cat> {
  String image;
  String message;
  bool isLoading = false;

  void setupCat() async {
    GetCat instance = GetCat();
    await instance.getCat();
    setState(() {
      image = instance.url;
      message = instance.text;
      isLoading = false;
    });
  }

  @override
  void initState() {
    isLoading = true;
    super.initState();
    setupCat();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SizedBox(
            child: LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
              backgroundColor: Colors.brown,
            ),
          )
        : Stack(
            children: [
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
                    backgroundColor: Colors.brown[600],
                    elevation: 0,
                    centerTitle: true,
                    title: Text('Magical Menagerie',
                        style: TextStyle(
                          fontFamily: 'Tangerine',
                          fontSize: 50,
                          color: Colors.white,
                        )),
                  ),
                  body: ListView(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 70.0, bottom: 0.0),
                        decoration: new BoxDecoration(
                          color: Colors.brown[300],
                        ),
                        child: Text('$message',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontFamily: 'Tangerine',
                            )),
                      ),
                      Center(
                        child: Image.network(
                          image,
                          width: 400.0,
                          height: 500.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ))
            ],
          );
  }
}
