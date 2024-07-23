
import 'dart:io';

import 'questions/good_manners.dart';
import 'questions/time_questions.dart';
import 'timing/BotCLock.dart';

void main() async {
  String kakoBot = 'perguntaBOT:\n';
  var loopRepete = true;
  String usuario = '';

  // var minhaStram = BotClock().perguntaBotStream(1,10);
  //
  // var subScriber = minhaStram.listen((event) {
  //   print('           perguntaBot esta ativdado por $event segundos.');
  // }, onDone: (){
  //   print('           perguntaBot esta finalizando sua atividade, faça sua ultima pergunta!.');
  //   loopRepete = false;
  // });

  print('-- Iniciando o perguntaBOT, aguarde..--');

  await BotClock().clock(2);

  print('perguntaBOT:\n Oi :) \n Como posso ajudar?');
  do {
    usuario = stdin.readLineSync().toString().toUpperCase();
    print('-- Processando pergunta, aguarde..--');
    await BotClock().clock(1);
    if (usuario.contains('XAU') ||
        usuario.contains('FLW') ||
        usuario.contains('ADEUS')) {
      loopRepete = false;
      print(kakoBot + ' Até a proxima!!');
    } else if (TimeQuestions(usuario).isThisTime()) {
      // verificar antes, assim não fazemos toda a função sem precisar.
      await BotClock().clock(2);
      TimeQuestions(usuario).timeQuestion();

    } else if (GoodManners(usuario).isThisManners()) {
      GoodManners(usuario).goodManners();
    } else if (GoodManners(usuario).isPerguntaMatematica()) {
      //Basta adicionar novas perguntas aqui!
      GoodManners(usuario).fazCalculo(usuario);
    } else {
      await BotClock().clock(2);
      print(kakoBot +
          ' Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      print(kakoBot + ' Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (loopRepete);

  print('--Encerrando perguntaBOT--');
}
