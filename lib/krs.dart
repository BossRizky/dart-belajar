import 'matakuliah.dart';

class KRS {
  List<MataKuliah> daftarMataKuliah;  // Daftar mata kuliah yang akan diambil oleh mahasiswa

  // Konstruktor untuk inisialisasi daftar mata kuliah
  KRS(this.daftarMataKuliah);

  // Fungsi untuk mencetak Kartu Rencana Studi (KRS)
  void cetakKRS() {
    print("Kartu Rencana Studi:");
    
    // Menampilkan informasi setiap mata kuliah dalam daftar
    for (var mk in daftarMataKuliah) {
      print("${mk.kode} - ${mk.nama} (${mk.sks} SKS)");  // Menampilkan kode, nama mata kuliah, dan jumlah SKS
    }
  }
}
