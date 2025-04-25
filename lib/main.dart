import 'package:daytask/app/theme.dart';
import 'package:daytask/auth/auth_service.dart';
import 'package:daytask/auth/login_screen.dart';
import 'package:daytask/auth/signup_screen.dart';
import 'package:daytask/dashboard/dashboard_screen.dart';
import 'package:daytask/dashboard/task_service.dart';
import 'package:daytask/services/supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await InitializeSupabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.DarkTheme,
      home: StreamBuilder<AuthState>(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: ( BuildContext context,AsyncSnapshot<AuthState> snapshot){

           if(snapshot.hasData) {
            final authEvent = snapshot.data! ;
            final session = authEvent.session ;
            if (session != null){

               return ChangeNotifierProvider(
                   create: (context) => TaskService(),
                   child: DashboardScreen());
            }
          }
          return LoginScreen();

      },
      ),
      // initialRoute: '/signIn',
      routes: {
        '/signIn': (context)=>LoginScreen(),
        '/signUp': (context)=>SignupScreen(),
        '/home' : (context)=>DashboardScreen(),
      },
    );
  }
}
