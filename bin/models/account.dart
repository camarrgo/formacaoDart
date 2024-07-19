class Account {
  String name;
  double balance;
  bool isAuthenticated;
  DateTime? createdAt;

  Account(
      {required this.name,
      required this.balance,
      required this.isAuthenticated, this.createdAt}):
  assert(name.isNotEmpty, "O nome nao pode ser uma string vazia"),
  assert(balance >= 0, "O Saldo nao pode ser negativo");

  editBalance({required value}) {
    balance = balance + value;
  }
}
