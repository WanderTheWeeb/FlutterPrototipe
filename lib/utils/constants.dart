import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase client
final supabase = Supabase.instance.client;

/// Simple preloader inside a Center widget
const preloader = Center(
    child: CircularProgressIndicator(color: Color.fromRGBO(12, 70, 173, 1)));

/// Simple sized box to space out form elements
const formSpacer = SizedBox(width: 16, height: 16);

/// Some padding for all the forms to use
const formPadding = EdgeInsets.symmetric(vertical: 20, horizontal: 16);

/// Error message to display the user when unexpected error occurs.
const unexpectedErrorMessage = 'Unexpected error occured.';

/// Basic theme to change the look and feel of the app
final appTheme = ThemeData.light().copyWith(
    primaryColorDark: const Color.fromRGBO(12, 70, 173, 1),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      elevation: 1,
      backgroundColor: Color.fromRGBO(12, 70, 173, 1),
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),

    drawerTheme: const DrawerThemeData(
      width: 230,
      backgroundColor: Colors.black38,
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
    ),

    iconTheme: const IconThemeData(
      color: Colors.white,
    ),

    tabBarTheme: const TabBarTheme(
        labelColor: Colors.white, unselectedLabelColor: Colors.grey),

    scaffoldBackgroundColor: Colors.white,

    listTileTheme: const ListTileThemeData(
      iconColor: Colors.white,
      textColor: Colors.white,
    ),

    primaryColor: const Color.fromRGBO(12, 70, 173, 1),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color.fromRGBO(12, 70, 173, 1),
      ),
    ),

    dividerTheme: const DividerThemeData(
      color: Colors.grey
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(12, 70, 173, 1),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      outlineBorder: const BorderSide(color: Colors.black12),
      floatingLabelStyle: const TextStyle(
        color: Color.fromRGBO(12, 70, 173, 1),
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 2,
        ),
      ),

      focusColor: const Color.fromRGBO(12, 70, 173, 1),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color.fromRGBO(12, 70, 173, 1),
          width: 2,
        ),
      ),
    ),

    snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(color: Colors.black)));

/// Set of extension methods to easily display a snackbar
extension ShowSnackBar on BuildContext {
  /// Displays a basic snackbar
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.white,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ));
  }

  /// Displays a red snackbar indicating error
  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}
