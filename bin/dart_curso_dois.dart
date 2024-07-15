import 'dart:io';

const String version = '0.0.1';

void main() {
  String nome = "Laranja";
  double peso = 100.2;
  String cor = "Verde";
  int diasCOlheita = 10;
  String sabor = "azeda";
  bool isMadura = funcEstaMaduro(diasCOlheita);

  funcEstaMaduro(diasCOlheita);

  print(isMadura);
  print(funcEstaMaduro(25));
  print(funcEstaMaduro(600));

  print(
      "======================== // ======================= // =====================");

  mostrarMaduraPosicionalObrigatoria("Uva", 45);

  nomeadoOpcionais(dias: 20);

  nomeadoOpcionaisPodeNullSafety();

  nomeadoOpcionaisPodeNullSafety(nome: "Morango sem info de dias");

  // required opcional é legal pois vc sabe qual argumento tem que passar em qual parametro e tanto faz a ordem
  nomeadoOpcionaisRequeridos(dias: 50, nome: "Goiaba");

  print(
      "======================== // ======================= // =====================");
  print("Insira o valor dos dias? ");
  //String? input = stdin.readLineSync();
  String? input = "45";

  if (input != null && !input.isEmpty) {
    int dias = int.parse(input);
    String resultado = funcCalculoFruta(dias, "abacate");
    print("Resultado do calculo= $resultado");
  }

  Fruta laranjaAtributoLaEmCima = Fruta(nome, peso, cor, sabor, diasCOlheita);
  Fruta uva = Fruta("uva", 50.5, "roxa", "doce", 35);

  String resultadoPesquisa = funcCalculoFruta(uva.diasDesdeColheita, uva.nome);
  print("Resultado pesquisa= $resultadoPesquisa");
  print(uva);

  Legumes mandioca1 = Legumes('Macaxeira', 1200, "marrom", true);
  Fruta banana1 = Fruta("Banana", 75, "Amarelo", "doce", 12);
  Nozes macadamia1 =
      Nozes("macadamia", 2, "Branco amarelado", 20, "doce", 33.3);
  Citricas limao1 = Citricas("Limao", 100, "verde", 5, "Azedo", 9);

  Fruta abacate1 = Fruta('Abacate', 250, 'Verde', 'Doce', 10);

  Nozes castanhaCaju1 =
      Nozes('Castanha de Caju', 4, 'Branco e Marrom', 15, 'Doce', 25);

  Citricas maracuja1 = Citricas('Maracujá', 120, 'Amarelo', 6, 'Azedo', 10);

  castanhaCaju1.printAlimento();

  abacate1.fazerSuco();

  mandioca1.printAlimento();
  banana1.printAlimento();
  print("O SABOR DA BANANA É ${banana1.sabor} BOA NE!");
  macadamia1.printAlimento();
  limao1.printAlimento();

  banana1.separarIngredientes();

  mandioca1.cozinhar();

  limao1.fazerSuco();

  macadamia1.fazerMassa();


  print(
      "======================== // ======================= // =====================");


  limao1.escolhaIngrediente();
  limao1.extrairSucoIngrediente();
  limao1.extrairAromaSuco();
  limao1.inseraBorrifador();
  limao1.usarPerfume();

}

class Fruta extends Alimento implements Bolo, Perfume{
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Fruta(
      String nome, double peso, String cor, this.sabor, this.diasDesdeColheita,
      {this.isMadura})
      : super(nome, peso, cor);

  void fazerSuco() {
    print('voce fez um otimo suco de $nome');
  }

  @override
  void assar() {
    // TODO: implement assar
    print('colocar no forno');
  }

  @override
  void fazerMassa() {
    // TODO: implement fazerMassa
    print('Misturar a fruta com farinha');
  }

  @override
  void separarIngredientes() {
    // TODO: implement separarIngredientes
    print("catar a fruta $nome");
  }

  @override
  void escolhaIngrediente() {
    // TODO: implement escolhaIngrediente
  }

  @override
  void extrairAromaSuco() {
    // TODO: implement extrairAromaSuco
    print('Extraindo o aroma do(a) $nome que contem $peso gramas');
  }

  @override
  void extrairSucoIngrediente() {
    // TODO: implement extrairSucoIngrediente
    print('Extraindo o Suco do(a) $nome que tem um sabor $sabor.');
  }

  @override
  void inseraBorrifador() {
    // TODO: implement inseraBorrifador
    print('Adicionando ao borrifador $peso gramas de extrato de $nome.');
  }

  @override
  void usarPerfume() {
    // TODO: implement usarPerfume
    print('usando o perfume de $nome.');
  }
//estaMadura (int diasParaAmadurecer){
//isMadura = diasDesdeColheita >= diasParaAmadurecer;
//print("A sua $nome foi colhida a $diasDesdeColheita dias, e precisa de $diasParaAmadurecer para amadurecer, Ela esta madura? $isMadura");
//}
}

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(this.nome, this.peso, this.cor);

  printAlimento() {
    print("Este $nome pesa $peso gramas e é da cor: $cor.");
  }
}

class Legumes extends Alimento implements Bolo{
  bool isPrecisaCozinhar;

  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar)
      : super(nome, peso, cor);

  void cozinhar() {
    if (isPrecisaCozinhar) {
      print('Pronto, o $nome está cozinhando');
    } else {
      print('nem precisa cozinhar.');
    }
  }

  @override
  void assar() {
    //colocar mias tempo?
    // TODO: implement assar
  }

  @override
  void fazerMassa() {
    // TODO: implement fazerMassa
  }

  @override
  void separarIngredientes() {
    // ver se o aliemnto esta cozido ou cru
    // TODO: implement separarIngredientes
  }
}

class Citricas extends Fruta {
  double nivelAzedo;

  Citricas(String nome, double peso, String cor, int diasDesdeColheita,
      String sabor, this.nivelAzedo)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  void existeRefri(bool existe) {
    if (existe) {
      print('Existe Refrigenrante de $nome');
    } else {
      print('nao existe refri de $nome');
    }
  }

  @override
  void escolhaIngrediente(){
    print('Eu escolhi a fruta citrica de $nome para fazer o perfume.');
  }

  @override
  void extrairSucoIngrediente(){
    print('Extraindo o suco do(a) $nome');
  }
}

class Nozes extends Fruta {
  double porcentagemOleoNatural;

  Nozes(String nome, double peso, String cor, int diasDesdeColheita,
      String sabor, this.porcentagemOleoNatural)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  @override
  void fazerMassa(){
    print("tirar a casca");
    super.fazerMassa();
  }


}

abstract class Perfume {
  void escolhaIngrediente();

  void extrairSucoIngrediente();

  void extrairAromaSuco();

  void inseraBorrifador();

  void usarPerfume();
}

abstract class Bolo {
  //separo os ingredientes
  void separarIngredientes();

  //faço a massa
  void fazerMassa();

  //assar
  void assar();
}

int calculoFruta(int dias) {
  int diasParaAmadurecer = 30;
  int cacluloDaFruto = diasParaAmadurecer - dias;

  return cacluloDaFruto;
}

funcCalculoFruta(int dias, String nome) {
  int diasParaAmadurecer = 30;
  int diasParaApodrecer;
  int calculoDaFruto = diasParaAmadurecer - dias;

  diasParaAmadurecer = 30 - dias;
  if (calculoDaFruto <= 0 && calculoDaFruto >= -10) {
    diasParaApodrecer = 10 - calculoDaFruto.abs();
    return "A Fruta $nome amadureceu a ${calculoDaFruto.abs()} dias, faltam ${diasParaApodrecer.abs()} para ela aprodrecer.";
  } else if (calculoDaFruto < -10) {
    diasParaApodrecer = 40 - dias;
    return "Nao consuma a fruta ${nome}, pois ela esta podre. Apodreceu a ${diasParaApodrecer.abs()} dias.";
  } else {
    return "a fruta $nome nao esta madura, faltam $diasParaAmadurecer dias.";
  }
}

// quando criar uma funcao void nao precisa adcicionar "void" a frente

//POSICIONAIS OBRIGATORIOS
mostrarMaduraPosicionalObrigatoria(String nome, int dias) {
  if (dias >= 30) {
    print("A $nome está madura.");
  } else {
    print("A $nome NÃO está madura.");
  }
}

//opcionais porem com valor declarado caso os parametros venham nulos
nomeadoOpcionais({String nome = "Nome Padrao", int dias = 0}) {
  if (dias >= 30) {
    print("A $nome está madura.");
  } else {
    print("A $nome NÃO está madura.");
  }
}

//opcionais sem valor declarado caso os parametros venham nulos, o ?(interrogação) serve para dizer que eles podem sim serem null (viasualmente melhor para identificar.
nomeadoOpcionaisPodeNullSafety({String? nome, int? dias}) {
  if (dias == null) {
    dias = 0;
  }
  if (dias >= 30) {
    if (nome == null || nome.isEmpty) {
      print("Não informado o nome da fruta porem ela está madura.");
    } else {
      print("A $nome está madura.");
    }
  } else {
    if (nome == null || nome.isEmpty) {
      print("Não informado o nome da fruta e nem esta madura.");
    } else {
      print("A $nome NÃO está madura.");
    }
  }
}

//tem que passar um valor, diferente do posicionais obrigatorios , qnd for chamar a funcao tanto faz a ordem
nomeadoOpcionaisRequeridos({required String nome, required int dias}) {
  if (dias >= 30) {
    if (nome == null || nome.isEmpty) {
      print("Não informado o nome da fruta porem ela está madura.");
    } else {
      print("A $nome está madura.");
    }
  } else {
    if (nome == null || nome.isEmpty) {
      print("Não informado o nome da fruta e nem esta madura.");
    } else {
      print("A $nome NÃO está madura.");
    }
  }
}

bool funcEstaMaduro(int dias) {
  if (dias >= 30) {
    return true;
  } else {
    return false;
  }
}
