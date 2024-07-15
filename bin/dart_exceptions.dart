import 'dart:math';

import 'controllers/bank_controller.dart';
import 'models/account.dart';

void main() {
  // Criando o banco
  print("Started Main");
  functionOne();
  print("Finish Main");
}

void functionOne() {
  print("Started F01");
  try {
    functionTwo();
  } catch (e,s) {
    print("nao da pra fazer esssa comnversao $e ");
    //s é StackTrace
    print("caso queira salvar em um log log: $s ");
    //rethrow; pra propagar de volta a execução para quem tiver abaixo da pilha de execucao
  } finally{
    print("finally executa ideepmndente de tudo, sempre vai executar");
  }


  print("Finish F02");
}

void functionTwo() {
  print("Started F02");
  for (int i = 0; i <= 5; i++) {
    print(i);

    double teste = double.parse("a");
  }
  print("Finish F02");
}
