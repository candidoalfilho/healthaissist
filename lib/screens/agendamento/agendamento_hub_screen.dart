import 'package:flutter/material.dart';
import 'package:healthassist/screens/agendamento/about.dart';
import 'package:healthassist/screens/agendamento/agendamento_screen.dart';
import 'package:healthassist/screens/agendamento/consultas_anteriores.dart';
import 'package:healthassist/widgets/card_option.dart';
import 'package:intl/intl.dart';

class AgendamentoHubScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Exames'),
          backgroundColor: Colors.teal,
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardOption(
                  icon: Icons.monitor_heart_outlined,
                  title: 'Por sintomas',
                  page: AgendamentoExamePage()),
              CardOption(
                  icon: Icons.school_outlined,
                  title: 'Por especialidade',
                  page: ConsultasFeitasScreen()),
              CardOption(
                  icon: Icons.live_help_outlined,
                  title: 'Ajuda',
                  page: AboutAgendamentoScreen())
            ],
          ),
        ));
  }
}
