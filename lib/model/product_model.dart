class ProductModel {
  String? kdBrg;
  String? nmBrg;
  String? satuan;
  String? harga;
  String? hargaBeli;
  String? stok;
  String? stokMin;

  ProductModel(
      {this.kdBrg,
      this.nmBrg,
      this.satuan,
      this.harga,
      this.hargaBeli,
      this.stok,
      this.stokMin});

  ProductModel.fromJson(Map<String, dynamic> json) {
    kdBrg = json['kd_brg'];
    nmBrg = json['nm_brg'];
    satuan = json['satuan'];
    harga = json['harga'];
    hargaBeli = json['harga_beli'];
    stok = json['stok'];
    stokMin = json['stok_min'];
  }
}