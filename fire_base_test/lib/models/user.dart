class UserModel {
  String dateOfBirth = '';
  String fullName = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String phoneNumber = '0000000000';
  bool isSupervisor = false;
  bool isAgent = true;
  String regionCode = '';
  String area = '';
  String city = '';
  String pin = '';
  String state = '';
  bool isApprovedByAdmin = false;
  String createdOn = '';
  String approvedOn = '';

  UserModel(
      {String provided_dateOfBirth = '',
      String provided_fullName = '',
      String provided_email = '',
      String provided_password = '',
      String provided_confirmPassword = '',
      String provided_phoneNumber = '0000000000',
      bool provided_isSupervisor = false,
      bool provided_isAgent = true,
      String provided_regionCode = '',
      String provided_area = '',
      String provided_city = '',
      String provided_pin = '',
      String provided_state = '',
      bool provided_isApprovedByAdmin = false,
      String provided_createdOn = '',
      String provided_approvedOn = ''}) {
    dateOfBirth = provided_dateOfBirth;
    fullName = provided_fullName;
    email = provided_email;
    password = provided_password;
    confirmPassword = provided_confirmPassword;
    phoneNumber = provided_phoneNumber;
    isSupervisor = provided_isSupervisor;
    isAgent = provided_isAgent;
    regionCode = provided_regionCode;
    area = provided_area;
    city = provided_city;
    pin = provided_pin;
    state = provided_state;
    isApprovedByAdmin = provided_isApprovedByAdmin;
    createdOn = provided_createdOn;
    approvedOn = provided_approvedOn;
  }
}
