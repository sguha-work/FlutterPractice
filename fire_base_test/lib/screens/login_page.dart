import 'package:flutter/material.dart';
import 'home_page.dart';
import 'signup_page.dart';
import '../widgets/dialog.dart';
import '../utilities/login_signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _login() async{
    String email = emailController.text;
    String password = passwordController.text;
    //MyDialog.showAlertDialog(context, email);
    String result = await LoginSignup.login(email, password);
    MyDialog.showAlertDialog(context, result);
    if(result.contains('success__')) {
      String uid = result.split('success__').last;
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage(uid: uid)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.network(
                        'https://logowik.com/content/uploads/images/flutter5786.jpg')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            FlatButton(
              onPressed: () {
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: RichText(
                  text: const TextSpan(
                text: 'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              )),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  //Navigator.push(
                  //context, MaterialPageRoute(builder: (_) => HomePage()));
                  _login();
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            Container(
                child: FlatButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SignupPage()));
              },
              child: RichText(
                  text: const TextSpan(
                text: 'Create account',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              )),
            )),
            const SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}
