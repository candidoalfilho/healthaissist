import 'package:flutter/material.dart';
import 'package:healthassist/providers/auth.dart';
import 'package:healthassist/providers/users.dart';
import 'package:provider/provider.dart';

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de perfil'),
      ),
      body: Container(
        child: Column(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  Future<void> _refreshUser(BuildContext context) async {
    await Provider.of<Users>(context, listen: false).fetchLoggedUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil'),
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
                      child: Consumer<Users>(
                          builder: (context, userData, _) => Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    _buildInfoTile('Idade', '23 anos'),
                                    _buildInfoTile('Sexo', 'M'),
                                    _buildInfoTile('Nome Completo',
                                        userData.loggedUser!.name),
                                    _buildInfoTile(
                                        'Email', userData.loggedUser!.email),
                                    _buildInfoTile('Tipo Sanguíneo', 'O-'),
                                    _buildInfoTile(
                                        'Convênio Médico', 'Bradesco'),
                                    _buildInfoTile('Exames Agendados', 'Não'),
                                    ElevatedButton(
                                        onPressed: () {
                                          Provider.of<Auth>(context,
                                                  listen: false)
                                              .logout();
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Logout'))
                                  ],
                                ),
                              )),
                    ));
        }),
      ),
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(value),
    );
  }
}
