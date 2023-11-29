import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthassist/providers/consultas.dart';
import 'package:provider/provider.dart';

class ConsultasFeitasScreen extends StatelessWidget {
  ConsultasFeitasScreen({super.key});

  Future<void> _refreshUser(BuildContext context) async {
    await Provider.of<Consultas>(context, listen: false).fetchAllConsultas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Consultas anteriores'),
      ),
      body: FutureBuilder(
        future: _refreshUser(context),
        builder: ((context, snapshot) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: (() => _refreshUser(context)),
                    child: Consumer<Consultas>(
                      builder: (context, consultaData, _) => Container(
                        child: Column(
                          children:
                              Provider.of<Consultas>(context, listen: false)
                                  .consultas
                                  .map((e) => Container(
                                        child: Text('dkasopdask'),
                                      ))
                                  .toList(),
                        ),
                      ),
                    ),
                  ),
          );
        }),
      ),
    );
  }
}
