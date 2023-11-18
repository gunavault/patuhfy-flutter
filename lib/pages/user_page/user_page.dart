import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/auth_session/auth_session_cubit.dart';
import 'package:patuhfy/blocs/page/page_cubit.dart';
import 'package:patuhfy/blocs/sync_masterdata/sync_masterdata_cubit.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/widgets/constant.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  Widget _createListMenu(String menuTitle, void Function() onTapFunc) {
    return InkWell(
      // behavior: HitTestBehavior.opaque,
      highlightColor: Colors.red,
      onTap: onTapFunc,

      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 18, 0, 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(menuTitle,
                style: const TextStyle(fontSize: 15, color: Color(0xFF515151))),
            const Icon(Icons.file_download, size: 20, color: BLACK_GREY),
          ],
        ),
      ),
    );
  }

  void tarikDataBlok() {}

  void tarikDataMandor() {}

  void tarikDataPemanen() {}

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayOpacity: 0.8,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.black, //change your color here
            ),
            elevation: 0,
            title: const Text(
              'User Profile',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            backgroundColor: kDarkWhite,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            actions: const [],
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1.0),
                child: Container(
                  color: Colors.grey[100],
                  height: 1.0,
                )),
          ),
          body: BlocListener<SyncMasterdataCubit, SyncMasterdataState>(
            listener: (context, state) {
              if (state is SuccessSyncMasterdataState) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      // duration: Duration(seconds: 4),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(state.message),
                          const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      backgroundColor: CommonColors.containerTextG,
                    ),
                  );
              }

              if (state is LoadingSyncMasterdataState) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      // duration: Duration(seconds: 4),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Memperbaharui Datamaster....'),
                          CircularProgressIndicator()
                        ],
                      ),
                      backgroundColor: CommonColors.textColor,
                    ),
                  );
              }

              if (state is ErrorSyncMasterdataState) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      // duration: Duration(seconds: 4),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Oops, Periksa Koneksi Anda'),
                          Icon(
                            Icons.warning,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      backgroundColor: CommonColors.redColor,
                    ),
                  );
              }
            },
            //
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                BlocBuilder<AuthSessionCubit, AuthUserSessionState>(
                  builder: (context, state) {
                    if (state is AuthUserSessionUpdatedState) {
                      if (state.userModel!.psa_tipe == 'KEBUN') {
                        return Column(
                          children: [
                            _createListMenu('Tarik Afdeling', () {
                              {
                                BlocProvider.of<SyncMasterdataCubit>(context)
                                    .refreshDataAfdeling();
                              }
                            }),
                            Divider(height: 0, color: Colors.grey[400]),
                            _createListMenu('Tarik Blok', () {
                              {
                                BlocProvider.of<SyncMasterdataCubit>(context)
                                    .refreshDataBlok();
                              }
                            }),
                            Divider(height: 0, color: Colors.grey[400]),
                            _createListMenu('Tarik Mandor', () {
                              {
                                BlocProvider.of<SyncMasterdataCubit>(context)
                                    .refreshDataMandor();
                              }
                            }),
                            Divider(height: 0, color: Colors.grey[400]),
                            _createListMenu('Tarik Pemanen', () {
                              {
                                BlocProvider.of<SyncMasterdataCubit>(context)
                                    .refreshDataPemanen();
                              }
                            }),
                          ],
                        );
                      }
                    }

                    return Container();
                  },
                ),
                Divider(height: 0, color: Colors.grey[400]),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        context.read<PageCubit>().logout();
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.power_settings_new,
                              size: 20, color: ASSENT_COLOR),
                          SizedBox(width: 8),
                          Text('Sign Out',
                              style:
                                  TextStyle(fontSize: 15, color: ASSENT_COLOR)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
