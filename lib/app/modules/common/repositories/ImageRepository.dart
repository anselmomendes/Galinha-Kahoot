import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/common/exceptions/NotImplemented.dart';
import 'package:galinha_karoot/app/modules/common/models/ImageModel.dart';
import 'package:galinha_karoot/app/modules/common/utils/ImageUploader.dart';

class ImageRepository extends Disposable {

	final Firestore firestore;
	CollectionReference collection;
	StorageReference storage;

	ImageRepository({@required this.firestore}){
		collection = firestore.collection('Images');
		storage = FirebaseStorage.instance.ref();		
	}

	Future<QuerySnapshot> getDocsSnapshot(Map filter, {int limit=0}) async{
		Query query = collection.where(filter);
		if (limit > 0) query.limit(limit);
		return query.getDocuments();
	}

	Future<DocumentSnapshot> getSingleDocument(Map filter) async{
		var doc = await getDocsSnapshot(filter, limit: 1).then((response){
			return response.documents.first;
		});		
		return doc;
	}

	Stream<List<ImageModel>> all(){
		return collection.snapshots().map((response) => (
			response.documents.map((doc) => ImageModel.fromDocument(doc))
			.toList()
		));
	}

	Future<StorageReference> getFileRef(ImageModel image) async {
		return storage.child(image.filename);
	}

	Future<Image> getImageWidget(ImageModel image) async {
		var url = await getImageUrl(image);
		return Image.network(url);
	}

	Future<String> getImageUrl(ImageModel image) async {		
		var fileRef = await getFileRef(image);
		return fileRef.getDownloadURL();
	}

	Future<ImageModel> getById(int id) async {
		var doc = await getSingleDocument({"id": id});
		return ImageModel.fromDocument(doc);
	}

	Future<ImageModel> getByMD5(String md5hash) async {
		var doc = await getSingleDocument({"md5": md5hash});
		return ImageModel.fromDocument(doc);
	}

	Future<ImageModel> getByFilename(String filename) async {
		var md5hash, format = filename.split(".");
		var doc = await getSingleDocument({"md5": md5hash, "format": format});
		return ImageModel.fromDocument(doc);
	}

	Future<ImageModel> getByRelated(CasesModel _case) async{
		var doc = await getSingleDocument({"relatedTo": _case.id});
		return ImageModel.fromDocument(doc);
	}

	Future<ImageModel> getByRelatedId(String relatedId) async{
		var doc = await getSingleDocument({"relatedTo": relatedId});
		return ImageModel.fromDocument(doc);
	}	

	Future<DocumentReference> create(File file, CasesModel _case) async {
		String md5hash = ImageUploader.getFileHash(file);
		String format = ImageUploader.getImageFormat(file);
		var image = ImageModel(md5: md5hash, 
				   		format: format, 
				   		relatedTo: _case.id,
				   		createdAt: DateTime.now()
		);

		var storageRef = await getFileRef(image);
		return storageRef.putFile(file).onComplete.then((value){
			return collection.add(image.toJSON()); // Creating meta document when file upload is completed...
		});
	}

	Future delete(ImageModel model){
		throw NotImplemented();
	}

	Future deleteAllRelated(CasesModel _case){
		throw NotImplemented();
	}

	Future save(ImageModel model) async {
		throw NotImplemented();
	}

	@override
	void dispose(){
		print("Disposing Image");
	}  

}