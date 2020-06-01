import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class ImageModel {
	int id;
	String md5; 
	String relatedTo;
	DateTime createdAt;

	ImageModel({
		this.id,
		this.md5,
		this.relatedTo,
		this.createdAt
	});

	factory ImageModel.fromDocument(DocumentSnapshot doc) => ImageModel(
		id: doc["id"],
		md5: doc["md5"],
		relatedTo: doc["relatedTo"],
		createdAt: doc["createdAt"]
	);

	Map<String, dynamic> toJSON() => {
		"id": id,
		"md5": md5,
		"relatedTo": relatedTo,
		"createdAt": createdAt
	};

}