import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
// import 'package:dio/native_imp.dart';

class Student2Repository extends Disposable {
  // final DioForNative client;
  final Firestore firestore;
  
  Student2Repository({
    this.firestore,
  });



  // Não sei o que é isso - veio automático
  /* Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  } */

  //dispose will be called automatically
  @override
  void dispose() {}
}
