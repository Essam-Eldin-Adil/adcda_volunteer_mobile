class UserModel {
  int? requestID;
  String? creationDate;
  String? militaryNumber;
  String? emailAddress;
  String? requestReason;
  String? nameAR;
  String? nameEN;
  String? mobileNumber;
  String? officePhone;
  String? position;
  String? departmentOrDivision;
  String? profileImageURL;
  int? statusID;
  String? actionDate;
  int? actionTakenUserID;
  String? actionRemarks;
  String? eBusinessCardLink;
  bool? eBusinessCardLinkSend;
  bool? eBusinessCardLinkActive;
  String? eBusinessCardLinkExpiryDate;
  List<UploadsList>? uploadsList;

  UserModel({
    this.requestID,
    this.creationDate,
    this.militaryNumber,
    this.emailAddress,
    this.requestReason,
    this.nameAR,
    this.nameEN,
    this.mobileNumber,
    this.officePhone,
    this.position,
    this.departmentOrDivision,
    this.profileImageURL,
    this.statusID,
    this.actionDate,
    this.actionTakenUserID,
    this.actionRemarks,
    this.eBusinessCardLink,
    this.eBusinessCardLinkSend,
    this.eBusinessCardLinkActive,
    this.eBusinessCardLinkExpiryDate,
    this.uploadsList,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    requestID = json['RequestID'];
    creationDate = json['CreationDate'];
    militaryNumber = json['MilitaryNumber'];
    emailAddress = json['EmailAddress'];
    requestReason = json['RequestReason'];
    nameAR = json['NameAR'];
    nameEN = json['NameEN'];
    mobileNumber = json['MobileNumber'];
    officePhone = json['OfficePhone'];
    position = json['Position'];
    departmentOrDivision = json['DepartmentOrDivision'];
    profileImageURL = json['ProfileImageURL'];
    statusID = json['StatusID'];
    actionDate = json['ActionDate'];
    actionTakenUserID = json['ActionTakenUserID'];
    actionRemarks = json['ActionRemarks'];
    eBusinessCardLink = json['EBusinessCardLink'];
    eBusinessCardLinkSend = json['EBusinessCardLinkSend'];
    eBusinessCardLinkActive = json['EBusinessCardLinkActive'];
    eBusinessCardLinkExpiryDate = json['EBusinessCardLinkExpiryDate'];
    if (json['UploadsList'] != null) {
      uploadsList = <UploadsList>[];
      json['UploadsList'].forEach((v) {
        uploadsList!.add(UploadsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['RequestID'] = requestID;
    data['CreationDate'] = creationDate;
    data['MilitaryNumber'] = militaryNumber;
    data['EmailAddress'] = emailAddress;
    data['RequestReason'] = requestReason;
    data['NameAR'] = nameAR;
    data['NameEN'] = nameEN;
    data['MobileNumber'] = mobileNumber;
    data['OfficePhone'] = officePhone;
    data['Position'] = position;
    data['DepartmentOrDivision'] = departmentOrDivision;
    data['ProfileImageURL'] = profileImageURL;
    data['StatusID'] = statusID;
    data['ActionDate'] = actionDate;
    data['ActionTakenUserID'] = actionTakenUserID;
    data['ActionRemarks'] = actionRemarks;
    data['EBusinessCardLink'] = eBusinessCardLink;
    data['EBusinessCardLinkSend'] = eBusinessCardLinkSend;
    data['EBusinessCardLinkActive'] = eBusinessCardLinkActive;
    data['EBusinessCardLinkExpiryDate'] = eBusinessCardLinkExpiryDate;
    if (uploadsList != null) {
      data['UploadsList'] = uploadsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UploadsList {
  int? id;
  int? requestID;
  String? fileName;
  String? filePath;
  String? fileLink;
  int? fileSize;
  bool? isDeleted;
  String? creationDate;
  String? updatedDate;
  String? updatedBy;

  UploadsList({
    this.id,
    this.requestID,
    this.fileName,
    this.filePath,
    this.fileLink,
    this.fileSize,
    this.isDeleted,
    this.creationDate,
    this.updatedDate,
    this.updatedBy,
  });

  UploadsList.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    requestID = json['RequestID'];
    fileName = json['FileName'];
    filePath = json['FilePath'];
    fileLink = json['FileLink'];
    fileSize = json['FileSize'];
    isDeleted = json['IsDeleted'];
    creationDate = json['CreationDate'];
    updatedDate = json['UpdatedDate'];
    updatedBy = json['UpdatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['RequestID'] = requestID;
    data['FileName'] = fileName;
    data['FilePath'] = filePath;
    data['FileLink'] = fileLink;
    data['FileSize'] = fileSize;
    data['IsDeleted'] = isDeleted;
    data['CreationDate'] = creationDate;
    data['UpdatedDate'] = updatedDate;
    data['UpdatedBy'] = updatedBy;
    return data;
  }
}
