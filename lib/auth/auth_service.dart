import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService{

  final SupabaseClient _supabase = Supabase.instance.client;

  //signup
Future<AuthResponse> signUpWithMail ({ required String email,required String password , required username }) async{
  
  
  return await _supabase.auth.signUp(
      email: email,
      password: password,

  ).then((authRepsonse)async{

    print('email${email},password${password}');

    if (authRepsonse.session != null) {

      print('email${email},password${password}');
      await _supabase.auth.updateUser(UserAttributes(
          data: {'username': username,
            'updated_at': DateTime.now().toIso8601String()}
      ));
    }
    return authRepsonse;
    
  });



}

  //signin
Future<AuthResponse> signInWithMail({required String email, required String password}) async{
  return await _supabase.auth.signInWithPassword(email: email,password: password);
}


  //signout

Future<void> signOut() async{
  await _supabase.auth.signOut();
}


}