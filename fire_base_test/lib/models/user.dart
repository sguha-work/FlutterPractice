class UserModel {
  String dateOfBirth = '';
  String fullName = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String phoneNumber = '0000000000';
  bool isSupervisor = false;
  bool isAgent = true;

  UserModel({
    String userGiven_dateOfBirth = '',
    String userGiven_fullName = '',
    String userGiven_email = '',
    String userGiven_password = '',
    String userGiven_confirmPassword = '',
    String userGiven_phoneNumber = '0000000000',
    bool userGiven_isSupervisor = false,
    bool userGiven_isAgent = true,
  }) {
    dateOfBirth = userGiven_dateOfBirth;
    fullName = userGiven_fullName;
    email = userGiven_email;
    password = userGiven_password;
    confirmPassword = userGiven_confirmPassword;
    phoneNumber = userGiven_phoneNumber;
    isSupervisor = userGiven_isSupervisor;
    isAgent = userGiven_isAgent;
  }
}
