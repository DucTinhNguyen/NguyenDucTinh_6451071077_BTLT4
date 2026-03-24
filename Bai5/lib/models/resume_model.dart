class ResumeModel {
  String fullName;
  String email;
  String? fileName;
  bool isConfirmed;

  ResumeModel({
    this.fullName = '',
    this.email = '',
    this.fileName,
    this.isConfirmed = false,
  });
}