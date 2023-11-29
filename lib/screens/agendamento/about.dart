import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutAgendamentoScreen extends StatelessWidget {
  AboutAgendamentoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ajuda'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
                'Nosso aplicativo foi projetado para tornar o agendamento de consultas uma tarefa simples e direta. Com apenas alguns toques, você pode encontrar profissionais de saúde, verificar disponibilidade e reservar seu horário conveniente.',
                textAlign: TextAlign.justify),
            Text(
              'Nossa plataforma prioriza a segurança e privacidade dos seus dados de saúde, garantindo uma experiência confiável.',
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
