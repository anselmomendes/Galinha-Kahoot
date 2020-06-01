import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:crypto/crypto.dart';
 
List acceptedImageFormats = ['png', 'jpg', 'webp'];

class ImageUploader {

	final CollectionReference imagesCollection = Firestore.instance.collection("Images");

	Future<DocumentReference> retrieveImageDocument(String imgMd5) async {
		// TODO: Handle generic connection problems.
		await imagesCollection.where({'md5': imgMd5}).getDocuments()
			.then((response){
				return response.documents.isNotEmpty ? response.documents[0].reference : null;
			});
	}
	
	Future<DocumentReference> createImageDocument(String imgMd5, String relatedTo) async{
		bool alreadyExists = await imageExists(imgMd5);
		if (alreadyExists)
			return retrieveImageDocument(imgMd5);
		Map imageMeta = {"md5": imgMd5, "relatedTo": relatedTo, "uploadedAt": DateTime.now() }; // TODO: Ensure the date is right;
		DocumentReference reference = await imagesCollection.add(imageMeta);		
		return reference;
	}

	Future<bool> imageExists(String imgMd5) async {		
		return (retrieveImageDocument(imgMd5) != null);
	}

	String getFileHash(File imgFile){				
		return md5.convert(imgFile.readAsBytesSync()).toString();		
	}

	String getImageFormat(File imgFile){
		var format = imgFile.path.split('.')[-1];
		if (acceptedImageFormats.indexOf(format) != -1)
			return format;
		throw Exception("Formato de imagem inválido: $format!");
	}

    Future<StorageUploadTask> uploadFile(File imgFile, String relatedTo) async {

		var imgMd5 = getFileHash(imgFile);
		// TODO : Ensure the file is OK before uploading.
		StorageReference storageRef = FirebaseStorage.instance.ref().child(imgMd5 + getImageFormat(imgFile));
		StorageUploadTask uploadTask = storageRef.putFile(imgFile);

		// Inserting meta into database
		// TODO: Validate relatedTo to ensure that the class exists.
		await createImageDocument(imgMd5, relatedTo);
		return uploadTask;
  }

}