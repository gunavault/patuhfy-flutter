import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:patuhfy/blocs/selectbox_afdeling/selectbox_afdeling_cubit.dart';
import 'package:patuhfy/models/afdeling_model.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';

class SelectboxAfdeling extends StatelessWidget {
  const SelectboxAfdeling(
      {super.key,
      this.titleName,
      this.isTitleName,
      required this.kodeAfdelingController});

  final String? titleName;
  final bool? isTitleName;
  final TextEditingController kodeAfdelingController;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SelectboxAfdelingCubit>(context).getData();

    List<String> _getSuggestions(String query, List<AfdelingModel> data) {
      List<String> matches = <String>[];

      List<String> dataAfd = data.map((e) => e.kodeAfd.toString()).toList();
      matches.addAll(dataAfd);

      matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
      return matches;
    }

    return BlocBuilder<SelectboxAfdelingCubit, SelectboxAfdelingState>(
      builder: (context, state) {
        print('state dari selectbox $state');
        if (state is LoadingState) {
          return const Center(
            child: Text('Loading..'),
          );
        }

        if (state is SuccessState) {
          // listAfdeling = state.listAllAfd.map((e) => e.kodeAfd).toList();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isTitleName == true
                  ? Text(
                      titleName!,
                      style: CommonStyle.getRalewayFont(
                        color: CommonColors.blackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: TypeAheadFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Afdeling Tidak Boleh kosong';
                      }
                      return null;
                    },
                    textFieldConfiguration: TextFieldConfiguration(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            left: 16, right: 18, top: 16, bottom: 16),
                        labelText: 'Cari Afdeling',
                        fillColor: Colors.transparent,
                        hintStyle: CommonStyle.getRalewayFont(
                            color: CommonColors.textGeryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                              color: CommonColors.textGeryColor, width: 0.5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                              color: CommonColors.redColor, width: 0.5),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                              color: CommonColors.redColor, width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                              color: CommonColors.textGeryColor, width: 0.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                              color: CommonColors.textGeryColor, width: 0.5),
                        ),
                      ),
                      controller: kodeAfdelingController,
                    ),
                    suggestionsCallback: (pattern) {
                      return _getSuggestions(pattern, state.listAllAfd);
                    },
                    itemBuilder: (context, String suggestion) {
                      return ListTile(
                        title: Text(suggestion),
                      );
                    },
                    transitionBuilder: (context, suggestionsBox, controller) {
                      return suggestionsBox;
                    },
                    onSuggestionSelected: (String suggestion) {
                      kodeAfdelingController.text = suggestion;
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          );
        }

        return const Center(child: Text('Error'));
      },
    );
  }
}
