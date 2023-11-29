import 'package:flutter/material.dart';
import 'criar_conta.dart';
import 'login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginCreateAccountPage(),
    );
  }
}

class LoginCreateAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HealthUp'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
        Center(
        child: Text(
          'Welcome to HealthUp',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        ),
            ElevatedButton(
            onPressed: () { Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CriarConta()),
      );
      },
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onPrimary: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text('Criar Conta'),
      ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () { Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
    },
    style: ElevatedButton.styleFrom(
    primary: Colors.blue,
    onPrimary: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
    ),
    ),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
