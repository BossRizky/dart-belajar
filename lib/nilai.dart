import 'matakuliah.dart';

class Nilai {
  MataKuliah mataKuliah;  // Menyimpan objek MataKuliah yang terkait dengan nilai
  double nilai;           // Menyimpan nilai yang diperoleh mahasiswa untuk mata kuliah tersebut

  // Konstruktor untuk inisialisasi objek Nilai dengan mata kuliah dan nilai yang diberikan
  Nilai(this.mataKuliah, this.nilai);

  // Fungsi statis untuk menghitung IPK (Indeks Prestasi Kumulatif) berdasarkan daftar nilai
  static double hitungIPK(List<Nilai> daftarNilai) {
    double totalNilai = 0;  // Variabel untuk menyimpan total nilai yang dihitung berdasarkan SKS
    int totalSKS = 0;       // Variabel untuk menyimpan total SKS yang diambil

    // Loop untuk menghitung total nilai dan total SKS dari daftar nilai
    for (var nilai in daftarNilai) {
      totalNilai += nilai.nilai * nilai.mataKuliah.sks;  // Menghitung total nilai berdasarkan nilai dan SKS
      totalSKS += nilai.mataKuliah.sks;  // Menambahkan SKS mata kuliah ke total SKS
    }

    // Menghitung IPK dengan membagi total nilai dengan total SKS, jika total SKS lebih besar dari 0
    return totalSKS > 0 ? totalNilai / totalSKS : 0.0;  // Jika tidak ada SKS, IPK 0
  }

  // Fungsi untuk mencetak transkrip nilai mata kuliah
  void cetakTranskrip() {
    print("Transkrip Nilai:");
    print("${mataKuliah.nama} - Nilai: $nilai");  // Menampilkan nama mata kuliah dan nilai yang diperoleh
  }
}
