import 'dart:io';

import 'package:flutter/material.dart';

import 'nlp_detector_views/language_identifier_view.dart';
import 'nlp_detector_views/language_translator_view.dart';
import 'vision_detector_views/barcode_scanner_view.dart';
import 'vision_detector_views/face_detector_view.dart';
import 'vision_detector_views/face_mesh_detector_view.dart';
import 'vision_detector_views/label_detector_view.dart';
import 'vision_detector_views/object_detector_view.dart';
import 'vision_detector_views/text_detector_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('机器学习应用功能展示App'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Image.network(
                    'https://raw.githubusercontent.com/cosmo-reading/cosmoreading.github.io/main/logo.jpg',
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProjectIntroPage()),
                      );
                    },
                    child: Text('项目简介'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ModuleInfoPage()),
                      );
                    },
                    child: Text('各模块功能说明'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ExpansionTile(
                    title: const Text('视觉图像应用'),
                    children: [
                      CustomCard('条形码扫描', BarcodeScannerView()),
                      CustomCard('面部识别', FaceDetectorView()),
                      CustomCard('面部建模', FaceMeshDetectorView()),
                      CustomCard('图像标注', ImageLabelView()),
                      CustomCard('物体检测', ObjectDetectorView()),
                      CustomCard('文本识别', TextRecognizerView()),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ExpansionTile(
                    title: const Text('语言应用'),
                    children: [
                      CustomCard('语言种类识别', LanguageIdentifierView()),
                      CustomCard('在线翻译', LanguageTranslatorView()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectIntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('项目简介'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '这是一个机器学习应用展示的项目。这里介绍项目的目的、功能和实现方式。',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('返回'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModuleInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('各模块功能说明'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '条形码扫描：用于扫描和解码条形码。\n\n'
                '面部识别：用于检测和识别面部。\n\n'
                '面部建模：用于创建面部的3D模型。\n\n'
                '图像标注：用于对图像中的对象进行标注。\n\n'
                '物体检测：用于检测图像中的物体。\n\n'
                '文本识别：用于从图像中识别和提取文本。\n\n'
                '语言种类识别：用于识别文本的语言种类。\n\n'
                '在线翻译：用于将文本翻译成其他语言。',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('返回'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String _label;
  final Widget _viewPage;
  final bool featureCompleted;

  const CustomCard(this._label, this._viewPage, {this.featureCompleted = true});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        tileColor: Theme.of(context).primaryColor,
        title: Text(
          _label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          if (!featureCompleted) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: const Text('功能尚未实现')));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => _viewPage));
          }
        },
      ),
    );
  }
}
