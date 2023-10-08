import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patuhfy/utils/common_colors.dart';

class UploadFileFieldWidget extends StatefulWidget {
  UploadFileFieldWidget(
      {super.key, required this.fieldName, required this.fileController});

  final String? fieldName;
  TextEditingController fileController;
  @override
  State<UploadFileFieldWidget> createState() => _UploadFileFieldWidgetState();
}

class _UploadFileFieldWidgetState extends State<UploadFileFieldWidget> {
  FilePickerResult? result;
  late String pickedFileBase64Image;
  late Uint8List fileBytes;
  // final _formKey = GlobalKey<FormBuilderState>();
  final bool _useCustomFileViewer = false;

  @override
  Widget build(BuildContext context) {
    void _onLoadFile(val) async {
      PlatformFile value = val!.first;
      XFile file = XFile(value.path.toString());
      fileBytes = await file.readAsBytes();
      pickedFileBase64Image = base64Encode(fileBytes);
      widget.fileController.text = pickedFileBase64Image;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        FormBuilderFilePicker(
          name: 'File Bosku',
          decoration: const InputDecoration(
            labelText: 'Attachments',
            floatingLabelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: CommonColors.blackColor,
                fontSize: 23),
          ),
          maxFiles: 1,
          allowMultiple: false,
          allowedExtensions: const ['pdf', 'doc'],
          previewImages: false,
          onChanged: (val) async {
            _onLoadFile(val);
          },
          typeSelectors: const [
            TypeSelector(
              type: FileType.custom,
              selector: Row(
                children: <Widget>[
                  Icon(Icons.file_upload),
                  Text('Upload'),
                ],
              ),
            )
          ],
          customTypeViewerBuilder: (children) => Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: children,
          ),
          onFileLoading: (val) {
            print('val $val');
            debugPrint(val.toString());
          },
          customFileViewerBuilder: _useCustomFileViewer
              ? (files, filesSetter) =>
                  customFileViewerBuilder(files ?? [], (newValue) {})
              : null,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget customFileViewerBuilder(
    List<PlatformFile> files,
    FormFieldSetter<List<PlatformFile>> setter,
  ) {
    print('wtfff $files');
    return files.isEmpty
        ? const Center(child: Text('No files'))
        : ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(files[index].name),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    print('files $files');
                    files.removeAt(index);
                    setter.call([...files]);
                  },
                ),
              );
            },
            separatorBuilder: (context, index) =>
                const Divider(color: Colors.blueAccent),
            itemCount: files.length,
          );
  }
}
