import 'controllers/bank_controller.dart';
import 'models/account.dart';

void main() {
  // Criando o banco
  print("Started Main");
  functionOne();
  print("Finish Main");
}

void functionOne(){
  print("Started F01");
  functionTwo();
  print("Finish F02");
}

void functionTwo(){
  print("Started F02");
  for(int i = 0; i <= 5; i++){
    print(i);
  }
  print("Finish F02");
}