# Template Skripsi MIPA

Dengan pengubahan dari [https://luk.staff.ugm.ac.id/riset/panduan/fmipa/PanduanPenulisan.pdf](https://luk.staff.ugm.ac.id/riset/panduan/fmipa/PanduanPenulisan.pdf)

## Sebelum instalasi
Saya menggunakan beberapa package berikut:

* Miktex untuk windows => [http://miktex.org/download](http://miktex.org/download) atau untuk ubuntu mungkin bisa pakai package texlive yang ada di apt => `sudo apt-get install texlive-full`
* Untuk kompilasi agar tidak perlu terminal, saya pakai TexMaker download di sini [http://www.xm1math.net/texmaker/download.html](http://www.xm1math.net/texmaker/download.html). TexMaker ini memiliki kelebihan akan mengunduh package yang dibutuhkan secara otomatis.

## Memulai penulisan
1. Silahkan download atau clone repo ini `git clone https://github.com/yusufsyaifudin/template-skripsi-mipa.git`
2. Isi data awal di `CONFIG.tex`
3. Untuk pengaturan format proposal atau tugas akhir, ubah pada bagian`\ExecuteOptions` pada file `ugmskripsi.cls`. Gunakan parameter pertama "proposal" untuk format penulisan proposal, dan "skripsi" untuk penulisan Skripsi.
3. Silahkan edit tulisan untuk setiap bab.
4. Setelah itu, buka file `LAPORAN_SKRIPSI.tex` di TexMaker lalu coba compile. Akan ada file `LAPORAN_SKRIPSI.pdf`.

## LICENSE

![WTFPL](http://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl-badge-4.png "WTFPL")

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 1, Feburary 2016

 Copyright (c) 2016 Yusuf Syaifudin <yusuf.syaifudin@gmail.com>

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.

