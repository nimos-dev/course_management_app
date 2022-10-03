abstract class AuthRepositoryInterface {
  Future<void> onAppStart();
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}
