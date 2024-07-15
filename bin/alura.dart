
import 'dart:io';

const String version = '0.0.1';

void main() {
  int idade = 21;
  String nome = 'Joaozinho';
  double altura = 1.80;
  bool geek = true;
  const String exe = "Exercito obrigatório";
  const String livre = "vcoe esta livre";
  double metros = 75e2;
  bool vaiProExercito = (idade >= 18 && idade <= 22);
  String frase = "paraéns voce esta apto ao: \n$exe";

  if (vaiProExercito) {
    print(frase);
  } else {
    print(livre);
  }

  String nome1 = 'joao';
  String nome2 = 'Maria';
  String nome3 = 'Raimundo';
  String nome4 = 'Raimunda';
  String nome5 = 'Juka';

  List<String> nomeList = ['Joao', 'Joao2', 'Joao3', 'Joao4'];
  List<String> nomeList2 = [];
  nomeList2.add(nome1);
  nomeList2.add(nome2);
  nomeList2.add(nome3);
  nomeList2.add(nome4);
  nomeList2.add(nome5);
  print(nomeList.getRange(1, 3));
  print(nomeList2[1]);


  nomeList2.sort();

  List<dynamic> pessoa = [18, 'Raimundinho', 1.65, true];

  String frase2 = 'Idade do candidato: ${pessoa[0]} \n'
      'Nome: ${pessoa[1]}';
  print(frase2);

  var numbers = [1, 3, 2, 5, 4];

  var sum = numbers.reduce((curr, next) => curr + next);
  print(sum);

  numbers.sort((num1, num2) => num1 - num2);
  print(numbers);

  const initialValue = 10;
  var sum2 = numbers.fold(initialValue, (curr, next) => curr + next);
  print(sum2);

  List<Map<String, dynamic>> users = [
    {"name": 'John', "age": 18},
    {"name": 'Jane', "age": 21},
    {"name": 'Mary', "age": 23}
  ];

  print(users);

  var is18AndOver = users.every((user) => user['age'] >= 18);
  print(is18AndOver);

  var hasNamesWithJ = users.map((user) => user["name"].startsWith('J'));
  String valorUsuario;
  int totalComJ = 0;
  for (int i = 0; users.length > i; i++) {
    valorUsuario = users[i]["name"];
    print('VALOR DO USUARIO= ' + valorUsuario);
    if (valorUsuario.startsWith('J')) {
      print("acheiii= " + valorUsuario);
      totalComJ++;
    }
  }

  int energia = 10;
  int i = 0;
  int i2 = 0;
  while (energia > 0) {
    print('repeticao = $energia');
    energia -= 1;
    i++;
    i2++;
  }

  do {
    print('repeticao = $energia');
    energia -= 1;
    i++;
    i2++;
  } while (energia > 0);

  print('total de repeticao= $i');
  print('total de repeticao222= $i2');
  print('Total de pessoas com a inicial J é de: $totalComJ');
  print(hasNamesWithJ);

  print('===========================');

  nomeList2.forEach((element) {

    print(element);
    if(element.startsWith('R')){
      print('O nome $element começa com a letra R');
    }
  });

   String nomes = nomeList2.reduce((value, element){
    return value+", "+element;
  });

   print("Todos os nomes juntos= "+nomes);

   //--------------------- mais que 3 letras



  List<String> maior = nomeList2.where((element) => element.length > 4).toList();

  print("somente os maior de 4 digitos: $maior");
  String maiorPrimeiro = nomeList2.firstWhere((element) => element.length > 4);
  String maiorUltimo = nomeList2.lastWhere((element) => element.length > 4);

  print("O primeiro nome com mais de 4 digitos: $maiorPrimeiro e o ultimo nome copm mais de 4 diitos: $maiorUltimo");


  /// CRIANDO COM INPUT NA LINHA DE COMANDO
  print("Qual é a sua idade? ");
  String? input = stdin.readLineSync();

  if(input != null){
    int idade =  int.parse(input);
      print("sua idade ano que vem sera: ${idade+1}");
  }
  print('escrito: $input');
}