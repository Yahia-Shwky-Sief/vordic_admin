import 'package:flutter/material.dart';
import 'package:vordic_admin/core/widgets/nav/nav.dart';
import 'package:vordic_admin/core/widgets/text_form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vordic_admin/features/ad_banner_management/logic/storage.dart';

class AdBannerManagement extends StatefulWidget {
  const AdBannerManagement({super.key});

  @override
  State<AdBannerManagement> createState() => _AdBannerManagementState();
}

class _AdBannerManagementState extends State<AdBannerManagement> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String fileName = '';
  String image = '';
  Storage storage = Storage();
  @override
  Widget build(BuildContext context) {
    return nav(
      context: context,
      selectedPageId: 1,
      body: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Ad Banner Management'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // Add your action here, e.g., show a dialog to add a new ad banner
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Add New Ad Banner'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                textFormField(
                                  hintText: 'Enter Ad Banner Name',
                                  controller: controller,
                                  keyboardType: TextInputType.text,
                                  obscureText: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a value';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    MaterialButton(
                                      onPressed: () async {
                                        final result =
                                            await ImagePicker().pickImage(
                                          source: ImageSource.gallery,
                                        );
                                        if (result == null) {
                                          return;
                                        }
                                        final path = result.path;
                                        fileName = result.name;

                                        await storage.uploadFile(
                                          filePath: path,
                                          fileName: fileName,
                                        );

                                        image = await storage.downloadUrl(
                                          imageName: fileName,
                                        );
                                        setState(() {});
                                      },
                                      child: Container(
                                        child: Center(
                                          child: Text('Select Image',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: image == ''
                                            ? Container(
                                                color: Colors.black87,
                                              )
                                            : Image(
                                                image: NetworkImage(image))),
                                    const Spacer(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                // Add your action to add a new ad banner here
                                Navigator.of(context).pop();
                              },
                              child: const Text('Add'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        body:  Center(
          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                textFormField(
                                  hintText: 'Enter Ad Banner Name',
                                  controller: controller,
                                  keyboardType: TextInputType.text,
                                  obscureText: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a value';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    MaterialButton(
                                      onPressed: () async {
                                        final result =
                                            await ImagePicker().pickImage(
                                          source: ImageSource.gallery,
                                        );
                                        if (result == null) {
                                          return;
                                        }
                                        final path = result.path;
                                        fileName = result.name;

                                        await storage.uploadFile(
                                          filePath: path,
                                          fileName: fileName,
                                        );

                                        image = await storage.downloadUrl(
                                          imageName: fileName,
                                        );
                                        setState(() {});
                                      },
                                      child: Container(
                                        child: Center(
                                          child: Text('Select Image',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: image == ''
                                            ? Container(
                                                color: Colors.black87,
                                              )
                                            : Image(
                                                image: NetworkImage(image))),
                                    const Spacer(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      
        ),
      ),
    );
  }
}
