## faq
* faq
   - respond_faq
   - slot{"kendaraan": null}

## chitchat
* chitchat
   - respond_chitchat

## harga_emas
* harga_emas
   - actions_harga_emas

## info_produk
* info_produk
   - actions_info_produk

## simulasi_emasku
* simulasi_emasku
   - emasku_form

## simulasi_amanah
* simulasi_amanah
   - amanah_form

## interactive_story_1
* faq{"tanya": "bagaimana", "cara": "cara", "kredit": "kredit", "kendaraan": "mobil"}
    - slot{"kendaraan": "mobil"}
    - respond_faq
    - slot{"kendaraan": null}

## interactive_story_2
* faq{"tanya": "bagaimana", "cara": "cara", "kredit": "kredit", "kendaraan": "mobil", "produk": "amanah"}
    - slot{"kendaraan": "mobil"}
    - slot{"produk": "amanah"}
    - respond_faq
    - slot{"kendaraan": null}

* faq{"kredit": "kredit", "kendaraan": "mobil", "tanya": "berapa", "batas": "sampai", "durasi": "lama"}
    - slot{"kendaraan": "mobil"}
    - respond_faq
    - slot{"kendaraan": null}
    
* faq{"tanya": "apa", "syarat": "syarat", "untuk": "buat", "kredit": "kredit", "produk": "amanah", "kendaraan": "motor"}
    - slot{"kendaraan": "motor"}
    - slot{"produk": "amanah"}
    - respond_faq
    - slot{"kendaraan": null}
* faq{"tanya": "bisa", "kredit": "kredit", "produk": "amanah"}
    - slot{"produk": "amanah"}
    - respond_faq
* faq{"untuk": "kalau", "kredit": "kredit", "kendaraan": "motor", "tanya": "berapa", "dp": "uang mukanya"}
    - slot{"kendaraan": "motor"}
    - respond_faq
    - slot{"kendaraan": null}
* faq{"tanya": "berapa", "bunga": "bunga", "untuk": "kalau", "kredit": "kredit", "kendaraan": "mobil"}
    - slot{"kendaraan": "mobil"}
    - respond_faq
    - slot{"kendaraan": null}
* faq{"tanya": "bisa", "kredit": "kredit", "kendaraan": "motor"}
    - slot{"kendaraan": "motor"}
    - respond_faq
    - slot{"kendaraan": null}
* faq{"tanya": "bisa", "transaksi": "beli", "produk": "emas"}
    - slot{"produk": "emas"}
    - respond_faq
* harga_emas{"harga": "harga", "emas": "emas", "tanya": "berapa"}
    - actions_harga_emas
* harga_emas{"tanya": "tanya", "harga": "harga", "emas": "emas", "berat": "3.5", "unit": "gram"}
    - slot{"berat": "3.5"}
    - slot{"unit": "gram"}
    - actions_harga_emas

## interactive_story_1
* harga_emas{"untuk": "kalau", "emas": "emas", "berat": "1.5", "unit": "gram", "tanya": "berapa", "harga": "harganya"}
    - slot{"berat": "1.5"}
    - slot{"unit": "gram"}
    - actions_harga_emas
* harga_emas{"harga": "harga", "emas": "emas", "berat": "10", "unit": "kilogram", "tanya": "berapa"}
    - slot{"berat": "10"}
    - slot{"unit": "kilogram"}
    - actions_harga_emas
* info_produk{"tanya": "apa", "produk": "amanah"}
    - slot{"produk": "amanah"}
    - actions_info_produk
* info_produk{"tanya": "apa", "produk": "mulia"}
    - slot{"produk": "mulia"}
    - actions_info_produk
* info_produk{"tanya": "tanya", "produk": "mulia kolektif"}
    - slot{"produk": "mulia kolektif"}
    - actions_info_produk
* info_produk{"tanya": "apa", "produk": "rahn bisnis"}
    - slot{"produk": "rahn bisnis"}
    - actions_info_produk

## interactive_story_1
* simulasi_emasku{"tanya": "berapa", "angsuran": "angsuran", "bulan": "bulanan", "produk": "emasku", "untuk": "untuk", "berat_emasku": "10", "unit": "gram"}
    - slot{"berat_emasku": "10"}
    - slot{"produk": "emasku"}
    - slot{"unit": "gram"}
    - emasku_form
    - form{"name": "emasku_form"}
    - slot{"berat_emasku": "10"}
    - slot{"berat_emasku": "10"}
    - slot{"requested_slot": "tenor_emasku"}
* form: inform{"tenor_emasku": "te- 15"}
    - slot{"tenor_emasku": "te- 15"}
    - form: emasku_form
    - slot{"tenor_emasku": null}
    - slot{"requested_slot": "tenor_emasku"}
* form: inform{"tenor_emasku": "te- 10"}
    - slot{"tenor_emasku": "te- 10"}
    - form: emasku_form
    - slot{"tenor_emasku": "10"}
    - slot{"berat_emasku": null}
    - slot{"tenor_emasku": null}
    - form{"name": null}
    - slot{"requested_slot": null}
* simulasi_emasku{"simulasi": "simulasi", "produk": "emasku", "berat_emasku": "7", "unit": "gram"}
    - slot{"berat_emasku": "7"}
    - slot{"produk": "emasku"}
    - slot{"unit": "gram"}
    - emasku_form
    - form{"name": "emasku_form"}
    - slot{"berat_emasku": null}
    - slot{"berat_emasku": null}
    - slot{"requested_slot": "berat_emasku"}
* form: inform{"berat_emasku": "b- 25"}
    - slot{"berat_emasku": "b- 25"}
    - form: emasku_form
    - slot{"berat_emasku": "25"}
    - slot{"requested_slot": "tenor_emasku"}
* form: inform{"tenor_emasku": "te- 20"}
    - slot{"tenor_emasku": "te- 20"}
    - form: emasku_form
    - slot{"tenor_emasku": null}
    - slot{"requested_slot": "tenor_emasku"}
* form: inform{"tenor_emasku": "te- 7"}
    - slot{"tenor_emasku": "te- 7"}
    - form: emasku_form
    - slot{"tenor_emasku": "7"}
    - slot{"berat_emasku": null}
    - slot{"tenor_emasku": null}
    - form{"name": null}
    - slot{"requested_slot": null}

## interactive_story_1
* simulasi_amanah{"simulasi": "simulasi", "produk": "amanah"}
    - slot{"produk": "amanah"}
    - amanah_form
    - form{"name": "amanah_form"}
    - slot{"requested_slot": "kendaraan"}
* form: inform{"kendaraan": "mobil"}
    - slot{"kendaraan": "mobil"}
    - form: amanah_form
    - slot{"kendaraan": "mobil"}
    - slot{"requested_slot": "brand"}
* form: inform{"brand": "honda"}
    - slot{"brand": "honda"}
    - form: amanah_form
    - slot{"brand": null}
    - slot{"requested_slot": "brand"}
* form: inform{"brand": "toyota"}
    - slot{"brand": "toyota"}
    - form: amanah_form
    - slot{"brand": "toyota"}
    - slot{"requested_slot": "tipe"}
* form: inform{"tipe": "expander"}
    - slot{"tipe": "expander"}
    - form: amanah_form
    - slot{"tipe": null}
    - slot{"requested_slot": "tipe"}
* form: inform{"tipe": "rush"}
    - slot{"tipe": "rush"}
    - form: amanah_form
    - slot{"tipe": "RUSH"}
    - slot{"requested_slot": "uang_muka"}
* form: inform{"uang_muka": "5000000"}
    - slot{"uang_muka": "5000000"}
    - form: amanah_form
    - slot{"uang_muka": null}
    - slot{"requested_slot": "uang_muka"}
* form: inform{"uang_muka": "20000000"}
    - slot{"uang_muka": "20000000"}
    - form: amanah_form
    - slot{"uang_muka": null}
    - slot{"requested_slot": "uang_muka"}
* form: inform{"uang_muka": "100000000"}
    - slot{"uang_muka": "100000000"}
    - form: amanah_form
    - slot{"uang_muka": "100000000"}
    - slot{"requested_slot": "tenor_amanah"}
* form: inform{"tenor_amanah": "ta- 100"}
    - slot{"tenor_amanah": "ta- 100"}
    - form: amanah_form
    - slot{"tenor_amanah": null}
    - slot{"requested_slot": "tenor_amanah"}
* form: inform{"tenor_amanah": "ta- 36"}
    - slot{"tenor_amanah": "ta- 36"}
    - form: amanah_form
    - slot{"tenor_amanah": "36"}
    - slot{"kendaraan": null}
    - slot{"brand": null}
    - slot{"tipe": null}
    - slot{"uang_muka": null}
    - slot{"tenor_amanah": null}
    - form{"name": null}
    - slot{"requested_slot": null}

## interactive_story_1
* simulasi_amanah{"angsuran": "angsuran", "kredit": "kredit", "kendaraan": "motor", "bulan": "bulanan", "tanya": "berapa"}
    - slot{"kendaraan": "motor"}
    - amanah_form
    - form{"name": "amanah_form"}
    - slot{"kendaraan": "motor"}
    - slot{"kendaraan": "motor"}
    - slot{"requested_slot": "brand"}
* form: inform{"brand": "toyota"}
    - slot{"brand": "toyota"}
    - form: amanah_form
    - slot{"brand": null}
    - slot{"requested_slot": "brand"}
* form: inform{"brand": "honda"}
    - slot{"brand": "honda"}
    - form: amanah_form
    - slot{"brand": "honda"}
    - slot{"requested_slot": "tipe"}
* form: inform{"tipe": "yaris"}
    - slot{"tipe": "yaris"}
    - form: amanah_form
    - slot{"tipe": null}
    - slot{"requested_slot": "tipe"}
* form: inform{"tipe": "beat"}
    - slot{"tipe": "beat"}
    - form: amanah_form
    - slot{"tipe": "BEAT"}
    - slot{"requested_slot": "uang_muka"}
* form: inform{"uang_muka": "1000000"}
    - slot{"uang_muka": "1000000"}
    - form: amanah_form
    - slot{"uang_muka": null}
    - slot{"requested_slot": "uang_muka"}
* form: inform{"uang_muka": "2000000"}
    - slot{"uang_muka": "2000000"}
    - form: amanah_form
    - slot{"uang_muka": "2000000"}
    - slot{"requested_slot": "tenor_amanah"}
* form: inform{"tenor_amanah": "ta- 15"}
    - slot{"tenor_amanah": "ta- 15"}
    - form: amanah_form
    - slot{"tenor_amanah": null}
    - slot{"requested_slot": "tenor_amanah"}
* form: inform{"tenor_amanah": "ta- 24"}
    - slot{"tenor_amanah": "ta- 24"}
    - form: amanah_form
    - slot{"tenor_amanah": "24"}
    - slot{"kendaraan": null}
    - slot{"brand": null}
    - slot{"tipe": null}
    - slot{"uang_muka": null}
    - slot{"tenor_amanah": null}
    - form{"name": null}
    - slot{"requested_slot": null}

## interactive_story_1
* simulasi_amanah{"angsuran": "angsuran", "bulan": "bulanan", "untuk": "untuk", "kredit": "kredit", "kendaraan": "mobil", "brand": "toyota", "tanya": "berapa"}
    - slot{"brand": "toyota"}
    - slot{"kendaraan": "mobil"}
    - amanah_form
    - form{"name": "amanah_form"}
    - slot{"kendaraan": "mobil"}
    - slot{"brand": "toyota"}
    - slot{"kendaraan": "mobil"}
    - slot{"brand": "toyota"}
    - slot{"requested_slot": "tipe"}
* form: inform{"tipe": "beat"}
    - slot{"tipe": "beat"}
    - form: amanah_form
    - slot{"tipe": null}
    - slot{"requested_slot": "tipe"}
* form: inform{"tipe": "vios"}
    - slot{"tipe": "vios"}
    - form: amanah_form
    - slot{"tipe": "VIOS"}
    - slot{"requested_slot": "uang_muka"}
* form: inform{"uang_muka": "30000000"}
    - slot{"uang_muka": "30000000"}
    - form: amanah_form
    - slot{"uang_muka": null}
    - slot{"requested_slot": "uang_muka"}
* form: inform{"uang_muka": "100000000"}
    - slot{"uang_muka": "100000000"}
    - form: amanah_form
    - slot{"uang_muka": "100000000"}
    - slot{"requested_slot": "tenor_amanah"}
* form: inform{"tenor_amanah": "ta- 12"}
    - slot{"tenor_amanah": "ta- 12"}
    - form: amanah_form
    - slot{"tenor_amanah": "12"}
    - slot{"kendaraan": null}
    - slot{"brand": null}
    - slot{"tipe": null}
    - slot{"uang_muka": null}
    - slot{"tenor_amanah": null}
    - form{"name": null}
    - slot{"requested_slot": null}

## interactive_story_1
* simulasi_amanah{"tanya": "berapa", "angsuran": "angsuran", "bulan": "bulanan", "untuk": "buat", "kredit": "kredit", "kendaraan": "mobil", "tipe": "avanza"}
    - slot{"kendaraan": "mobil"}
    - slot{"tipe": "avanza"}
    - amanah_form
    - form{"name": "amanah_form"}
    - slot{"kendaraan": "mobil"}
    - slot{"tipe": "AVANZA"}
    - slot{"kendaraan": "mobil"}
    - slot{"tipe": "AVANZA"}
    - slot{"requested_slot": "uang_muka"}
* form: inform{"uang_muka": "50000000"}
    - slot{"uang_muka": "50000000"}
    - form: amanah_form
    - slot{"uang_muka": "50000000"}
    - slot{"requested_slot": "tenor_amanah"}
* form: inform{"tenor_amanah": "ta- 60"}
    - slot{"tenor_amanah": "ta- 60"}
    - form: amanah_form
    - slot{"tenor_amanah": "60"}
    - slot{"kendaraan": null}
    - slot{"brand": null}
    - slot{"tipe": null}
    - slot{"uang_muka": null}
    - slot{"tenor_amanah": null}
    - form{"name": null}
    - slot{"requested_slot": null}
