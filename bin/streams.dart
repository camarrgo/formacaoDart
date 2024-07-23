
import 'dart:async';

void main() async{


  //async* PERMITE QUE O OBJETO FIQUE ABERTO POR TEMPO INDETERMINADO, ATE FECHARMOS, o normal a informacao chegou ele fecha
  Stream myStream(int interval, [int? maxCount]) async*{

    int i = 1;
    while(i != maxCount){
      print("Counting: $i");
      await Future.delayed(Duration(seconds: interval));
      yield i++;
    }
    print('a stream terminou');
  }

  //myStream(1,10);



  StreamSubscription mySubscriber = myStream(1).listen((event) {
  if(event.isEven){
    print("é par (even)");
    //throw Exception();
  }
  }, onError: (e){
    print('deu um erro: $e');
  }, onDone: (){
    print('Parou de assistir.');
  });

  await Future.delayed(Duration(seconds: 3));
  mySubscriber.pause();
  print('Stream Pause');
  await Future.delayed(Duration(seconds: 3));
  mySubscriber.resume();
  print('Stream Resume');
  await Future.delayed(Duration(seconds: 3));
  mySubscriber.cancel();
  print('Stream Cancel');


  print('a main terminou');
}