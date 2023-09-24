import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      checkIsAuth();
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

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(keyIsAuth, false);
    await localDataSource.deleteUser(prefs.getString(keyNikSap) as String);
    await localDataSource.deleteAfdeling();
    await localDataSource.deleteBlok();
    await localDataSource.deleteAllInspeksiHanca();
    await localDataSource.deleteAllApelPagi();
    emit(LoginPageState());
  }
}
