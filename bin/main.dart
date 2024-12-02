import 'dart:io';

import '../lib/mahasiswa.dart';
import '../lib/matakuliah.dart';
import '../lib/krs.dart';
import '../lib/nilai.dart';

void main() {
  // Menampilkan header utama program
  printHeader("SISTEM AKADEMIK MAHASISWA");

  // Input password sebelum melanjutkan
  printSection("LOGIN");
  String password = requestPassword();
  if (password != "udb") {
    printError("Password salah. Akses ditolak.");
    return;
  }

  // Input data Mahasiswa
  printSection("INPUT DATA MAHASISWA");
  printInputPrompt("Masukkan NIM");
  String nim = stdin.readLineSync() ?? "";  // Membaca input NIM dari pengguna
  printInputPrompt("Masukkan Nama");
  String nama = stdin.readLineSync() ?? "";  // Membaca input Nama mahasiswa
  printInputPrompt("Masukkan Semester");
  int semester = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;  // Membaca input Semester (dikonversi ke integer)

  // Membuat objek Mahasiswa dengan data yang diinputkan
  var mahasiswa = Mahasiswa(nim, nama, semester);
  printSuccess("Data mahasiswa berhasil dibuat.");
  printInfo("Mahasiswa: $mahasiswa");

  // Input data Mata Kuliah
  printSection("INPUT DATA MATA KULIAH");
  List<MataKuliah> mataKuliahList = [];  // Menyimpan daftar mata kuliah
  printInputPrompt("Berapa banyak mata kuliah yang ingin dimasukkan?");
  int jumlahMK = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;  // Membaca jumlah mata kuliah yang ingin dimasukkan

  // Loop untuk memasukkan mata kuliah sebanyak jumlahMK
  for (int i = 0; i < jumlahMK; i++) {
    print("\n📘 Mata Kuliah ke-${i + 1}");
    printInputPrompt("Masukkan Kode Mata Kuliah");
    String kode = stdin.readLineSync() ?? "";  // Membaca input kode mata kuliah
    printInputPrompt("Masukkan Nama Mata Kuliah");
    String namaMK = stdin.readLineSync() ?? "";  // Membaca input nama mata kuliah
    printInputPrompt("Masukkan Jumlah SKS");
    int sks = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;  // Membaca jumlah SKS dari input

    // Menambahkan mata kuliah yang dimasukkan ke dalam list mataKuliahList
    mataKuliahList.add(MataKuliah(kode, namaMK, sks));
  }

  // Membuat objek KRS (Kartu Rencana Studi) dengan daftar mata kuliah yang telah dimasukkan
  var krs = KRS(mataKuliahList);
  printSuccess("KRS berhasil dibuat.");
  krs.cetakKRS();  // Menampilkan KRS

  // Input Nilai
  printSection("INPUT NILAI MATA KULIAH");
  List<Nilai> nilaiList = [];  // Menyimpan daftar nilai mahasiswa untuk setiap mata kuliah
  for (var mataKuliah in mataKuliahList) {
    // Memasukkan nilai untuk setiap mata kuliah yang ada di daftar mataKuliahList
    printInputPrompt("Masukkan nilai untuk mata kuliah ${mataKuliah.nama}");
    double nilai = double.tryParse(stdin.readLineSync() ?? "0") ?? 0.0;  // Membaca input nilai (dikonversi ke double)
    nilaiList.add(Nilai(mataKuliah, nilai));  // Menambahkan objek Nilai ke dalam list nilaiList
  }

  // Hitung IPK (Indeks Prestasi Kumulatif)
  printSection("HASIL PERHITUNGAN");
  double ipk = Nilai.hitungIPK(nilaiList);  // Menghitung IPK berdasarkan daftar nilai
  printInfo("📊 IPK Mahasiswa: ${ipk.toStringAsFixed(2)}");  // Menampilkan IPK dengan dua digit desimal

  // Cetak Transkrip Nilai
  printSection("TRANSKRIP NILAI");
  for (var nilai in nilaiList) {
    nilai.cetakTranskrip();  // Menampilkan transkrip nilai untuk setiap mata kuliah
  }

  // Menampilkan footer program
  printFooter();
}

// Fungsi untuk menampilkan header utama program
void printHeader(String title) {
  print("\n═══════════════════════════════════════════════════════════════════════");
  print("                            $title                                     ");
  print("═══════════════════════════════════════════════════════════════════════\n");
}

// Fungsi untuk menampilkan judul bagian (section)
void printSection(String title) {
  print("\n───────────────────────────────────────────────────────────────────────");
  print(">> $title");
  print("───────────────────────────────────────────────────────────────────────\n");
}

// Fungsi untuk menampilkan garis pemisah
void printDivider() {
  print("\n───────────────────────────────────────────────────────────────────────\n");
}

// Fungsi untuk menampilkan footer program
void printFooter() {
  print("\n═══════════════════════════════════════════════════════════════════════");
  print("             Semangat Belajar dan Pertahankan Prestaasimu!               ");
  print("═══════════════════════════════════════════════════════════════════════\n");
}

// Fungsi untuk meminta input dari pengguna
void printInputPrompt(String prompt) {
  stdout.write("🔹 $prompt: ");
}

// Fungsi untuk menampilkan pesan sukses
void printSuccess(String message) {
  print("✅ $message\n");
}

// Fungsi untuk menampilkan pesan informasi
void printInfo(String message) {
  print("ℹ️  $message\n");
}

// Fungsi untuk meminta dan mengembalikan password
String requestPassword() {
  stdout.write("🔑 Masukkan password untuk melanjutkan: ");
  
  // Tidak menonaktifkan mode echo sehingga input password akan terlihat
  String password = stdin.readLineSync() ?? "";

  print("");  // Untuk membuat baris baru setelah input password
  return password;
}

// Fungsi untuk menampilkan pesan error
void printError(String message) {
  print("❌ $message\n");
}
