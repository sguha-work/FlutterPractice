class UserModel {
  String dateOfBirth = '';
  String fullName = '';
  String email = '';
  String password = '';
  String phoneNumber = '0000000000';
  String userType = 'agent'; // 'supervisor', 'admin'
  String regionCode = '';
  String area = '';
  String city = '';
  String pin = '';
  String state = '';
  bool isApprovedByAdmin = false;
  String createdOn = '';
  String approvedOn = '';

  UserModel(
      {this.dateOfBirth = '',
      this.fullName = '',
      this.email = '',
      this.password = '',
      this.phoneNumber = '0000000000',
      this.userType = 'agent',
      this.regionCode = '',
      this.area = '',
      this.city = '',
      this.pin = '',
      this.state = '',
      this.isApprovedByAdmin = false,
      this.createdOn = '',
      this.approvedOn = ''}) {}
}
