import 'package:binhi/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BinhiTheme {
  static final ThemeData lightTheme = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: primary,
      onPrimary: Colors.white,
      secondary: Color(0xFF5A5A5A),
      surface: Color(0xFFFFFFFFF),
      onSurface: Color(0xFF353535),
    ),
    drawerTheme: DrawerThemeData(
         width: 280,
       shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
       backgroundColor: drawer
    )
  );

  static final ThemeData darkTheme = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    scaffoldBackgroundColor: scaffoldBGDark,
    colorScheme: const ColorScheme.dark(
      primary: primary,
      onPrimary: Colors.black,
      secondary: Color(0xFFAAAAAA),
      surface: Color(0xFF1E1E1E),
      onSurface: Color(0xFFAAAAAA),
    ),
      drawerTheme: DrawerThemeData(
        width: 280,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
      backgroundColor: drawerDark
    )
  );
}
