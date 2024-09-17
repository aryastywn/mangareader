import 'package:flutter/material.dart';
import 'home.dart'; // Mengimpor halaman home
import 'user.dart'; // Mengimpor halaman user
import 'setting.dart'; // Mengimpor halaman setting

/// Widget utama dengan bottom navigation bar.
class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key}); // Konstruktor utama untuk MyBottomNavigationBar

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

/// State untuk MyBottomNavigationBar.
class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0; // Indeks tab yang saat ini dipilih

  late String _username; // Variabel untuk menyimpan nama pengguna
  late String _date; // Variabel untuk menyimpan tanggal

  @override
  void initState() {
    super.initState();
    // Menampilkan dialog sambutan setelah frame pertama selesai dirender
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showWelcomeDialog();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Mendapatkan argumen yang diteruskan ke rute ini
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    if (arguments != null) {
      _username = arguments['username'] ?? 'User'; // Menetapkan nama pengguna dari argumen atau 'User' jika tidak ada
      _date = arguments['date'] ?? 'Not specified'; // Menetapkan tanggal dari argumen atau 'Not specified' jika tidak ada
    } else {
      _username = 'User'; // Nilai default jika tidak ada argumen
      _date = 'Not specified'; // Nilai default jika tidak ada argumen
    }
  }

  /// Menampilkan dialog sambutan saat aplikasi dimulai
  void _showWelcomeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Welcome'), // Judul dialog
          content: Text('Welcome $_username!'), // Konten dialog menampilkan nama pengguna
          actions: <Widget>[
            TextButton(
              child: const Text('OK'), // Tombol OK untuk menutup dialog
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
            ),
          ],
        );
      },
    );
  }

  // Daftar widget yang dapat dipilih di bottom navigation bar
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(), // Halaman utama
    UserPage(), // Halaman profil pengguna
    SettingPage(), // Halaman pengaturan
  ];

  /// Menangani perubahan tab pada bottom navigation bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Mengatur tab yang dipilih
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Miaw.Peduli', // Judul aplikasi di AppBar
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    offset: const Offset(0, 2),
                    blurRadius: 3.0,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Icon(Icons.person, color: Colors.white), // Ikon person di sebelah nama pengguna
                const SizedBox(width: 8), // Jarak antara ikon dan teks
                Text(
                  _username, // Menampilkan nama pengguna di AppBar
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.pink[300], // Warna latar belakang AppBar
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex), // Menampilkan widget sesuai tab yang dipilih
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon untuk tab Home
            label: 'Home', // Label untuk tab Home
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Ikon untuk tab User
            label: 'User', // Label untuk tab User
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings), // Ikon untuk tab Setting
            label: 'Setting', // Label untuk tab Setting
          ),
        ],
        currentIndex: _selectedIndex, // Indeks tab yang saat ini dipilih
        selectedItemColor: Colors.pink, // Warna item yang dipilih
        onTap: _onItemTapped, // Menangani klik pada item bottom navigation bar
      ),
    );
  }
}
