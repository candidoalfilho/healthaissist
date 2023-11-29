import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:healthassist/screens/agendamento/resultados_screen.dart';

class SintomasPage extends StatefulWidget {
  SintomasPage({super.key});

  @override
  State<SintomasPage> createState() => _SintomasPageState();
}

class _SintomasPageState extends State<SintomasPage> {
  TextEditingController textController = TextEditingController();

  String selectedCuidado = 'Atenção primária';

  final List<String> cuidadosOptions = [
    'Atenção primária',
    'Cuidado com especialista',
    'Cuidados de saúde aliados',
    'Atendimento de urgência',
    'Atendimento de emergência',
    'Não tenho certeza'
  ];

  final Map<String, bool> sintomas = {
    'Vômito': false,
    'Dor na barriga': false,
    'Apetite diminuindo': false,
    'Fadiga': false,
    'Dor de cabeça': false,
    'Diarreia': false,
    'Tontura': false,
    'Febre': false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sintomática e cuidados'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Descreva seus sintomas',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: textController,
                  maxLines:
                      null, // Set to null for an unlimited number of lines.
                  minLines: 5, // Set the minimum number of lines.
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: 'Descrição detalhada dos sintomas',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Que tipo de cuidado está planejando obter?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ...cuidadosOptions.map(
                  (e) => RadioListTile(
                    title: Text(e),
                    value: e,
                    groupValue: selectedCuidado,
                    onChanged: (value) {
                      setState(() {
                        selectedCuidado = e;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Você tem algum dos seguintes sintomas?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 200,
                  height: 450,
                  child: ListView.builder(
                      itemCount: sintomas.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          title: Text(sintomas.keys.toList()[index]),
                          value: sintomas[sintomas.keys.toList()[index]],
                          onChanged: (bool? value) {
                            setState(() {
                              sintomas[sintomas.keys.toList()[index]] = value!;
                            });
                          },
                        );
                      }),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => ResultadosScreen(),
                          transitionDuration: Duration(milliseconds: 200),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },
                    child: Text('Resultados'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.teal))),
              ]),
        ),
      ),
    );
  }
}
