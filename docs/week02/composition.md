GameHeader
Trigger: Readability (memisahkan bagian header sapaan atau banner agar kode utama layar tidak terlalu padat).
What it owns: Bersifat statis dan tidak memegang state dinamis.
What it reports upward: Tidak ada (stateless display).

GameSearchBar
Trigger: Reusability dan readability (komponen input pencarian mandiri).
What it owns: Mengelola referensi TextEditingController.
What it reports upward: Melaporkan perubahan teks melalui callback onChanged dan aksi hapus melalui onClear.

GameItemCard
Trigger: Reusability (digunakan berulang kali di dalam ListView.builder untuk menampilkan daftar game).
What it owns: Menerima data satu item map game.
What it reports upward: Melaporkan aksi klik kartu melalui callback onTap.

EmptyGameState
Trigger: Readability (menangani tampilan antarmuka ketika hasil pencarian kosong).
What it owns: Teks query pencarian saat ini.
What it reports upward: Melaporkan aksi reset pencarian ke widget induk melalui callback onResetSearch.