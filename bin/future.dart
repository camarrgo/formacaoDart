import 'dart:math';

void main() {
  // .then SIGNIFICA: E DEPOIS?

  // Future myFuture = Future(() {
  //   print('de volta para o futuro');
  //   return 21;
  // }).then((value) => print('o valor é $value'));
  //
  // Future<int> myFutureFunc() async {
  //   print('eu tenho uma funcao do futuro');
  //   await Future.delayed(Duration(seconds: 5));
  //   return 12;
  // }
  //
  // myFutureFunc().then(
  //     (value) => print('o valor que esta dentro do meu Future é: $value'));

  Future<int> funcaoFutura(int a, int b) async {
    try {
      if (a > b) {
        throw Exception();
      }
      print('Eu tenho uma funcao funcional');
      await Future.delayed(Duration(seconds: 5));
      return 42;
    } catch (e) {
      print('o eror é $e');
      return 55;
    } finally {
      print('finalmente terminou');
    }
  }

  funcaoFutura(2, 3).then((value) => print('o valor do retorno é $value'));

  print("Teminou a MAIN");
}
