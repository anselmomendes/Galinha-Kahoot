import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/common/NotImplemented.dart';
import 'package:galinha_karoot/app/modules/common/models/ImageModel.dart';

class ImageRepository extends Disposable {
	final CollectionReference collection;

	ImageRepository({@required this.collection});
	
	Stream<List<ImageModel>> all(){
		return collection.snapshots().map((response) => (
			response.documents.map((doc) => ImageModel.fromDocument(doc))
			.toList()
		));
	}

	Future<ImageModel> getById(int id){
		throw NotImplemented();
	}

	Future<ImageModel> getByMD5(String md5hash){
		throw NotImplemented();
	}

	Future<ImageModel> getByRelated(CasesModel _case){
		throw NotImplemented();
	}

	Future<StorageUploadTask> create(ImageModel image){
		throw NotImplemented();
	}

	Future<Image> getWidget(ImageModel image){
		throw NotImplemented();
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