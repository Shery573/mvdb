import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:mvdb/Utilities/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              backgroundColor: green,
              textStyle: const TextStyle(
                color: Colors.black,
                fontFamily: 'Sora',
              )),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: blue,
          hintStyle: GoogleFonts.lexendDeca(
            textStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white),),
          border: OutlineInputBorder(

              borderSide: const BorderSide(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),
      initialRoute: AppRoutes.initalRoute,
      getPages: AppRoutes.pages,
    );
  }
}
