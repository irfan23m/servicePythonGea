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

## cara amanah
* cara_amanah  
    - utter_cara_amanah
    - slot{"kendaraan": null}

## tenor amanah
* tenor_amanah   
    - utter_tenor_amanah
    - slot{"kendaraan": null}

## syarat amanah
* syarat_amanah   
    - utter_syarat_amanah
    - slot{"kendaraan": null}

## tempat amanah
* tempat_amanah   
    - utter_tempat_amanah
    - slot{"kendaraan": null}

## dp amanah
* dp_amanah   
    - utter_dp_amanah
    - slot{"kendaraan": null}

## bunga amanah
* bunga_amanah   
    - utter_bunga_amanah
    - slot{"kendaraan": null}

## bisa amanah
* bisa_amanah   
    - utter_bisa_amanah
    - slot{"kendaraan": null}

## bisa emas
* bisa_emas   
    - utter_bisa_emas

## biaya admin amanah
* biaya_admin_amanah
    - utter_biaya_admin_amanah
    - slot{"kendaraan": null}
    
## interactive_story_1
* simulasi_emasku{"tanya": "berapa", "angsuran": "angsuran", "bulan": "bulanan", "untuk": "buat", "produk": "emasku"}
    - slot{"produk": "emasku"}
    - emasku_form
    - form{"name": "emasku_form"}
    - slot{"requested_slot": "berat_emasku"}
* form: inform{"berat_emasku": "b- 1"}
    - slot{"berat_emasku": "b- 1"}
    - form: emasku_form
    - slot{"berat_emasku": "1"}
    - slot{"berat_emasku": null}
    - form{"name": null}
    - slot{"requested_slot": null}
