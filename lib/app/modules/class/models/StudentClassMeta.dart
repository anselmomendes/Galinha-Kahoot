import 'package:cloud_firestore/cloud_firestore.dart';

class StudentClassMeta {

    bool public;

    String id;
    String name = 'Default class name';
    String description = 'Default class description';
    String thumbnail = 'thumbnailURL';
    String subject = 'Default class subject';  // May be Reference in the Future
    String inviteCode = 'DefaultClassSubject123';   

    Timestamp createdAt = Timestamp.now();

    DocumentReference teacher;
    DocumentReference reference;

    StudentClassMeta({
        this.id,
        this.name,
        this.description,
        this.subject,        
        this.inviteCode,
        this.createdAt,
        this.thumbnail,
        this.teacher,
        this.public
    });

  	factory StudentClassMeta.fromDocument(DocumentSnapshot doc) => StudentClassMeta(
        id: doc.documentID,
        name: doc['name'],
        description: doc['description'],
        inviteCode: doc['invitation_code'],
        public: doc['public'],
        subject: doc['subject'],
        teacher: doc['teacher'],
        thumbnail: doc['thumbnail'],
        createdAt: doc['created_at']
      );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "thumbnail": thumbnail,
        "subject": subject,
        "public": public,
        "inviteCode": inviteCode,
        "createdAt": createdAt,
        "teacher": teacher.path
    };

    toString(){
      return toJson().toString();	
    }
}