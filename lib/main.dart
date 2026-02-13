
import 'package:firebase_core/firebase_core.dart';
import 'package:fixem/routes/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb)
  {
    await Firebase.initializeApp(options:FirebaseOptions( 

  apiKey: "AIzaSyAF17IsbqY4xf1IARlTWzPblp0TiGMbUbg",
  authDomain: "fix-em-6b9bd.firebaseapp.com",
  projectId: "fix-em-6b9bd",
  storageBucket: "fix-em-6b9bd.firebasestorage.app",
  messagingSenderId: "237384106925",
  appId: "1:237384106925:web:f23e9f60ffb1c9777b9724"
  ) );

  }else{
    await  Firebase.initializeApp();

  }

    
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      debugShowCheckedModeBanner: false,
      initialRoute: RouteManger.homePage,
      onGenerateRoute: RouteManger.generateRoute,
    );
  }
}
