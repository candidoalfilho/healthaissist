import 'package:flutter/material.dart';
import 'package:healthassist/models/consultas.dart';
import 'package:healthassist/providers/auth.dart';
import 'package:healthassist/providers/consultas.dart';
import 'package:healthassist/screens/agendamento/sintoma_page.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AgendamentoExamePage extends StatefulWidget {
  @override
  _AgendamentoExamePageState createState() => _AgendamentoExamePageState();
}

class _AgendamentoExamePageState extends State<AgendamentoExamePage> {
  String? selectedMedicalArea;
  List<DateTime> selectedDates = [];
  String? selectedCity;
  String? selectedHospital;
  String? userEmail;
  String selectedSex = 'Masculino';
  String selectedWeight = 'Sim';
  String selectedHipertensao = 'Sim';
  String selectedCigarro = 'Sim';
  String selectedLesao = 'Sim';

  TextEditingController ageController = TextEditingController();

  final List<String> sexOptions = [
    'Masculino',
    'Feminino',
  ];

  final List<String> weightOptions = [
    'Sim',
    'Não',
    'Não sei',
  ];

  final List<String> medicalAreas = [
    'Pediatria',
    'Pneumologia',
    'Urologia',
    'Dermatologia',
    'Oftalmologia',
    // Adicione mais áreas médicas aqui, se necessário
  ];

  final List<String> saoPauloCities = [
    'São Paulo',
    'Guarulhos',
    'Campinas',
    'São Bernardo do Campo',
    // Adicione mais cidades de São Paulo aqui
  ];

  final Map<String, List<String>> citiesAndHospitals = {
    'São Paulo': [
      'Einstein',
      'Sírio Libanês',
      'Oswaldo Cruz',
      'Hospital das Clínicas',
      // Adicione mais hospitais disponíveis em São Paulo aqui
    ],
    'Guarulhos': [
      'Einstein',
      'Sírio Libanês',
      'Oswaldo Cruz',
      'Hospital das Clínicas',
      // Adicione mais hospitais disponíveis em São Paulo aqui
    ],
    'Campinas': [
      'Einstein',
      'Sírio Libanês',
      'Oswaldo Cruz',
      'Hospital das Clínicas',
      // Adicione mais hospitais disponíveis em São Paulo aqui
    ],
    'São Bernardo do Campo': [
      'Einstein',
      'Sírio Libanês',
      'Oswaldo Cruz',
      'Hospital das Clínicas',
      // Adicione mais hospitais disponíveis em São Paulo aqui
    ],
    // Adicione outras cidades e seus hospitais correspondentes aqui
  };

  void _confirmAppointment() {
    if (selectedMedicalArea == null ||
        selectedDates.isEmpty ||
        selectedHospital == null ||
        selectedCity == null) {
      // Mostrar um alerta se algum campo estiver vazio
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Campos Obrigatórios'),
            content: Text(
                'Por favor, preencha todos os campos antes de confirmar a consulta.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    var nova_consulta = Consulta(
        Provider.of<Auth>(context, listen: false).userId!,
        selectedMedicalArea!,
        selectedCity!,
        selectedDates[0].toString());
    Provider.of<Consultas>(context, listen: false)
        .createConsulta(nova_consulta);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Consulta Confirmada!'),
          content: Text(
            'Sua consulta de $selectedMedicalArea foi agendada para ${selectedDates.map((date) => DateFormat.yMEd().format(date)).join(', ')} no $selectedHospital em $selectedCity.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  selectedMedicalArea = null;
                  selectedDates.clear();
                  selectedCity = null;
                  selectedHospital = null;
                  userEmail = null;
                });
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null) {
      setState(() {
        selectedDates.add(picked);
        if (selectedCity != null) {
          selectedHospital = null;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Descrição física'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Qual o seu sexo?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 50,
                child: DropdownButton<String>(
                  value: selectedSex,
                  items: sexOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedSex = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Qual a sua idade?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Digite sua idade'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Estou acima do peso ou obeso(a):',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ...weightOptions.map(
                (e) => RadioListTile(
                  title: Text(e),
                  value: e,
                  groupValue: selectedWeight,
                  onChanged: (value) {
                    setState(() {
                      selectedWeight = e;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Eu tenho hipertensão:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ...weightOptions.map(
                (e) => RadioListTile(
                  title: Text(e),
                  value: e,
                  groupValue: selectedHipertensao,
                  onChanged: (value) {
                    setState(() {
                      selectedHipertensao = e;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Eu fumei cigarro por pelo menos 10 anos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ...weightOptions.map(
                (e) => RadioListTile(
                  title: Text(e),
                  value: e,
                  groupValue: selectedCigarro,
                  onChanged: (value) {
                    setState(() {
                      selectedCigarro = e;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Eu sofri uma lesão recentemente',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ...weightOptions.map(
                (e) => RadioListTile(
                  title: Text(e),
                  value: e,
                  groupValue: selectedLesao,
                  onChanged: (value) {
                    setState(() {
                      selectedLesao = e;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => SintomasPage(),
                        transitionDuration: Duration(milliseconds: 200),
                        transitionsBuilder: (_, a, __, c) =>
                            FadeTransition(opacity: a, child: c),
                      ),
                    );
                  },
                  child: Text('Avançar'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal))),
            ],
          ),
        ),
      ),
    );
  }
}
