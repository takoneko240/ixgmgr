import 'package:first_flutter/mypage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IX/IXG Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TopPage(title: "IX/IXG Manage System"),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/second':
            return PageTransition(
              child: MyPage(title: 'My Page'),
              type: PageTransitionType.fade,
              settings: settings,
              duration: Duration(milliseconds: 200),
              reverseDuration: Duration(milliseconds: 200),
            );
            break;
          default:
            return null;
        }
      },
    );
  }
}

class TopPage extends StatefulWidget {
  TopPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: new AssetImage("images/background.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                    top: 100, left: 40, right: 40, bottom: 40),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment:  Alignment.topCenter,
                      image: new AssetImage("images/mv_logo.png"),
                      fit: BoxFit.fitWidth),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                        offset: Offset(10, 10))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(labelText: 'id'),
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'password'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(20.0)),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "/second");
                        },
                        child: Text(
                          "Login",
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(20.0)),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return SimpleDialog(
                                title: Text("Signup"),
                                children: <Widget>[
                                  Container(
                                    width: 600,
                                    child:
                                        // コンテンツ領域
                                        SimpleDialogOption(
                                      //onPressed: () => Navigator.pop(context),
                                      child: Form(
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  labelText: 'id'),
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  labelText: 'password'),
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  labelText: 'password(Retry)'),
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  labelText: 'email'),
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  labelText: 'email(Retry)'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          "Signup",
                        ),
                      ),
                    ),
                  ],
                ),
                width: 500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
