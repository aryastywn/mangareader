import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil data dari argumen yang dikirimkan ke route ini
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    final username = arguments?['username'] ?? 'Unknown User'; // Menentukan nilai default jika 'username' tidak ada
    final date = arguments?['date'] ?? 'Date not selected'; // Menentukan nilai default jika 'date' tidak ada

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Menyusun elemen-elemen di tengah kolom
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0), // Padding di sekitar ikon
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Bentuk container adalah lingkaran
                color: Colors.pink[50], // Warna latar belakang lingkaran
              ),
              child: Icon(
                Icons.person,
                size: 100, // Ukuran ikon
                color: Colors.pink[200], // Warna ikon
              ),
            ),
            const SizedBox(height: 16), // Jarak vertikal antara elemen
            Text(
              'Username: $username',
              style: TextStyle(
                fontSize: 24, // Ukuran font
                fontWeight: FontWeight.bold, // Ketebalan font
                color: Colors.pink[200], // Warna teks
              ),
            ),
            const SizedBox(height: 16), // Jarak vertikal antara elemen
            Text(
              'Born Date: $date',
              style: TextStyle(
                fontSize: 24, // Ukuran font
                fontWeight: FontWeight.bold, // Ketebalan font
                color: Colors.pink[200], // Warna teks
              ),
            ),
          ],
        ),
      ),
    );
  }
}
