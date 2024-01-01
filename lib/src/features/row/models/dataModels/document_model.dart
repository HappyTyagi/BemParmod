// Data model for Document
class DocumentDM {
  // Path to the image/document
  String? imagePath;

  // Name of the file/document
  String? fileName;

  // Size of the file/document
  String? fileSize;

  // Date of creation
  String? createDate;

  // Flag indicating whether the document is in edit mode
  bool isEditMode = false;

  // Upload progress percentage
  double uploadPercent = 0;

  // Flag to show upload progress
  bool showUploadProgress = false;

  // Flag to show delete button for the document
  bool showDeleteButton = false;

  // Constructor for adding documents
  DocumentDM(this.imagePath, this.fileName, this.fileSize, this.createDate);

  // Additional constructor for editing documents
  DocumentDM.add(
    this.imagePath,
    this.fileName,
    this.fileSize,
    this.createDate,
    this.uploadPercent,
    this.showDeleteButton,
    this.showUploadProgress,
  ) {
    // Set edit mode to true when using the 'add' constructor
    isEditMode = true;
  }
}
