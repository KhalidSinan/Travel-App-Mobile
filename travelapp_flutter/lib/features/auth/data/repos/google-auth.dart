import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
<<<<<<< HEAD
=======
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
>>>>>>> Khalid

class AuthGoogle {
  signInWithGoogle() async {
    final GoogleSignInAccount? user = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication auth = await user!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken, idToken: auth.idToken);
<<<<<<< HEAD

=======
    final AuthRepoImpl authRepoImpl = getIt.get<AuthRepoImpl>();
    var response = await authRepoImpl.googleAuth(
        name: user.displayName!,
        email: user.email,
        googleId: user.id,
        photoUrl: user.photoUrl);
    print(response);
>>>>>>> Khalid
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
