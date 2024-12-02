class Mahasiswa {
  String nim;       // Menyimpan NIM (Nomor Induk Mahasiswa) mahasiswa
  String nama;      // Menyimpan nama mahasiswa
  int semester;     // Menyimpan semester mahasiswa

  // Konstruktor untuk inisialisasi objek Mahasiswa dengan NIM, Nama, dan Semester
  Mahasiswa(this.nim, this.nama, this.semester);

  // Override method toString() untuk menampilkan representasi objek Mahasiswa
  @override
  String toString() => "Mahasiswa(nim: $nim, nama: $nama, semester: $semester)";
}
