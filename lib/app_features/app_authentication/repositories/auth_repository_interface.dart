abstract class AuthRepositoryInterface {
  Future<void> onAppStart();
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();

  Future<void> registerWithEmailAndPassword(String email, String password);

  Future<void> signInWithGoogle();
}
