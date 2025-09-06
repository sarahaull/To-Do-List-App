<img width="1913" height="927" alt="Screenshot 2025-09-06 101359" src="https://github.com/user-attachments/assets/c73e4d15-2efb-45e4-b72f-a69cfcafec48" /># To-Do-List-App

Deskripsi
Aplikasi Todo App sederhana menggunakan Flutter.
Fitur utama:
Tambah, hapus, dan centang task.
Menampilkan daftar todo aktif.
Menyimpan riwayat task yang sudah selesai.


Struktur Folder
lib/
 ├── models/
 │    └── todo.dart
 ├── page/
 │    ├── history_page.dart
 │    ├── home_page.dart
 │    └── todo_list_page.dart
 ├── services/
 │    └── todo_services.dart
 ├── widgets/
 │    └── todo_item.dart
 └── main.dart

 Pendekatan State Management :
Aplikasi ini menggunakan StatefulWidget + setState sebagai pendekatan state management.


Alasan:
Aplikasi masih sederhana, sehingga tidak membutuhkan solusi state management yang kompleks (seperti Provider, Riverpod, atau Bloc).
setState cukup efisien untuk update UI secara cepat pada skala kecil.
Struktur kode tetap bersih dan mudah dipahami.


#  DEMO #


<img width="1919" height="951" alt="Screenshot 2025-09-06 101415" src="https://github.com/user-attachments/assets/e51d457b-b2b5-46b1-a7b2-9dea69241b8b" />
<img width="1913" height="927" alt="Screenshot 2025-09-06 101359" src="https://github.com/user-attachments/assets/c8d941d6-4b8d-4286-8f48-9937ed8f4dcb" />
<img width="1919" height="800" alt="Screenshot 2025-09-06 101447" src="https://github.com/user-attachments/assets/4bd3be64-91db-4244-b2ce-c4ca3e1e0b3b" />
<img width="1915" height="925" alt="Screenshot 2025-09-06 101435" src="https://github.com/user-attachments/assets/0cbce66e-d77f-4ce4-80d5-d96794db42b1" />


