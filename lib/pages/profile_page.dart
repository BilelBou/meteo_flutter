import 'dart:io';

import 'package:meteo_flutter/components/meteo_page.dart';
import 'package:meteo_flutter/navigationSystem.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _image;
  final picker = ImagePicker();
  final double imageSize = 70;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MeteoPage(
      title: "Profile Page",
      children: [
        Row(
          children: [
            _image == null
            ? ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: InkWell(
                child: Image.asset("images/profile_placeholder.png", width: imageSize, height: imageSize, fit: BoxFit.fill,),
                onTap: getImage,
              ),
            )
            : ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: InkWell(
                child: Image.file(_image, width: imageSize, height: imageSize, fit: BoxFit.fill,),
                onTap: getImage,
              ),
            ),
            SizedBox(width: 20,),
            Text(
              'Username',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]
        ),
        SizedBox(height: 30),
        Text(
          'Bio of user. Lorem ipsum etc',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
