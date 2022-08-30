
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

bool authSignedIn;
String uid;
String name;
String email;
String imageUrl;

Future getUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  authSignedIn = prefs.getBool('auth') ?? false;

  if (authSignedIn == true) {
    if (googleSignIn.currentUser != null) {
      uid = googleSignIn.currentUser.id;
      name = googleSignIn.currentUser.displayName;
      email = googleSignIn.currentUser.email;
      imageUrl = googleSignIn.currentUser.photoUrl;
    }
  }
}

Future<String> signInWithGoogle() async {
    await googleSignIn.signIn();

  if(googleSignIn.currentUser!=null) {
    // Checking if email and name is null
    assert(googleSignIn.currentUser.id != null);
    assert(googleSignIn.currentUser.email != null);
    assert(googleSignIn.currentUser.displayName != null);
    assert(googleSignIn.currentUser.photoUrl != null);

    uid = googleSignIn.currentUser.id;
    name = googleSignIn.currentUser.displayName;
    email = googleSignIn.currentUser.email;
    imageUrl = googleSignIn.currentUser.photoUrl;

    // Only taking the first part of the name, i.e., First Name
    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', true);
    authSignedIn = true;

    return 'signInWithGoogle succeeded: $googleSignIn.currentUser';
  }
  else
    return "error sign in";
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('auth', false);
  authSignedIn = false;

  print("User Sign Out");
}
