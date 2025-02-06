// lib/models/sign_information_sign.dart
class Sign {
  final String title;
  final String imageUrl;

  Sign({
    required this.title,
    required this.imageUrl,
  });
}

class SignInformationSign {
  final List<Sign> signs;

  SignInformationSign({required this.signs});

  /// Create our model from a Map.
  /// Expects a key "text" with an array containing alternating title and image URL.
  factory SignInformationSign.fromMap(Map<String, dynamic> map) {
    List<dynamic> rawList = map['text'] ?? [];
    List<Sign> signList = [];

    // Loop in steps of 2 (assuming even-numbered list: title, url, title, url, …)
    for (int i = 0; i < rawList.length; i += 2) {
      if (i + 1 < rawList.length) {
        signList.add(Sign(
          title: rawList[i] as String,
          imageUrl: rawList[i + 1] as String,
        ));
      }
    }
    return SignInformationSign(signs: signList);
  }
}
