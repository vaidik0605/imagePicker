import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imagepicker extends StatefulWidget {
  const imagepicker({Key? key}) : super(key: key);

  @override
  State<imagepicker> createState() => _imagepickerState();
}

class _imagepickerState extends State<imagepicker> {
  @override
  final ImagePicker _picker = ImagePicker();
  String imagepath = "";

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              child: (imagepath.isNotEmpty)
                  ? Image.file(
                      File(imagepath),
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      "Assets/user.png",
                      fit: BoxFit.fill,
                    ),
            ),
            OutlinedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: const Text("Pick Image"),
                        children: [
                          ListTile(
                            onTap: () async {
                              final XFile? photo = await _picker.pickImage(
                                  source: ImageSource.camera);
                              Navigator.pop(context);
                              if (photo != null) {
                                imagepath = photo.path;
                                setState(() {});
                              }
                            },
                            leading: const Icon(Icons.camera_alt),
                            title: const Text("Camera"),
                          ),
                          ListTile(
                            onTap: () async {
                              final XFile? photo = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              Navigator.pop(context);
                              if (photo != null) {
                                imagepath = photo.path;
                                setState(() {});
                              }
                            },
                            leading: const Icon(Icons.browse_gallery),
                            title: const Text("Gallery"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text("Pick Image")),
          ],
        ),
      ),
    );
  }
}
