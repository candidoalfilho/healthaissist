import 'package:flutter/cupertino.dart';
import 'package:healthassist/enums/especialidade_exame.dart';
import 'package:healthassist/enums/tipo_exame.dart';

class Exame {
  final String id;
  final DateTime date;
  final String medicoId;
  final String pacienteId;
  final Duration duracao;
  final TipoExame tipoExame;
  final EspecialidadeExame especialidadeExame;
  final String diagnostico;
  final bool realizado;

  Exame(
      this.id,
      this.date,
      this.medicoId,
      this.pacienteId,
      this.duracao,
      this.tipoExame,
      this.especialidadeExame,
      this.diagnostico,
      this.realizado);
}
