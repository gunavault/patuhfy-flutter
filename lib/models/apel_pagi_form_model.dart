class ApelPagiFormModel {
  String? tanggal;
  String? company;
  String? unitKerja;
  final String afd;
  final String foto;
  String? createdBy;

  ApelPagiFormModel(
      {this.tanggal,
      this.company,
      this.unitKerja,
      required this.afd,
      required this.foto,
      this.createdBy});
}
