import 'transporte.dart';
import 'viagem.dart';

void main() {
  Viagem viagemMaio = Viagem(locomocao: Transporte.carro);
  //mesmacoisa
  //Viagem viagemMaio = Viagem(Transporte.carro);
  print(viagemMaio.totalLocaisVisitados);
  //mesmacoisa
  print(viagemMaio.consultarTotalLocaisVisitados);

  viagemMaio.visitar("Museu");

  print(viagemMaio.consultarTotalLocaisVisitados);
  print(viagemMaio.totalLocaisVisitados);

  viagemMaio.alterarLocaisVisitados = 10;

  print(viagemMaio.consultarTotalLocaisVisitados);

  viagemMaio.totalLocaisVisitados = 20;

  print(viagemMaio.totalLocaisVisitados);
}
