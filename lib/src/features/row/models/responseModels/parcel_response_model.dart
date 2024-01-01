class ParcelResponseModel {
  String? caseId;
  String? parcelName;
  String? parcelAddress;
  String? propertyOwnerName;
  String? parcelStatus;
  String? parcelNo;
  String? projectNoPin;

  ParcelResponseModel({
    this.caseId,
    this.parcelName,
    this.parcelAddress,
    this.propertyOwnerName,
    this.parcelStatus,
    this.parcelNo,
    this.projectNoPin,
  });

  ParcelResponseModel.fromJson(Map<String, dynamic> json) {
    caseId = json['CaseId'];
    parcelName = json['ParcelName'];
    parcelAddress = json['ParcelAddress'];
    propertyOwnerName = json['PropertyOwnerName'];
    parcelStatus = json['ParcelStatus'];
    parcelNo = json['ParcelNo'];
    projectNoPin = json['ProjectNoPin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CaseId'] = caseId;
    data['ParcelName'] = parcelName;
    data['ParcelAddress'] = parcelAddress;
    data['PropertyOwnerName'] = propertyOwnerName;
    data['ParcelStatus'] = parcelStatus;
    data['ParcelNo'] = parcelNo;
    data['ProjectNoPin'] = projectNoPin;
    return data;
  }

  @override
  String toString() {
    return 'ParcelResponseModel { CaseId: $caseId, ParcelName: $parcelName, ParcelAddress: $parcelAddress, PropertyOwnerName: $propertyOwnerName, ParcelStatus: $parcelStatus, ParcelNo: $parcelNo, ProjectNoPin: $projectNoPin }';
  }
}
