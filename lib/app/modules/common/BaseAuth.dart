import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<bool> createUserMeta(String uid, String role);

  Future<FirebaseUser> getCurrentUser();

  Future<String> getCurrentUserRole();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();

  Future<void> changeEmail(String email);

  Future<void> changePassword(String password);

  Future<void> deleteUser();

  Future<void> sendPasswordResetMail(String email);
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user;
    return user.uid;
  }

  Future<String> signUp(String email, String password) async {
    FirebaseUser user = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password)).user;
    return user.uid;
  }

  Future<bool> createUserMeta(String uid, String role) async{
    Firestore.instance.collection("users")
      .where("uid", isEqualTo:uid)
      .getDocuments()
      .then((docs){
        if (docs.documents.isEmpty){
          Firestore.instance.collection("users").add({"uid":uid, "role": role});
          return true;
        }
        else {
          // throw Exception("Já existe um metadata de usuário vinculado à esta conta.");
          return false;
        }
      });
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<String> getCurrentUserRole() async {
    FirebaseUser user = await _firebaseAuth.currentUser().then((user){
        Firestore.instance.collection("users")
          .where("uid", isEqualTo: user.uid)
          .getDocuments().then((docs){
              if(docs.documents[0].exists){
                return docs.documents[0].data['role'];
              }
            }
          );
      }
    ); 
    return null;  
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }

  @override
  Future<void> changeEmail(String email) async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.updateEmail(email).then((_) {
      print("Endereço de email alterado com sucesso!");
    }).catchError((error) {
      print("O email não pôde ser alterado: " + error.toString());
    });
    return null;
  }

  @override
  Future<void> changePassword(String password) async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.updatePassword(password).then((_) {
      print("Senha alterada com sucesso");
    }).catchError((error) {
      print("A senha não pôde ser alterada: " + error.toString());
    });
    return null;
  }

  @override
  Future<void> deleteUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.delete().then((_) {
      print("Conta de usuário excluída com sucesso.");
    }).catchError((error) {
      print("A conta não pôde ser excluída: " + error.toString());
    });
    return null;
  }

  @override
  Future<void> sendPasswordResetMail(String email) async{
    await _firebaseAuth.sendPasswordResetEmail(email: email);
    return null;
  }

}