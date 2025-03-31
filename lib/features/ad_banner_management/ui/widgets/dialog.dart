import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vordic_admin/core/widgets/text_form_field.dart';
import 'package:vordic_admin/features/ad_banner_management/data/sources/ads_banner_data_source.dart';

class Dialog extends StatefulWidget {
  const Dialog({super.key});

  @override
  State<Dialog> createState() => _DialogState();
}

class _DialogState extends State<Dialog> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AdsBannerDataSource adsBannerDataSource = AdsBannerDataSource();
  String image = '';
  @override
  Widget build(BuildContext context) {
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
                        final result = await ImagePicker().pickImage(
                          source: ImageSource.gallery,
                        );
                        if (result == null) {
                          return;
                        }
                        final path = result.path;
                        final fileName = result.name;
                        adsBannerDataSource
                            .uploadAdBannerAndGetPublicUrl(
                          filePath: path,
                          fileName: fileName,
                        )
                            .then((value) {
                          setState(() {
                            image = value;
                          });
                        });
                      },
                      child: const Center(
                        child: Text('Select Image',
                            style: TextStyle(color: Colors.white)),
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
                            : Image(image: NetworkImage(image))),
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
  }
}
