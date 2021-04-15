import 'dart:io';

import 'package:meteo_flutter/components/meteo_page.dart';
import 'package:meteo_flutter/navigationSystem.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    
    File tmpFile = File(pickedFile.path);

    final String path = (await getApplicationDocumentsDirectory()).path;
    final String fileName = basename(pickedFile.path);
    final String fileExtension = extension(pickedFile.path);

    tmpFile = await tmpFile.copy('$path/$fileName$fileExtension');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('profile_image', tmpFile.path);

    setState(() => _image = tmpFile);
  }

  Future<String> getImageFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String path = prefs.getString('profile_image');

    if (path != null && path.isNotEmpty) {
      setState(() {
        _image = File(path);
      });
      
      return path;
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    getImageFromStorage();
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
