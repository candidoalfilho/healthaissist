import 'package:flutter/material.dart';
import 'package:healthassist/contagem_passos.dart';
import 'package:healthassist/contato.dart';
import 'package:healthassist/screens/agendamento/agendamento_hub_screen.dart';
import 'package:healthassist/screens/agendamento/agendamento_screen.dart';
import 'package:healthassist/screens/historico_consultas.dart';
import 'package:healthassist/screens/login_screen.dart';
import 'package:healthassist/screens/perfil.dart';
import 'package:healthassist/widgets/box_option.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 0,
        toolbarHeight: 60,
        title: Center(
          child: Text(
            'HealthAIssist',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          color: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(21)),
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => AgendamentoHubScreen(),
                          transitionDuration: Duration(milliseconds: 200),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },
                    iconSize: 27.0,
                    icon: const Icon(
                      Icons.playlist_add_circle_outlined,
                      color: Color.fromRGBO(3, 154, 255, 1),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //     Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => ContagemPassosPage()),
                      // );
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) =>
                              HistoricoConsultasScreen(),
                          transitionDuration: Duration(milliseconds: 200),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },
                    iconSize: 27.0,
                    icon: const Icon(
                      Icons.history,
                      color: Color.fromRGBO(3, 154, 255, 1),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => Contato(),
                          transitionDuration: Duration(milliseconds: 200),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },
                    iconSize: 27.0,
                    icon: const Icon(
                      Icons.phone,
                      color: Color.fromRGBO(3, 154, 255, 1),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => ProfilePage(),
                          transitionDuration: Duration(milliseconds: 200),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },
                    iconSize: 27.0,
                    icon: const Icon(
                      Icons.person,
                      color: Color.fromRGBO(3, 154, 255, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 400,
                child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 16),
                    children: [
                      BoxOption(
                          icon: Icons.document_scanner,
                          title: 'Exame',
                          page: AgendamentoExamePage()),
                      BoxOption(
                          icon: Icons.add_chart_rounded,
                          title: 'Estatística',
                          page: ContagemPassosPage()),
                      BoxOption(
                        icon: Icons.contact_mail,
                        title: 'Contato',
                        page: Contato(),
                      ),
                      BoxOption(
                          icon: Icons.person,
                          title: 'Perfil',
                          page: ProfilePage()),
                    ]),
              ),

              // ElevatedButton(
              //   onPressed: () {
              //     // Navigate to AgendarExamePage
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => AgendarExamePage()),
              //     );
              //   },
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.blue,
              //     onPrimary: Colors.white,
              //     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //   ),
              //   child: Text('Agendar Exame'),
              // ),
              // SizedBox(height: 10), // Espaçamento entre os botões

              // ElevatedButton(
              //   onPressed: () {
              //     // Navigate to the ContagemPassosPage
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => ContagemPassosPage()),
              //     );
              //   },
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.blue,
              //     onPrimary: Colors.white,
              //     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //   ),
              //   child: Text('Contagem de Passos'),
              // ),
              // SizedBox(height: 10), // Espaçamento entre os botões

              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) =>
              //               Contato()), // 'Contato' com a primeira letra em maiúscula
              //     );
              //   },
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.blue,
              //     onPrimary: Colors.white,
              //     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //   ),
              //   child: Text('Contato'),
              // ),
              // SizedBox(height: 10), // Espaçamento entre os botões

              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => Perfil()), //
              //     );
              //     // Navigate to the page of Perfil
              //   },
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.blue,
              //     onPrimary: Colors.white,
              //     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //   ),
              //   child: Text('Perfil'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
