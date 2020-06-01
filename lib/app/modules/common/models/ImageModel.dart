import 'package:cloud_firestore/cloud_firestore.dart';

class ImageModel {
	int id;
	String md5; 
	String relatedTo;
  String format;
	DateTime createdAt;

	ImageModel({
		this.id,
		this.md5,
    this.format,
		this.relatedTo,
		this.createdAt
	});

  get filename {
      return "$md5.$format";
  }

	factory ImageModel.fromDocument(DocumentSnapshot doc) => ImageModel(
		id: doc["id"],
		md5: doc["md5"],
    format: doc["format"],
		relatedTo: doc["relatedTo"],
		createdAt: doc["createdAt"]
	);

	Map<String, dynamic> toJSON() => {
		"id": id,
		"md5": md5,
    "format": format,
		"relatedTo": relatedTo,
		"createdAt": createdAt,
    "filename": filename
	};

}