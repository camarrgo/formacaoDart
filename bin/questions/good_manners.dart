
class GoodManners{
  String questions;
  bool boaManeiras = false;
  bool perguntaMatematica = false;
  String perguntaBot = "perguntaBot:\n";


  GoodManners(this.questions);

  bool isThisManners(){
    if(questions.contains('OI') || questions.contains('OLA') ||
    questions.contains('BOM DIA') || questions.contains('BOA TARDE') ||
    questions.contains('BOA NOITE') || questions.contains('OBRIGADO')
    ){
      boaManeiras = true;
    }
    return boaManeiras;
  }

  bool isPerguntaMatematica(){
    if(questions.contains('QUANTO É') || questions.contains('QUANTO DA') ||questions.contains('QUANTO') ||
    questions.contains('CALCULE') || questions.contains('CALCULA PRA MIM')
    ){
      perguntaMatematica = true;
    }
    return perguntaMatematica;
  }

  goodManners(){
    if(questions.contains("BOM DIA")){
      print(perguntaBot+'Bom dia!!');
    }else if(questions.contains("BOA TARDE")){
      print(perguntaBot+'Boa Tarde!!');
    }else if(questions.contains("BOA NOITE")){
      print(perguntaBot+'Boa noite!!');
    }else if(questions.contains("OI") || questions.contains("OLA")){
      print(perguntaBot+'Ola!!');
    }else if(questions.contains("OBRIGADO") || questions.contains("OBG")){
      print(perguntaBot+' De nada, fique a vontade para mais perguntas.');
    }
  }

  fazCalculo(String question){
    RegExp exp = RegExp(r'(\d+)\s*([\+\-\*\/])\s*(\d+)');
    Match? match = exp.firstMatch(question);

    if (match != null) {
      int num1 = int.parse(match.group(1)!);
      String operator = match.group(2)!;
      int num2 = int.parse(match.group(3)!);

      // Calcular o resultado baseado no operador
      int result;
      switch (operator) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          result = num1 ~/ num2; // Use ~/ para divisão inteira
          break;
        default:
          throw FormatException('Operador desconhecido: $operator');
      }

      print('O total é: $result');
    } else {
      print('Nenhuma operação encontrada na string.');
    }
  }


}

