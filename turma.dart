import 'dart:io';

import '../Aluno/aluno.dart';
import '../Notas/nota.dart';

class Turma {
  final List<Aluno> _alunos = [];

  criarAluno() {
    stdout.write('Nome do aluno: ');
    String nome = stdin.readLineSync()!;

    _alunos.add(Aluno(nome));

    print('Aluno cadastrado! (índice ${_alunos.length - 1})');



        {
          if (_alunos.isEmpty) {
            print('Nenhum aluno cadastrado.');
          

          }

          for (int i = 0; i < _alunos.length; i++) {
            print('$i - ${_alunos[i].nome}');
          }

          stdout.write('Escolha índice do aluno: ');
          int indice = int.parse(stdin.readLineSync()!);

          print('Tipo de nota:');
          print('1 - Prova');
          print('2 - Trabalho');

          stdout.write('> ');
          int tipo = int.parse(stdin.readLineSync()!);

          stdout.write('Valor: ');
          double valor = double.parse(stdin.readLineSync()!);

          stdout.write('Descrição: ');
          String descricao = stdin.readLineSync()!;

          if (tipo == '1') {
            NotaProva nota = NotaProva(valor, descricao);

            _alunos[indice].notas.add(nota);
          }

          if (tipo == 2) {
            NotaTrabalho nota = NotaTrabalho(valor, descricao);

            _alunos[indice].notas.add(nota);
          }


          print('Nota lançada para ${_alunos[indice].nome}.');
          break;

          
        }

        for (int i = 0; i < _alunos.length; i++) {
          print('$i - ${_alunos[i].nome}');
        }

        stdout.write('Escolha índice do aluno: ');
        int indice = int.parse(stdin.readLineSync()!);

        Aluno aluno = _alunos[indice];

        print('\nAluno: ${aluno.nome}');

        for (var nota in _alunos.notas) {
          String tipo = nota.peso == 2 ? 'Prova' : 'Trabalho';
          print('$tipo: ${nota.valor} (peso ${nota.peso})');
        }

        print('Média ponderada: ${_alunos.calcularMedia().toStringAsFixed(2)}');
        break;

      case '0':
        print('Encerrando. Até logo!');
        return;

      default:
        print('Opção inválida!');
    }
  }
}
