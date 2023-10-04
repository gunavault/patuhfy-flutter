import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';

class CloseRTL extends StatefulWidget {
  const CloseRTL({super.key});

  @override
  State<CloseRTL> createState() => _CloseRTLState();
}

class _CloseRTLState extends State<CloseRTL> {
  Future<List<UserModelDropdown>> getData(filter) async {
    var response = await Dio().get(
      "https://63c1210999c0a15d28e1ec1d.mockapi.io/users",
      queryParameters: {"filter": filter},
    );

    final data = response.data;
    if (data != null) {
      return UserModelDropdown.fromJsonList(data);
    }

    return [];
  }

  Widget _customDropDownExampleMultiSelection(
      BuildContext context, List<UserModelDropdown> selectedItems) {
    if (selectedItems.isEmpty) {
      return ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(),
        title: Text("No item selected"),
      );
    }

    return Wrap(
      children: selectedItems.map((e) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            child: ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(e.avatar.toString()),
              ),
              title: Text(e.name.toString()),
              subtitle: Text(
                e.createdAt.toString(),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _customPopupItemBuilderExample2(
      BuildContext context, UserModelDropdown item, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item.name.toString()),
        subtitle: Text(item.createdAt.toString()),
        leading: CircleAvatar(
            // backgroundImage: NetworkImage(item.avatar.toString()),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("[DropDownSearch builder examples]"),
        SizedBox(
          height: 50,
        ),
        Divider(),
        Row(
          children: [
            Padding(padding: EdgeInsets.all(4)),
            Expanded(
              child: DropdownSearch<UserModelDropdown>(
                asyncItems: (String? filter) => getData(filter),
                popupProps: PopupPropsMultiSelection.modalBottomSheet(
                  showSelectedItems: true,
                  itemBuilder: _customPopupItemBuilderExample2,
                  showSearchBox: true,
                ),
                compareFn: (item, sItem) => item.id == sItem.id,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        left: 16, right: 18, top: 16, bottom: 16),
                    labelText: 'blok',
                    fillColor: Colors.transparent,
                    hintStyle: CommonStyle.getRalewayFont(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0), width: 0.5),
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
                    filled: true,
                    // fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class UserModelDropdown {
  final String? id;
  final DateTime? createdAt;
  final String? name;
  final String? avatar;

  UserModelDropdown({this.id, this.createdAt, this.name, this.avatar});

  factory UserModelDropdown.fromJson(Map<String, dynamic> json) {
    if (json == null) return UserModelDropdown();
    return UserModelDropdown(
      id: json["id"],
      createdAt:
          json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
      name: json["name"],
      avatar: json["avatar"],
    );
  }

  static List<UserModelDropdown> fromJsonList(List list) {
    if (list == null) return [];
    return list.map((item) => UserModelDropdown.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.name}';
  }

  // ///this method will prevent the override of toString
  // bool userFilterByCreationDate(String filter) {
  //   return this.createdAt.toString().contains(filter);
  // }

  // ///custom comparing function to check if two users are equal
  // bool isEqual(UserModelDropdown model) {
  //   return this.id == model.id;
  // }

  @override
  String toString() => name.toString();
}
