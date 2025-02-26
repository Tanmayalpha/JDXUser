import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_dekho_app/Model/parceldetailsmodel.dart';
import 'package:job_dekho_app/Utils/api_path.dart';
import 'package:job_dekho_app/Utils/color.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart' as permission;
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

// import 'package:share/share.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ShareQRCode extends StatefulWidget {
  const ShareQRCode({Key? key, this.parcel, this.appUrl}) : super(key: key);

  final ParcelDetailDataList? parcel;
  final String? appUrl;

  @override
  State<ShareQRCode> createState() => _ShareQRCodeState();
}

class _ShareQRCodeState extends State<ShareQRCode> {
  @override
  ScreenshotController screenshotController = ScreenshotController();
  final TextEditingController tfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
              height: 23,
              width: 23,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30)),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              )),
        ),
        backgroundColor: primaryColor,
        title: const Text('Share Your Parcel QR'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Screenshot(
                controller: screenshotController,
                child: Image.network(
                    '${ApiPath.baseUrl}${widget.parcel?.barcodeLink ?? ''}')),
            const SizedBox(height: 20),
            Text(
              'OTP: ${widget.parcel?.otp}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            /*ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
                backgroundColor: Colors.blue,
                textStyle: TextStyle(color: Colors.white,)
                ,),
              child: Text('Generate QR Code'),
              onPressed: () => setState(() {}),

            ),*/
            InkWell(
              onTap: () {
                _shareQrCode();
              },
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width / 1.2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: Secondry),
                child: const Text(
                  "Share QR Code",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _shareQrCode() async {
    /*  final url = Uri.parse("${ApiPath.baseUrl}${widget.parcel?.barcodeLink}");
    final response = await http.get(url);
    await File('/yourPath/myItem.png').writeAsBytes(response.bodyBytes);

    await Share.shareFiles(['/yourPath/myItem.png'], text: 'Image Shared');*/
    PermissionStatus? storagePermission;
    final deviceInfo = await DeviceInfoPlugin().androidInfo;

    if (deviceInfo.version.sdkInt! > 32) {
      storagePermission = await Permission.photos.request();
    } else {
      storagePermission = await Permission.storage.request();
    }

    //final storagePermission = await Permission.storage.request();

    if (storagePermission.isGranted) {
      final directory = (await getApplicationDocumentsDirectory()).path;
      screenshotController.capture().then((Uint8List? image) async {
        if (image != null) {
          try {
            String fileName = DateTime.now().microsecondsSinceEpoch.toString();
            final imagePath = await File('$directory/$fileName.png').create();
            if (imagePath != null) {
              await imagePath.writeAsBytes(image);
              await Share.shareXFiles(
                [XFile(imagePath.path)],
                text: '${widget.appUrl}\nOTP: ${widget.parcel?.otp}',
                subject: 'Parcel QR Code and OTP',
              );
              //Share.shareFiles(imagePath.path, text: 'ff');
            }
          } catch (error) {}
        }
      }).catchError((onError) {
        print('Error --->> $onError');
      });
    } else if (storagePermission.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('This Permission is recommended')));
    } else if (storagePermission ==
        permission.PermissionStatus.permanentlyDenied) {
      openAppSettings().then((value) {});
    }
  }
}
