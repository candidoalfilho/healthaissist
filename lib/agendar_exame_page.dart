import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AgendarExamePage extends StatefulWidget {
  @override
  _AgendarExamePageState createState() => _AgendarExamePageState();
}

class _AgendarExamePageState extends State<AgendarExamePage> {
  String? selectedMedicalArea;
  List<DateTime> selectedDates = [];
  String? selectedCity;
  String? selectedHospital;
  String? userEmail;

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

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Consulta Confirmada!'),
          content: Text(
            'Sua consulta de $selectedMedicalArea foi agendada para ${selectedDates.map((date) => DateFormat.yMd().format(date)).join(', ')} no $selectedHospital em $selectedCity.',
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
        title: Text('Agendamento de Consulta'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Selecione a área médica:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Divider(
              thickness: 2,
              color: Colors.black,
            ),
            DropdownButton<String>(
              value: selectedMedicalArea,
              items: medicalAreas.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedMedicalArea = newValue;
                  selectedDates.clear();
                  selectedCity = null;
                  selectedHospital = null;
                });
              },
              hint: Text('Selecione a área médica'),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedCity,
              items: saoPauloCities.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCity = newValue;
                  selectedHospital =
                      null; // Limpar o hospital ao selecionar uma nova cidade
                });
              },
              hint: Text('Selecione a cidade em São Paulo'),
            ),
            SizedBox(height: 20),
            if (selectedDates.isNotEmpty)
              DropdownButton<String>(
                value: selectedHospital,
                items: citiesAndHospitals[selectedCity ?? '']
                        ?.map((String hospital) {
                      return DropdownMenuItem<String>(
                        value: hospital,
                        child: Text(hospital),
                      );
                    }).toList() ??
                    [],
                onChanged: (String? newValue) {
                  setState(() {
                    selectedHospital = newValue;
                  });
                },
                hint: Text('Selecione o hospital'),
              ),
            SizedBox(height: 20),
            if (selectedMedicalArea != null &&
                selectedDates.isNotEmpty &&
                selectedHospital != null &&
                selectedCity != null)
              ElevatedButton(
                onPressed: () {
                  _confirmAppointment();
                },
                child: Text('Confirmar Consulta'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Text('Selecionar Data da Consulta'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
