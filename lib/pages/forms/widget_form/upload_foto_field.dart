import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patuhfy/utils/common_colors.dart';

class UploadFotoField extends StatefulWidget {
  UploadFotoField(
      {super.key, required this.fieldName, required this.imageNameController});

  final String? fieldName;
  TextEditingController imageNameController;
  @override
  State<UploadFotoField> createState() => _UploadFotoFieldState();
}

class _UploadFotoFieldState extends State<UploadFotoField> {
  File? pickedImage;
  String? pickedImageBase64Image;
  Future getFoto(ImageSource src) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: src);
    final File? file = File(image!.path);

    List<int> imageBytes = await image.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    if (image != null) {
      setState(() {
        pickedImage = file;
        pickedImageBase64Image = base64Image;

        widget.imageNameController.text = base64Image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.fieldName != null ? "${widget.fieldName}" : "Evidence",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: CommonColors.blackColor,
              ),
            ),
            IconButton(
              icon:
                  Icon(Icons.add_a_photo, color: CommonColors.bottomIconColor),
              iconSize: 30,
              onPressed: () {
                // getFoto();
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: Text('Kamera/Galeri'),
                        children: [
                          SimpleDialogOption(
                              onPressed: () async {
                                Navigator.pop(context);
                                getFoto(ImageSource.gallery);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.folder_open,
                                      size: 36.0, color: Colors.orange),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 16.0),
                                    child: Text('Pilih Dari Galeri'),
                                  ),
                                ],
                              )),
                          SimpleDialogOption(
                            onPressed: () async {
                              Navigator.pop(context);
                              getFoto(ImageSource.camera);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.camera,
                                    size: 36.0,
                                    color: CommonColors.bottomIconColor),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 16.0),
                                  child: Text('Ambil Gambar'),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    });
              },
            ),
          ],
        ),
        pickedImage == null
            ? Container(height: 0)
            : Container(
                width: 100,
                height: 200,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image.file(pickedImage!))),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
