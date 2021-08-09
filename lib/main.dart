import 'package:flare_flutter/flare.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color.fromRGBO(38, 50, 65, 1), body: LoginPage()));
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String pass = "meet";

  String animationType = "idle";

  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    passwordFocusNode.addListener((){
      if(passwordFocusNode.hasFocus){
        setState(() {
          animationType="test";
        });
      }else{
        setState(() {
          animationType="idle";
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            width: 200,
          )    ,
          Center(
            child: Container(
              height: 300,
              width: 300,
              child: CircleAvatar(
                child: ClipOval(child:new FlareActor("assets/teddy_test.flr",alignment: Alignment.center, fit: BoxFit.contain, animation: animationType,
                ),), backgroundColor: Colors.white
              ),
            ),

          ),
          SizedBox(
            height: 80,
            width: 10,
          )    ,
          Container(
            height: 140,
            width: 530,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email_id",
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
                Divider(),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    contentPadding: EdgeInsets.all(20),
                  ),
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                ),
              ],
            ),
          ),
        Container(
          height:70 ,
          width: 350,
          padding: EdgeInsets.only(top: 20),
          child: RaisedButton(
            color: Colors.pink,
            child: Text(
              "Login",style: TextStyle(
              color: Colors.white
            ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),

            onPressed: (){
              if(passwordController.text.compareTo(pass)==0){
               setState(() {
                animationType="success";
                  });
                  }
                else {
                  setState(() {
                    animationType = "fail";
                  });

              }

            },
          ),
        ),
        ],
      ),
    );
  }
}
