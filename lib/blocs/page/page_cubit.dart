import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
part 'page_state.dart';

class PageCubit extends Cubit<PageState> {
  final LocalDataSource localDataSource;
  PageCubit(this.localDataSource) : super(SplashPageState()) {
    checkHasOnBoarding();
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    // Placemark place = placemarks[0];
    // Address =
    //     '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    // setState(() {});
  }

  _saveGeoLoc() async {
    Position position = await _getGeoLocationPosition();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(lat, position.latitude.toString());
    prefs.setString(long, position.longitude.toString());
    print('saved geo ${position.latitude.toString()}');
  }

  checkHasOnBoarding() async {
    await Future.delayed(const Duration(seconds: 3));
    _saveGeoLoc();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var hasOnBoarding = prefs.getBool(keyHasOnBoarding) == true;
    if (hasOnBoarding) {
      await checkIsAuth();
    } else {
      emit(OnBoardingPageState());
      prefs.setBool(keyHasOnBoarding, true);
    }
  }

  checkIsAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isAuth = prefs.getBool(keyIsAuth) == true;
    if (isAuth) {
      emit(HomePageState());
    } else {
      emit(LoginPageState());
    }
  }

  Future<void> checkForUpdates() async {
    final shorebirdCodePush = ShorebirdCodePush();
    print('coding...');
    // Check whether a patch is available to install.
    final isUpdateAvailable =
        await shorebirdCodePush.isNewPatchAvailableForDownload();

    if (isUpdateAvailable) {
      // Download the new patch if it's available.
      await shorebirdCodePush.downloadUpdateIfAvailable();
    }
  }

  setHasOnBoarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(keyHasOnBoarding, true);
    emit(LoginPageState());
  }

  setLoginPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(keyIsAuth, true);
    emit(HomePageState());
  }

  /// this will delete cache
  Future<void> _deleteCacheDir() async {
    final cacheDir = await getTemporaryDirectory();

    if (cacheDir.existsSync()) {
      print('ke sini hapus cache');
      cacheDir.deleteSync(recursive: true);
    }
  }

  /// this will delete app's storage
  Future<void> _deleteAppDir() async {
    final appDir = await getApplicationSupportDirectory();

    if (appDir.existsSync()) {
      appDir.deleteSync(recursive: true);
    }
  }

  logout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool(keyIsAuth, false);
      await _deleteCacheDir();
      await localDataSource.deleteUser(prefs.getString(keyNikSap) as String);

      final UserModel user =
          await localDataSource.getCurrentUser() ?? UserModel();

      print('usserModel role ${user.role}');
      await localDataSource.deleteAfdeling();
      await localDataSource.deleteBlok();
      await localDataSource.deleteMandor();
      await localDataSource.deletePemanen();
      await localDataSource.deleteAllInspeksiHanca();
      await localDataSource.deleteAllInspeksiTph();
      await localDataSource.deleteAllApelPagi();
      await localDataSource.deleteAllPencurianTbs();
      await localDataSource.deleteAllLapKerusakan();
      await localDataSource.deleteAllRealPemupukan();
      await localDataSource.deleteAllRealPengendalianHama();
      await localDataSource.deleteAllRealPemeliharaanJalan();
      await localDataSource.deleteAllRealPenunasan();
      await localDataSource.deleteAllRealPenyiangan();
      await localDataSource.deleteAllRealPusinganPanen();
      await localDataSource.deleteAllRealRestan();
      await localDataSource.deleteAllApelPagiPengolahan();

      // await _deleteAppDir();
      emit(LoginPageState());
    } catch (e) {
      print('errrprr $e');
    }
  }
}
