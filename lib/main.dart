import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santes/pages/chat_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'cubit/profile/profiles_cubit.dart';
import 'pages/splash_page.dart';
import 'utils/constants.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://zbqsqtuaobhkzrneqjuw.supabase.co',
    anonKey:
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpicXNxdHVhb2Joa3pybmVxanV3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTkwNTMzMjAsImV4cCI6MjAxNDYyOTMyMH0.OateYbq2LrEt7DmoapCGWmUZ0ttKb4YUakZfaobopT4',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfilesCubit>(
      create: (context) => ProfilesCubit(),
      child: MaterialApp(
        routes: {
          '/ChatScreen' : (context) => const ChatPage(),
        },
        title: 'SanteChat',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const SplashPage(),
      ),
    );
  }
}
