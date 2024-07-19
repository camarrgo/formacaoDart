import 'dart:convert';
import 'dart:math';

import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';


void testeNullSafety(){

  Account? minhaConta = Account(name: "Matheus", balance: 500, isAuthenticated: true);

  Account contaX = Account(name: "Matheus", balance: 500, isAuthenticated: true);


  //comunicacao externa simulacao
  Random rnd = new Random();
  int numeroAleatorio = rnd.nextInt(10);

  if(numeroAleatorio <= 5){
    //minhaConta = Account(name: "Matheus", balance: 500, isAuthenticated: true);
    minhaConta.createdAt = DateTime.now();
    contaX.createdAt = DateTime.now();
  }

  print(contaX.createdAt);
  //print(contaX.createdAt!.day);

  //operador ternário
  print(minhaConta != null ? minhaConta.balance : "Conta nula, usando operador ternário");

  //funciona pq testamos o createdAt que nao é null entao o BIN ! vai funcionar
  print(contaX.createdAt != null ? minhaConta.createdAt!.day : "Conta nula, usando operador ternário");



  //ESTILO SAFE call
  print(minhaConta?.balance);

  if(minhaConta != null){
    print(minhaConta.balance);
  }else{
    print('conta nula');
  }

}

void main() {

  testeNullSafety();

  //assert(3 > 4);
  //assert(3 > 4, "Que pena, 3 não é maior que 4");

  // Criando o banco
  BankController bankController = BankController();

  //Account zezinho = Account(name: "Ze", balance: 15, isAuthenticated: true);

  //Account testAccount = Account(name: "", balance: 0, isAuthenticated: true);

  //String naoPodeSerNUla ="string";
  //String? podeSerNull;





  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 400, isAuthenticated: false));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  
  try {
    bool result = bankController.makeTransfer(
        idSender: "Kako", idReceiver: "Ricarth", amount: 200);

    if(result){
      print('transacao concluida com sucesso.');
    }
  } on SenderIdInvalidException catch (e) {
    print(e);
    print('Os Id ${e.idSender} do remetente não é um ID Válido');
  } on ReceiverInvalidException catch (e) {
    print(e);
    print('Os Id ${e.idReceiver} do Destinatario não é um ID Válido');
  } on SenderNotAuthenticateException catch (e) {
    print(e);
    print('Os Id ${e.idSender} do Destinatario não é esta autenticado');
  }on SenderBalanceLowerThaAmountException catch (e) {
    print(e);
    print('O USuario ${e.idSender} tentou enviar ${e.amoount} sendo que ele tem ${e.senderBalance} reais.');
  } on Exception catch (e){
    print('erro desconhecido');
  }

  // Fazendo transferência
  // try {
  //   bankController.makeTransfer(
  //       idSender: "Kako", idReceiver: "Ricarth", amount: 200);
  //
  //   print("Transação concluída com sucesso");
  // } on SenderIdInvalidException catch (e) {
  //   print(e);
  // } on ReceiverIdInvalidException catch (e) {
  //   print(e);
  // } on SenderNotAuthenticatedException catch (e) {
  //   print(e);
  // } on ReceiverNotAuthenticatedException catch (e) {
  //   print(e);
  // } on SenderBalanceLowerThanAmountException catch (e) {
  //   print(e);
  // } catch (e) {
  //   print("Erro desconhecido.");
  // }
}
