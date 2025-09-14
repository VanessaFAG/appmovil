import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SinginScreen extends StatefulWidget {
  const SinginScreen({super.key});

  @override
  State<SinginScreen> createState() => _SinginScreenState();
}

class _SinginScreenState extends State<SinginScreen> {
  final ImagePicker _image = ImagePicker();
  File? _imgPerfil;
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}