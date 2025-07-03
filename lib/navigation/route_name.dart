enum RoutesName {
  splash,
  wizard,

  welcomeSign,
  emailSignUp,
  emailSignIn,
  passwordRecovery,

  subscription,

  home;

  String get rootPath => switch (this) {
    home => '/',
    _ => '/$name',
  };

  String get path => name;

  const RoutesName();
}
