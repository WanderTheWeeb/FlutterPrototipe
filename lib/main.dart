import 'package:MindWell/cubit/rooms/rooms_cubit.dart';
import 'package:MindWell/pages/information_page.dart';
import 'package:MindWell/pages/introduction_page.dart';
import 'package:MindWell/pages/introscreen/aboutus_page.dart';
import 'package:MindWell/pages/introscreen/aclaraciones_page.dart';
import 'package:MindWell/pages/introscreen/terms&condition_page.dart';
import 'package:MindWell/pages/introscreen/welcome_page.dart';
import 'package:MindWell/pages/price_plan_page.dart';
import 'package:MindWell/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MindWell/pages/chat_page.dart';
import 'package:MindWell/pages/login_page.dart';
import 'package:MindWell/pages/register_psi_page.dart';
import 'package:MindWell/pages/rooms_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'cubit/profile/profiles_cubit.dart';
import 'pages/splash_page.dart';
import 'utils/constants.dart';
import 'pages/loguin_psi_page.dart';
import 'pages/login_org.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfilesCubit>(
          create: (context) => ProfilesCubit(),
        ),
        BlocProvider<RoomCubit>(
          create: (context) => RoomCubit(),
        )
      ],
      child: MaterialApp(
        routes: {
          '/LoginPage': (context) => const LoginPage(),
          '/RegisterScreen': (context) => const RegisterPage(
                isRegistering: false,
              ),
          '/ChatScreen': (context) => const ChatPage(),
          '/RoomsPage': (context) => const RoomsPage(),
          '/RegisterPsiScreen': (context) => const RegisterPsiPage(),
          '/IntroductionScreen': (context) => const IntroductionScreen(),
          '/Terminos&Condiciones': (context) => const TerminosCondiciones(),
          '/Aclaraciones': (context) => const Aclaraciones(),
          '/Bienvenida': (context) => const Bienvenida(),
          '/SplashScreen': (context) => const SplashPage(),
          '/AboutUs': (context) => const AboutUs(),
          '/PricePage': (context) => const PricePage(),
          '/InformationPage': (context) => const InformationPage(),
          '/Login_psi': (context) => LoginPsiPage(),
          '/Login_org': (context) => LoginOrg(),
        },
        title: 'MindWell',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const IntroductionScreen(),
      ),
    );
  }
}
