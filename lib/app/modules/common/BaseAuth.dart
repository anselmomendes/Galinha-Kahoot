import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();

  Future<void> changeEmail(String email);

  Future<void> changePassword(String password);

  Future<void> deleteUser();

  Future<void> sendPasswordResetMail(String email);

  Future<bool> createUserMeta(String role, String university);

  Future<Map> getUserMeta();

  Future<String> getUserRole();
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

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
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

	List metaFields = ["uid", "role", "university"];

  Future<bool> createUserMeta(String role, String university) async {
		FirebaseUser currentUser = await getCurrentUser();
		if (currentUser == null)
			throw Exception("Access denied: No user currently signed in.");
		
		Map registerMeta = {"uid": currentUser, "role": role, "university": university};
    	Firestore.instance.collection("users")
        	.where("uid", isEqualTo: currentUser)
        	.getDocuments()
        	.then((docs){
				if (docs.documents.isEmpty){
					Firestore.instance.collection("users").add(registerMeta);
					return true;
				}
				return false;
			});
		return false;
    }

	Future<Map> getUserMeta(){
		Future<FirebaseUser> currentUser = getCurrentUser();		
		var docs = Firestore.instance.collection("users")
					.where("uid", isEqualTo: currentUser)
					.getDocuments();

		docs.then((value){
			if(value.documents.isEmpty)
				throw Exception("No meta found for current User. Is it really registered?");
			else {
				Map meta;
				metaFields.forEach((element){
					meta[element] = value.documents[0][element];
				});
				return meta;
			}
		});	
		return null;
	}

	Future<String> getUserRole() async {
		await getCurrentUser().then((user){
			Firestore.instance.collection("users")
			.where("uid", isEqualTo: user.uid)
			.getDocuments().then((docs){
				if(docs.documents[0].exists)
					return docs.documents[0].data['role'];
				if(docs.documents.isEmpty)
					return false;
			});
		}); 
		return null;}

}