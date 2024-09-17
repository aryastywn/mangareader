import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Halaman login aplikasi
class LoginPage extends StatefulWidget {
  const LoginPage({super.key}); // Konstruktor untuk LoginPage

  @override
  State<LoginPage> createState() => _LoginPageState(); // Mengembalikan state untuk LoginPage
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController(); // Kontroller untuk field username
  final _passwordController = TextEditingController(); // Kontroller untuk field password
  bool _obscurePassword = true; // Menyembunyikan password secara default
  DateTime? _selectedDate; // Menyimpan tanggal yang dipilih

  // Fungsi untuk memilih tanggal
  void _selectDate() async {
    // Menampilkan dialog pemilih tanggal
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Tanggal awal yang ditampilkan adalah tanggal saat ini
      firstDate: DateTime(1900), // Tanggal pertama yang dapat dipilih
      lastDate: DateTime(2100), // Tanggal terakhir yang dapat dipilih
    );
    if (picked != null && picked != _selectedDate) {
      // Memperbarui tanggal yang dipilih jika berbeda
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Fungsi untuk menangani login
  void _login() {
    // Implementasikan logika login di sini
    final username = _usernameController.text; // Mendapatkan username dari controller
    final password = _passwordController.text; // Mendapatkan password dari controller
    final formattedDate = _selectedDate != null
        ? DateFormat('yyyy-MM-dd').format(_selectedDate!) // Memformat tanggal jika ada
        : '';

    // Mengarahkan ke halaman home dengan membawa data username dan tanggal
    Navigator.of(context).pushReplacementNamed(
      '/home',
      arguments: {
        'username': username,
        'date': formattedDate,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Miaw.peduli'), // Judul aplikasi di AppBar
        backgroundColor: Colors.pink[300], // Warna latar belakang AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding di sekitar seluruh body
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Menyelaraskan widget di tengah-tengah kolom
          children: <Widget>[
            TextField(
              controller: _usernameController, // Menghubungkan kontroller untuk username
              decoration: const InputDecoration(
                labelText: 'Username', // Label untuk field username
                border: OutlineInputBorder(), // Menambahkan border pada field
              ),
            ),
            const SizedBox(height: 16), // Jarak vertikal antara field username dan password
            TextField(
              controller: _passwordController, // Menghubungkan kontroller untuk password
              obscureText: _obscurePassword, // Menyembunyikan teks password jika perlu
              decoration: InputDecoration(
                labelText: 'Password', // Label untuk field password
                border: const OutlineInputBorder(), // Menambahkan border pada field
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off, // Ikon untuk mengubah visibilitas password
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword; // Mengubah status visibilitas password
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16), // Jarak vertikal antara field password dan tanggal lahir
            GestureDetector(
              onTap: _selectDate, // Memanggil fungsi _selectDate saat field diketuk
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: _selectedDate == null
                        ? 'Born Date' // Label jika tanggal belum dipilih
                        : 'Born Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}', // Label dengan tanggal yang dipilih
                    border: const OutlineInputBorder(), // Menambahkan border pada field
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32), // Jarak vertikal antara field tanggal lahir dan tombol login
            ElevatedButton(
              onPressed: _login, // Memanggil fungsi _login saat tombol ditekan
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[300], // Warna latar belakang tombol
                foregroundColor: Colors.white, // Warna teks tombol
                padding: const EdgeInsets.symmetric(vertical: 16.0), // Padding vertikal di sekitar teks tombol
                textStyle: const TextStyle(fontSize: 16), // Ukuran font untuk teks tombol
              ),
              child: const Text('Login'), // Teks tombol
            ),
          ],
        ),
      ),
    );
  }
}
