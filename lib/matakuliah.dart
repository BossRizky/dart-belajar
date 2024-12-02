class MataKuliah {
  String kode;  // Menyimpan kode unik mata kuliah
  String nama;  // Menyimpan nama mata kuliah
  int sks;      // Menyimpan jumlah SKS (Satuan Kredit Semester) untuk mata kuliah

  // Konstruktor untuk inisialisasi objek MataKuliah dengan kode, nama, dan sks
  MataKuliah(this.kode, this.nama, this.sks);

  // Override method toString() untuk menampilkan representasi objek MataKuliah
  @override
  String toString() => "MataKuliah(kode: $kode, nama: $nama, sks: $sks)";
}
