// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// Halaman utama aplikasi yang menampilkan daftar manga
class HomePage extends StatelessWidget {
  const HomePage({super.key}); // Konstruktor utama untuk HomePage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Menggunakan SingleChildScrollView untuk memungkinkan scroll jika konten melebihi layar
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Banner section
            Container(
              width: double.infinity, // Mengatur lebar banner agar memenuhi lebar layar
              height: 200, // Tinggi banner
              decoration: BoxDecoration(
                color: Colors.pink[100] // Warna latar belakang banner
              ),
              child: Center(
                child: Text(
                  'Selamat Datang di Manga Reader!',
                  textAlign: TextAlign.center, // Menyelaraskan teks di tengah
                  style: TextStyle(
                    fontSize: 24, // Ukuran font untuk teks
                    fontWeight: FontWeight.bold, // Ketebalan font
                    color: Colors.white, // Warna teks
                    shadows: [
                      Shadow(
                        offset: Offset(0, 1), // Offset bayangan
                        blurRadius: 3.0, // Jarak blur bayangan
                        color: Colors.black.withOpacity(0.5), // Warna bayangan dengan transparansi
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20), // Jarak vertikal antara banner dan deskripsi

            // Description section
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.all(16.0), // Padding sekitar teks deskripsi
              child: Text(
                'Temukan manga favorit Anda di sini dan nikmati berbagai koleksi manga terbaru yang kami tawarkan.',
                textAlign: TextAlign.center, // Menyelaraskan teks di tengah
                style: TextStyle(
                  fontSize: 16, // Ukuran font untuk teks deskripsi
                  color: Colors.black54, // Warna teks
                ),
              ),
            ),
            const SizedBox(height: 20), // Jarak vertikal antara deskripsi dan grid manga

            // Manga Preview Grid
            // Menggunakan SizedBox untuk memberikan tinggi pada GridView
            SizedBox(
              height: 400, // Tinggi grid berdasarkan konten yang diharapkan
              child: GridView.builder(
                padding: const EdgeInsets.all(20.0), // Padding di sekitar grid
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Jumlah kolom dalam grid
                  crossAxisSpacing: 8.0, // Jarak horizontal antara item grid
                  mainAxisSpacing: 8.0, // Jarak vertikal antara item grid
                ),
                itemCount: _mangaItems.length, // Jumlah item dalam grid
                itemBuilder: (context, index) {
                  final manga = _mangaItems[index]; // Mendapatkan manga berdasarkan indeks
                  return _buildMangaPreview(manga); // Membangun widget pratinjau manga
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Data manga contoh
final List<MangaItem> _mangaItems = [
  MangaItem(
      title: 'Solo Leveling',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/id/9/99/Solo_Leveling_Webtoon.png'),
  MangaItem(
      title: 'Noblesse',
      imageUrl:
          'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/74/2024/07/01/1106728-957770328.jpg'),
  MangaItem(
      title: 'Freya',
      imageUrl:
          'https://cdn0-production-images-kly.akamaized.net/eqDct11zGwKOPRGiQzpXn2Imm1s=/800x1066/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/4653258/original/087187700_1700235754-JKT48_Freya.jpg'),
  MangaItem(
      title: 'Lord Stark',
      imageUrl:
          'https://static.wikia.nocookie.net/gameofthrones/images/5/5c/Eddard_1x01.jpg/revision/latest/scale-to-width-down/270?cb=20120511213934'),
  // Tambahkan lebih banyak item manga di sini
];

// Fungsi untuk membangun pratinjau manga
Widget _buildMangaPreview(MangaItem manga) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0), // Menambahkan sudut melengkung pada kotak
      boxShadow: const [
        BoxShadow(
          color: Colors.black26, // Warna bayangan
          blurRadius: 4.0, // Jarak blur bayangan
          offset: Offset(0, 2), // Offset bayangan
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8.0), // Menambahkan sudut melengkung pada gambar
      child: Stack(
        fit: StackFit.expand, // Mengisi seluruh area Stack
        children: <Widget>[
          Image.network(
            manga.imageUrl, // URL gambar manga
            fit: BoxFit.cover, // Mengisi gambar di dalam area tanpa distorsi
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black54, // Warna latar belakang teks
              padding: const EdgeInsets.all(8.0), // Padding di sekitar teks
              child: Text(
                manga.title, // Judul manga
                style: const TextStyle(
                  color: Colors.white, // Warna teks
                  fontWeight: FontWeight.bold, // Ketebalan font
                  fontSize: 16, // Ukuran font
                ),
                overflow: TextOverflow.ellipsis, // Menambahkan ellipsis jika teks terlalu panjang
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

// Kelas untuk menyimpan informasi manga
class MangaItem {
  final String title; // Judul manga
  final String imageUrl; // URL gambar manga

  MangaItem({required this.title, required this.imageUrl}); // Konstruktor untuk MangaItem
}
