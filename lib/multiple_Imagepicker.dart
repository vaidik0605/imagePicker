import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class demo1 extends StatefulWidget {
  const demo1({Key? key}) : super(key: key);

  @override
  State<demo1> createState() => _demo1State();
}

class _demo1State extends State<demo1> {
  final ImagePicker _picker = ImagePicker();
  List<XFile>? imagepath = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                              imagepath!.clear();
                              final List<XFile>? photo =
                                  await _picker.pickMultiImage();

                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                              if (photo != null) {
                                imagepath!.addAll(photo);
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
            (imagepath!.isNotEmpty)
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          itemCount: imagepath!.length,
                          itemBuilder: (context, index) {
                            return Image.file(
                              File(imagepath![index].path),
                              fit: BoxFit.fill,
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, crossAxisSpacing: 3)),
                    ),
                  )
                : const Text(""),
          ],
        ),
      ),
    );
  }
}
