import 'package:flutter/material.dart';
import 'package:healthassist/screens/agendamento/agendamento_hub_screen.dart';
import 'package:healthassist/widgets/card_option.dart';

class Contato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              CardOption(
                icon: Icons.book_outlined,
                title: 'Histórico de consultas',
                page: AgendamentoHubScreen(),
              ),
              CardOption(
                icon: Icons.phone_bluetooth_speaker,
                title: 'Agendar por telefone',
                page: AgendamentoHubScreen(),
              ),
              CardOption(
                icon: Icons.message,
                title: 'Central de atendimento do App',
                page: AgendamentoHubScreen(),
              ),
              CardOption(
                icon: Icons.local_hospital,
                title: 'Contato de hospitais',
                page: AgendamentoHubScreen(),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'TELEFONES',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              CardOption(
                icon: Icons.healing_sharp,
                title: 'Hospitais que atendem o convênio',
                page: AgendamentoHubScreen(),
              ),
              CardOption(
                icon: Icons.health_and_safety_sharp,
                title: 'SUS',
                page: AgendamentoHubScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
