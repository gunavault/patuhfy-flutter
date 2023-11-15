import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';

class Sync extends LocalDataSource {
  Sync(
      super.userDao,
      super.afdelingDao,
      super.blokDao,
      super.tApelPagiDao,
      super.tInspeksiHancaDao,
      super.tInspeksiTphDao,
      super.tPencurianTbsDao,
      super.tLapKerusakanDao,
      super.mandorDao,
      super.pemanenDao,
      super.tRealPemupukanDao,
      super.tRealPenyianganDao,
      super.tRealPenunasanDao,
      super.tRealRestanDao,
      super.tRealPemeliharaanJalanDao,
      super.tRealPengendalianHamaDao,
      super.tRealPusinganPanenDao,
      super.tApelPagiPengolahanDao);

  syncApelPagi() async {
    try {
      int apelPagi = (await tApelPagiDao.getCountNotSend() ?? 0);
      if (apelPagi > 0) {
        List<ApelPagiFormModel> listData =
            await tApelPagiDao.getAllDataNotSend();

        listData.forEach((dataForm) async =>
            await tApelPagiDao.insertDataApelPagi(dataForm));
      }
    } catch (e) {}
  }

  @override
  Future<int> getCountNotSend() async {
    int? apelPagi = await tApelPagiDao.getCountNotSend();
    int? inspeksiHanca = await tInspeksiHancaDao.getCountNotSend();
    int? inspeksiTph = await tInspeksiTphDao.getCountNotSend();
    int? pencurianTbs = await tPencurianTbsDao.getCountNotSend();
    int? lapKerusakan = await tLapKerusakanDao.getCountNotSend();

    int? realPemupukan = await tRealPemupukanDao.getCountNotSend();
    int? realPenyinangan = await tRealPenyianganDao.getCountNotSend();
    int? realPenunasan = await tRealPenunasanDao.getCountNotSend();
    int? realRestan = await tRealRestanDao.getCountNotSend();
    int? realPemeliharaanJalan =
        await tRealPemeliharaanJalanDao.getCountNotSend();
    int? realPengendalianHama =
        await tRealPengendalianHamaDao.getCountNotSend();
    int? realPusinganPanen = await tRealPusinganPanenDao.getCountNotSend();
    int? apelPagiPengolahan = await tApelPagiPengolahanDao.getCountNotSend();

    int totalSum = (apelPagi ?? 0) +
        (inspeksiHanca ?? 0) +
        (inspeksiTph ?? 0) +
        (pencurianTbs ?? 0) +
        (lapKerusakan ?? 0) +
        (realPemupukan ?? 0) +
        (realPenyinangan ?? 0) +
        (realPenunasan ?? 0) +
        (realRestan ?? 0) +
        (realPemeliharaanJalan ?? 0) +
        (realPengendalianHama ?? 0) +
        (realPusinganPanen ?? 0) +
        (apelPagiPengolahan ?? 0);
    return totalSum;
  }
}
