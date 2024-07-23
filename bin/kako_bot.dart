
import 'dart:io';

import 'questions/time_questions.dart';

void main() async {
  String kakoBot = 'perguntaBOT:\n';
  var a = true;
  String usuario = '';

  print('-- Iniciando o perguntaBOT, aguarde..--');

  print('perguntaBOT:\n Oi :) \n Como posso ajudar?');
  do {
    usuario = stdin.readLineSync().toString().toUpperCase();
    print('-- Processando pergunta, aguarde..--');
    if (usuario.contains('XAU') ||
        usuario.contains('FLW') ||
        usuario.contains('ADEUS')) {
      a = false;
      print(kakoBot + ' Até a proxima!!');
    } else if (TimeQuestions(usuario).isThisTime()) {
      // verificar antes, assim não fazemos toda a função sem precisar.
      TimeQuestions(usuario).timeQuestion();
    } else if (false) {
      //Basta adicionar novas perguntas aqui!
    } else {
      print(kakoBot +
          ' Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      print(kakoBot + ' Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (a);

  print('--Encerrando perguntaBOT--');
}
