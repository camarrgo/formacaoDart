import 'dart:io';

//implementar o Timing!

class TimeQuestions {
  String hour = 'QUE HORAS SAO?';
  String day = 'QUE DIA E HOJE?';
  String year = 'EM QUE ANO ESTAMOS?';
  String totalDiasVividos = 'QUANTOS DIAS EU JA VIVI?';
  String question;
  DateTime date = DateTime.now();
  String perguntaBot = 'perguntaBOT:\n';
  bool isThisATimeQuestion = false;

  TimeQuestions(this.question);

  bool isThisTime() {
    //verificar se estamos numa pergunta sobre Tempo
    if (question.contains('HORAS') ||
        question.contains('DIA') ||
        question.contains('DIAS') ||
        question.contains('VIVI') ||
        question.contains('ANO')) {
      isThisATimeQuestion = true;
    }
    return isThisATimeQuestion;
  }

  int calculoDiasVividos() {
    String _botQuestion = perguntaBot +
        ' Se voce quer saber quantos dias voce ja viveu eu preciso saber quando voce nasceu\n'
            'Por Favor me informe nesta sequencia:\n'
            'Ano em que voce nasceu\n'
            'Mes em que voce nasceu\n'
            'Dia em que voce nasceu\n'
            'Por favor informe somente numeros:';
    print(_botQuestion);

    var repetir = true;
    int ano = 0, mes = 0, dia = 0;

    do {


      repetir = true;
      String anoMesDia = stdin.readLineSync().toString().toUpperCase();

      // Verifique o comprimento da string para determinar a forma de parsing


      if (anoMesDia.length == 8) {
        // Formato "yyyyMMdd"
        ano = int.parse(anoMesDia.substring(0, 4));
        mes = int.parse(anoMesDia.substring(4, 6));
        dia = int.parse(anoMesDia.substring(6, 8));

        //por favor eu sei que exite calculo ano bissexto e etc etc mas aqui ta bem basico
        if(mes > 13){
          repetir = false;
          print('Por favor o MES tem que ser menor ou igual a 12');
        }
        if(dia > 32){
          repetir = false;
          print('Por favor o DIA tem que ser menor ou igual a 31');
        }
      } else if (anoMesDia.length == 7) {
        // Formato "yyyyMdd" ou "yyyyMMd"
        ano = int.parse(anoMesDia.substring(0, 4));
        // Determine se o mês tem 1 ou 2 dígitos
        if (anoMesDia[4] == '1' || anoMesDia[4] == '0') {
          // Assume que o mês tem 2 dígitos
          mes = int.parse(anoMesDia.substring(4, 6));
          dia = int.parse(anoMesDia.substring(6, 7));
        } else {
          // Assume que o mês tem 1 dígito
          mes = int.parse(anoMesDia.substring(4, 5));
          dia = int.parse(anoMesDia.substring(5, 7));
        }
      } else if (anoMesDia.length == 7) {
        // Formato "yyyyMdd" (Mês e Dia com 1 dígito)
        ano = int.parse(anoMesDia.substring(0, 4));
        mes = int.parse(anoMesDia.substring(4, 5));
        dia = int.parse(anoMesDia.substring(5, 7));
      } else {
        print("Por favor insira novamente uma data de formato correta AnoMesDia");
        repetir = false;
      }
    } while (!repetir);

      DateTime dataDeNascimento = DateTime(ano, mes, dia);

      DateTime dataAtual = DateTime.now();

      Duration diferenca = dataAtual.difference(dataDeNascimento);
      int diasVividos = diferenca.inDays;
      return diasVividos;
  }

  timeQuestion() {
    if (question == hour) {
      String _botAnswer = perguntaBot +
          ' Opa! são : ${date.hour} horas e ${date.minute} minutos!';
      print(_botAnswer);
    } else if (question == day) {
      String _botAnswer = perguntaBot + ' Opa! hoje é dia : ${date.day}';
      print(_botAnswer);
    } else if (question == year) {
      String _botAnswer = perguntaBot + ' Opa! estamos em : ${date.year}';
      print(_botAnswer);
    } else if (question == totalDiasVividos) {
      String _botAnswer =
          perguntaBot + ' Voce ja viveu : ${calculoDiasVividos()} dias.';
      print(_botAnswer);
    } else {
      unsure();
    }
  }

  unsure() {
    if (question.contains('HORAS')) {
      String _botQuestion =
          perguntaBot + ' Não entendi, você quer saber das horas?';
      print(_botQuestion);
      String answer = stdin.readLineSync().toString().toUpperCase();
      if (answer.contains('SIM')) {
        String _botAnswer = perguntaBot +
            ' Beleza, são : ${date.hour} horas e ${date.minute} minutos!';
        print(_botAnswer);
      } else {
        String _botAnswer = perguntaBot + ' Ah, foi mal... entendi errado.';
        print(_botAnswer);
      }
    } else if (question.contains('DIA')) {
      String _botQuestion =
          perguntaBot + ' Não entendi, você quer saber que dia é hoje?';
      print(_botQuestion);
      String answer = stdin.readLineSync().toString().toUpperCase();
      if (answer.contains('SIM')) {
        String _botAnswer = perguntaBot + ' Beleza, hoje é dia: ${date.day}';
        print(_botAnswer);
      } else {
        String _botAnswer = perguntaBot + ' Ah, foi mal... entendi errado.';
        print(_botAnswer);
      }
    } else if (question.contains('QUANTOS') ||
        question.contains('DIAS') ||
        question.contains('VIVI')) {
      String _botQuestion = perguntaBot +
          ' Não entendi, você quer saber quantos DIAS voce viveu até hoje?';
      print(_botQuestion);
      String answer = stdin.readLineSync().toString().toUpperCase();
      if (answer.contains('SIM')) {
        String _botAnswer = perguntaBot +
            ' Beleza, até a data de hoje voce viveu: ${calculoDiasVividos()} dias.';
        print(_botAnswer);
      } else {
        String _botAnswer = perguntaBot + ' Ah, foi mal... entendi errado.';
        print(_botAnswer);
      }
    } else if (question.contains('ANO')) {
      String _botQuestion =
          perguntaBot + ' Não entendi, você quer saber em que ano estamos?';
      print(_botQuestion);
      String answer = stdin.readLineSync().toString().toUpperCase();
      if (answer.contains('SIM')) {
        String _botAnswer = perguntaBot +
            ' Beleza, estamos no ano de 2077, a pandemia já está terminando... \n '
                'Brincadeirinha! estamos em : ${date.year}';
        print(_botAnswer);
      } else {
        String _botAnswer = perguntaBot + ' Ah, foi mal... entendi errado.';
        print(_botAnswer);
      }
    }
  }
}
