import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patuhfy/utils/common_colors.dart';

class UploadFoto extends StatefulWidget {
  UploadFoto(
      {super.key, required this.fieldName, required this.imageNameController});

  final String? fieldName;
  TextEditingController imageNameController;
  @override
  State<UploadFoto> createState() => _UploadFotoState();
}

class _UploadFotoState extends State<UploadFoto> {
  File? pickedImage;
  String? pickedImageBase64Image;
  Future getFoto(ImageSource src) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: src);
    final File file = File(image!.path);

    // List<int> imageBytes = await image.readAsBytes();
    // String base64Image = base64Encode(imageBytes);
    // if (image != null) {
    //   setState(() {
    //     pickedImage = file;
    //     pickedImageBase64Image = base64Image;

    //     widget.imageNameController.text = base64Image;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldName != null ? "${widget.fieldName}" : "Evidence",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: CommonColors.blackColor,
          ),
        ),
        FormBuilderImagePicker(
          maxImages: 1,
          decoration:
              const InputDecoration(labelText: 'Lampirkan Bukti Kegiatan'),
          name: "CupertinoActionSheet",
          validator: (v) {
            if (v == null || v.isEmpty) {
              return 'Tolong lampirkan bukti kegiatan';
            }
            return null;
          },
          onChanged: (val) async {
            XFile? selectedImg = val!.first;
            List<int> imageBytes =
                await selectedImg!.readAsBytes(); // convert to bytes
            pickedImageBase64Image =
                base64Encode(imageBytes); // convert to string

            widget.imageNameController.text = pickedImageBase64Image.toString();
          },
          optionsBuilder: (cameraPicker, galleryPicker) => CupertinoActionSheet(
            title: const Text('Image'),
            message: const Text('Pick an image from given options'),
            actions: [
              CupertinoActionSheetAction(
                isDefaultAction: true,
                onPressed: () {
                  cameraPicker();
                },
                child: const Text('Camera'),
              ),
              CupertinoActionSheetAction(
                isDefaultAction: true,
                onPressed: () {
                  galleryPicker();
                },
                child: const Text('Gallery'),
              )
            ],
          ),
          onTap: (child) => showCupertinoModalPopup(
            context: context,
            builder: (context) => child,
          ),
        ),
      ],
    );
  }
}
