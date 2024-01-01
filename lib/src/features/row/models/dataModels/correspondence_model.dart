import 'package:bem/src/features/row/models/dataModels/document_model.dart';

// Data model for Correspondence
class CorrespondenceDM {
  // Enum to denote Correspondence Type (All, Email, Call, Note, Attachment)
  CorrespondeceType? type;

  // Date and time of creation
  String? dateCreated;
  String? timeCreated;

  // Notes related to the correspondence
  String? notes;

  // List of documents associated with the correspondence
  List<DocumentDM>? documentList;

  // Constructor for CorrespondenceDM class
  CorrespondenceDM(this.type, this.dateCreated, this.timeCreated, this.notes, this.documentList);
}

// Enum to represent Correspondence Type
enum CorrespondeceType { All, Email, Call, Note, Attachment }
