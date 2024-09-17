import 'package:flutter/material.dart';
import 'layouts/login.dart'; // Import halaman login
import 'layouts/user.dart'; // Import halaman user
import 'layouts/setting.dart'; // Import halaman settings
import 'layouts/bottomnavbar.dart'; // Import halaman utama dengan bottom navigation bar

void main() {
  runApp(const MainApp()); // Menjalankan aplikasi dengan widget MainApp sebagai root widget
}

/// The root widget of the application.
class MainApp extends StatelessWidget {
  const MainApp({super.key}); // Konstruktor utama untuk MainApp

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Menetapkan rute awal aplikasi
      initialRoute: '/login',

      // Mendefinisikan rute yang ada dalam aplikasi
      routes: {
        // Rute untuk halaman login
        '/login': (context) => const LoginPage(),

        // Rute untuk halaman utama dengan bottom navigation bar
        '/home': (context) => const MyBottomNavigationBar(),

        // Rute untuk halaman profil pengguna
        '/user': (context) => const UserPage(),

        // Rute untuk halaman pengaturan
        '/settings': (context) => const SettingPage(),
      },
    );
  }
}
