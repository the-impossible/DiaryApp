import 'package:diary/views/all_notes.dart';
import 'package:diary/views/change_password.dart';
import 'package:diary/views/detail_note.dart';
import 'package:diary/views/editProfile.dart';
import 'package:diary/views/edit_note.dart';
import 'package:diary/views/home.dart';
import 'package:diary/views/sign_in.dart';
import 'package:diary/views/sign_up.dart';
import 'package:diary/views/splash_screen.dart';
import 'package:diary/views/take_note.dart';
import 'package:get/get.dart';

class Routes {
  static String splash = '/';
  static String signUp = '/signUp';
  static String signIn = '/signIn';
  static String home = '/home';
  static String takeNote = '/takeNote';
  static String allNotes = '/allNotes';
  static String detailNote = '/detailNote';
  static String editNote = '/editNote';
  static String editProfile = '/editProfile';
  static String changePassword = '/changePassword';
}

final getPages = [
  GetPage(
    name: Routes.splash,
    page: () => const Splash(),
  ),
  GetPage(
    name: Routes.signUp,
    page: () => const SignUp(),
  ),
  GetPage(
    name: Routes.signIn,
    page: () => const SignIn(),
  ),
  GetPage(
    name: Routes.home,
    page: () => Home(),
  ),
  GetPage(
    name: Routes.takeNote,
    page: () => const TakeNote(),
  ),
  GetPage(
    name: Routes.allNotes,
    page: () => AllNotes(),
  ),
  GetPage(
    name: Routes.detailNote,
    page: () => const DetailNote(),
  ),
  GetPage(
    name: Routes.editNote,
    page: () => const EditNote(),
  ),
  GetPage(
    name: Routes.editProfile,
    page: () => const EditProfile(),
  ),
  GetPage(
    name: Routes.changePassword,
    page: () => const ChangePassword(),
  ),
];
