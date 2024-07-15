import 'transporte.dart';

class Viagem {
  static String codigoTrabalho = "SXKS321";
  double dinheiro = 0;
  Transporte locomocao;
  Set<String> setVisitados = <String>{};
  Map<String, dynamic> registrarPrecos = {};

  int _totalLocaisVisitados = 0;

  static String _codigoSecreto = "123";

  Viagem({required this.locomocao});

  //Viagem(this.locomocao);

  printCodigo() {
    print(codigoTrabalho);
  }

  void escolherMeioTransporteExemplo(int locomocao) {
    if (locomocao == 0) {
      print("Vou de CARRO");
    } else if (locomocao == 1) {
      print("vou de BIKE");
    } else {
      print("vou a pé");
    }
  }

  void escolherMeioTransporteEnum(Transporte locomocao) {
    if (locomocao == Transporte.carro) {
      print("Vou de CARRO");
    } else if (locomocao == Transporte.bike) {
      print("vou de BIKE");
    } else {
      print("vou a pé");
    }
  }

  void escolherMeioTransporteSwitch(Transporte locomocao) {
    switch (locomocao) {
      case Transporte.carro:
        print("Vou de CARRO");
        break;
      case Transporte.bike:
        print("vou de BIKE");
        break;
      default:
        print("eu vou a pe");
        break;
    }
  }

  void visitar(String localVisita) {
    //setVisitados = registrarDestinos("Curitiba", setVisitados);
    //setVisitados = add("Curitiba");
    setVisitados.add(localVisita);

    _totalLocaisVisitados += 1;
  }

  void registrarPrecoVisita(String local, dynamic preco) {
    //registrarPrecos["Sao Paulo"] = 1200;
    registrarPrecos[local] = preco;
  }

  int get totalLocaisVisitados => _totalLocaisVisitados;

  //MESMA COISA
  int get consultarTotalLocaisVisitados {
    return _totalLocaisVisitados;
  }

  set totalLocaisVisitados(int novaQtd) {
    _totalLocaisVisitados = novaQtd;
  }

  set alterarLocaisVisitados(int novaQtd) {
    if (novaQtd < 10) {
      _totalLocaisVisitados = novaQtd;
    } else {
      print("nao é possivel visitar tantods lugares");
    }
  }

  static String get codigoSecreto => _codigoSecreto;
}
