import 'package:flutter/material.dart';

class ContagemPassosPage extends StatefulWidget {
  @override
  _ContagemPassosPageState createState() => _ContagemPassosPageState();
}

class _ContagemPassosPageState extends State<ContagemPassosPage> {
  int _passos = 0;

  void _incrementarPassos() {
    setState(() {
      _passos++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contagem de Passos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Passos dados:',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              '$_passos',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _incrementarPassos();
              },
              child: Text('Registrar Passo'),
            ),
          ],
        ),
      ),
    );
  }
}
