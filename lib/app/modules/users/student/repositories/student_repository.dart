import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/class/models/StudentClassMeta.dart';
import 'package:galinha_karoot/app/modules/common/BaseAuth.dart';

class StudentRepository extends Disposable {

  final Firestore firestore = Firestore.instance;
  final Auth auth = Auth();

  StudentRepository(){
    print("Student Repo started!");
  }

  /* TODO: Create cached current user reference in Auth class */
  Future<DocumentReference> getCurrentUserReference() async{
      var user = await auth.getCurrentUser();

      if (user != null){
        return firestore.collection('users')
          .where('user', isEqualTo: user.uid)
          .getDocuments()
          .then((docs){
              if (docs.documents.isNotEmpty)
                return docs.documents[0].reference;
        });
      }
  }

  Future<List<StudentClassMeta>> getClasses() async{
    print("Fetching classes...");
    var userRef = await getCurrentUserReference();	
    List<DocumentSnapshot> metaList = new List<DocumentSnapshot>();
    List<StudentClassMeta> classList = new List<StudentClassMeta>();

    await firestore.collection('users.classes')
      .where('user', isEqualTo: userRef)
      .getDocuments().then((docs){
        metaList.addAll(docs.documents);
    });

    for(int i=0; i < metaList.length; i++){
        DocumentSnapshot element = metaList[i];
        DocumentReference classRef = element.data['class'];
        DocumentSnapshot aclass = await firestore.collection('classes')
                                        .document(classRef.documentID).get();
        classList.add(StudentClassMeta.fromDocument(aclass));        
    }
    print("Done fetching classes...");
    return classList;
  }


  @override
  void dispose() {
    
  }
}
