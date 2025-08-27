enum RoutesName {
  splash,

  // Sign flow
  wizard,
  welcomeSign,
  emailSignUp,
  emailSignIn,
  passwordRecovery,
  subscription,

  // Main flow
  home,

  // Store flow
  store,
  cart;

  String get rootPath => switch (this) {
    home => '/',
    _ => '/$name',
  };

  String get path => name;

  const RoutesName();
}
