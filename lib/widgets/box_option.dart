import 'package:flutter/material.dart';
import 'package:healthassist/screens/agendamento/agendamento_screen.dart';

class BoxOption extends StatelessWidget {
  const BoxOption(
      {super.key, required this.icon, required this.title, required this.page});

  final IconData icon;
  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => page,
            transitionDuration: Duration(milliseconds: 200),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ),
        );
      },
      child: Container(
          margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
          padding: EdgeInsets.all(20),
          width: 200,
          decoration: BoxDecoration(
              color: Color.fromRGBO(185, 227, 255, 1),
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                title,
                style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0), fontSize: 17),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Icon(Icons.arrow_forward)
            ],
          )),
    );
  }
}
