class UserResponseModel {
  // Properties of the UserRM class
  String? userId; // Unique identifier for the user
  String? email; // Email address of the user
  String? userName; // Username of the user
  String? changePassword; // Field indicating if the password should be changed
  String? pocId; // Point of Contact ID
  String? pocName; // Point of Contact Name
  String? secGroupId; // Security Group ID
  String? regionId; // Region ID
  String? token; // Authentication token for the user

  // Constructor for UserRM class with optional named parameters
  UserResponseModel({
    this.userId,
    this.email,
    this.userName,
    this.changePassword,
    this.pocId,
    this.pocName,
    this.secGroupId,
    this.regionId,
    this.token,
  });

  // Deserialize JSON data to UserRM object
  UserResponseModel.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    email = json['Email'];
    userName = json['UserName'];
    changePassword = json['ChangePassword'];
    pocId = json['PocId'];
    pocName = json['PocName'];
    secGroupId = json['SecGroupId'];
    regionId = json['RegionId'];
    token = json['Token'];
  }

  // Serialize UserRM object to JSON data
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['Email'] = email;
    data['UserName'] = userName;
    data['ChangePassword'] = changePassword;
    data['PocId'] = pocId;
    data['PocName'] = pocName;
    data['SecGroupId'] = secGroupId;
    data['RegionId'] = regionId;
    data['Token'] = token;
    return data;
  }
}
