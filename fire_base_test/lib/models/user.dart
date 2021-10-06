class User{
  String dateOfBirth = '';
  String fullName = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  User({String userGiven_dateOfBirth='',
  String userGiven_fullName='',
  String userGiven_email='',
  String userGiven_password='',
  String userGiven_confirmPassword=''}) {
    dateOfBirth = userGiven_dateOfBirth;
    fullName = userGiven_fullName;
    email = userGiven_email;
    password = userGiven_password;
    confirmPassword = userGiven_confirmPassword;
  }
}