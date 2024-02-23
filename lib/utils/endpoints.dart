class APIEndPoints {
  static const String baseURL = 'http://172.20.10.3:8000/';
  static final AuthEndPoints authEndPoints = AuthEndPoints();
}

class AuthEndPoints {
  final String signIn = 'auth/login/';
  final String signOut = 'auth/logout/';

  final String signUp = 'users/register/';
  final String profile = 'users/user/';
  final String editUser = 'users/updateUser/';
  final String changePassword = 'users/change_password/';

  final String allMoods = 'notes/get_moods/';
  final String takeNote = 'notes/create_note/';
  final String allNotes = 'notes/get_notes/';
  final String detailNote = 'notes/detail_note/';
  final String editNote = 'notes/edit_note/';
  final String deleteNote = 'notes/delete_note/';
}
