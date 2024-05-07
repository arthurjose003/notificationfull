import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  //creating a new account
  static Future<String> createAccountWithEamil(String email,String password)async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return "Account Created";
    }on FirebaseAuthException catch(e){
      return e.message.toString();

    }catch(e){
      return e.toString(); 
    }
    

  }
  // login the user
  static Future <String> loginWithEmail(String email,String password)async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return "Login Successful";
    }on FirebaseAuthException catch(e){
      return e.message.toString();
    }catch(e){
      
      return e.toString();
    }
    
  }

  // logout the user
  static Future<String> logout( )async{
    try{
      await FirebaseAuth.instance.signOut();
      return" logout successfully";
    }on FirebaseAuthException catch(e){
      return e.message.toString();

    }catch(e){
      return e.toString();
    }
  } 
  //check user login or not 
  static Future<bool> isloggedin()async{
   var user=FirebaseAuth.instance.currentUser;
   return user!=null;
  }
}