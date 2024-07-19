class SenderIdInvalidException implements Exception{
  static const String report = "SenderIdInvalidException";
  String idSender;
  SenderIdInvalidException({required this.idSender});

  @override
  String toString(){
    return "$report\nID Sender: $idSender";
  }
}

class ReceiverInvalidException implements Exception{
  static const String report = "ReceiverInvalidException";
  String idReceiver;

  ReceiverInvalidException(this.idReceiver);

  @override
  String toString(){
    return "$report\nID Receiver: $idReceiver";
  }
}

class SenderNotAuthenticateException implements Exception{
  static const String report = "ReceiverInvalidException";
  String idSender;

  SenderNotAuthenticateException(this.idSender);

  @override
  String toString(){
    return "$report\nID Sender: $idSender";
  }
}

class SenderBalanceLowerThaAmountException implements Exception{
  static const String report = "SenderBalanceLowerThaAmountException";
  String idSender;
  double senderBalance;
  double amoount;

  SenderBalanceLowerThaAmountException(
      this.idSender, this.senderBalance, this.amoount);

  @override
  String toString(){
    return "$report\nID Sender: $idSender\nSender Balance: $senderBalance\nAmount: $amoount";
  }
}