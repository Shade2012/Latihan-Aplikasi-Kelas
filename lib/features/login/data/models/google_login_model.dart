

import 'package:google_sign_in/google_sign_in.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/domain/entities/google_login_entities.dart';

import '../../domain/entities/login_entities.dart';

class GoogleLoginModel extends GoogleLoginEntities {
  GoogleLoginModel({
    required String? displayName,
    required String email,
    required String? photoUrl
  }) : super(profilePicture:photoUrl ?? '',email: email,name: displayName ?? '' );

  factory GoogleLoginModel.fromGoogleSignIn(GoogleSignInAccount account) {
    return GoogleLoginModel(
      displayName: account.displayName,
      email: account.email,
      photoUrl: account.photoUrl,
    );
  }
}
