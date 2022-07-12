import 'dart:convert';
import 'dart:html';
import 'dart:io' as dartIo;
import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'area_info_text.dart';
import 'coding.dart';
import 'knowledges.dart';
import 'my_info.dart';
import 'skills.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            MyInfo(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    AreaInfoText(
                      title: "Age",
                      text: "24",
                    ),
                    Skills(),
                    SizedBox(height: defaultPadding),
                    Coding(),
                    Knowledges(),
                    Divider(),
                    SizedBox(height: defaultPadding / 2),
                    TextButton(
                      onPressed: () {
                        launch("data:application/octet-stream;base64,${base64Encode(
                            dartIo.File('images/bg.jpeg').readAsBytesSync()
                        )}");
                        // print("done1");
                        // dartIo.File file = dartIo.File('assets/images/bg.jpeg');
                        // final rawData = file.readAsBytesSync();
                        // final content = base64Encode(rawData);
                        // final anchor = AnchorElement(
                        //     href: "data:application/octet-stream;charset=utf-16le;base64,$content")
                        //   ..setAttribute("download", "file.jpeg")
                        //   ..click();
                        // print("done");
                        // // Encode our file in base64
                        // final _base64 = base64Encode('I am a test file'.codeUnits);
                        // // Create the link with the file
                        // final anchor =
                        // AnchorElement(href: 'data:application/octet-stream;base64,$_base64')
                        //   ..target = 'blank';
                        // // add the name
                        // // if ('test.txt' != null) {
                        //   anchor.download = 'test.txt';
                        // // }
                        // // trigger download
                        // document.body?.append(anchor);
                        // anchor.click();
                        // anchor.remove();
                      },
                      child: FittedBox(
                        child: Row(
                          children: [
                            Text(
                              "DOWNLOAD CV",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                            ),
                            SizedBox(width: defaultPadding / 2),
                            SvgPicture.asset("assets/icons/download.svg")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: defaultPadding),
                      color: Color(0xFF24242E),
                      child: Row(
                        children: [
                          Spacer(),
                          IconButton(
                            onPressed: () async{
                              try{
                                if (!await launchUrl(Uri.parse("https://ca.linkedin.com/in/rohan-jariwala-44146a1aa"))){
                              }else{
                              }
                              }catch(e){
                              print("erro " + e.toString());
                              }
                            },
                            icon: SvgPicture.asset("assets/icons/linkedin.svg"),
                          ),
                          IconButton(
                            onPressed: () async{
                              try{
                                if (!await launchUrl(Uri.parse("https://github.com/rohanjariwala03"))){
                              }else{
                              }
                              }catch(e){
                              print("erro " + e.toString());
                              }
                            },
                            icon: SvgPicture.asset("assets/icons/github.svg"),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
