import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:healthassist/providers/doctors.dart';
import 'package:healthassist/widgets/medic_card.dart';
import 'package:provider/provider.dart';

class ResultadosScreen extends StatelessWidget {
  ResultadosScreen({super.key});

  Future<void> _refreshDoctors(BuildContext context) async {
    await Provider.of<Doctors>(context, listen: false).fetchAllDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Resultados'),
          backgroundColor: Colors.teal,
        ),
        body: FutureBuilder(
            future: _refreshDoctors(context),
            builder: ((context, snapshot) {
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: snapshot.connectionState == ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : RefreshIndicator(
                        onRefresh: (() => _refreshDoctors(context)),
                        child: Consumer<Doctors>(
                          builder: (context, doctorData, _) => Container(
                            padding: EdgeInsets.all(20.0),
                            child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Text(
                                      'Os profissionais recomendados para exame são:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    // ignore: unnecessary_null_comparison
                                    if (doctorData.doctors != null)
                                      ...doctorData.doctors
                                          .map(
                                            (e) => Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: MedicCard(
                                                  id: e.id,
                                                  nome: e.nome,
                                                  especialidade:
                                                      e.especialidade,
                                                  biografia: e.biography),
                                            ),
                                          )
                                          .toList(),
                                  ]),
                            ),
                          ),
                        ),
                      ),
              );
            })));
  }
}
