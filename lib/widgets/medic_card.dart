import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:healthassist/screens/agendamento/medic_info_agendamento.dart';

class MedicCard extends StatelessWidget {
  MedicCard({
    super.key,
    required this.id,
    required this.nome,
    required this.especialidade,
    required this.biografia,
  });

  final String id;
  final String nome;
  final String especialidade;
  final String biografia;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => MedicInfoAgendamentoScreen(
              id: id,
              nome: nome,
              especialidade: especialidade,
              biografia: biografia,
            ),
            transitionDuration: Duration(milliseconds: 200),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 20,
          bottom: 20,
        ),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.medical_information_outlined,
              size: 30,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(child: Container()),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  nome,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Text(especialidade)
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_forward,
                ),
                Text('Agendar')
              ],
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}
