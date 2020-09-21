import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';

import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: new MyHomePage(title: 'flutter_html Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

const htmlData =
    """<div id="offer-template-0"></div><p><img alt="hGyRj/ysztRGXaE9kcvsDDA9I39HLxEyEk5s" src="https://cbu01.alicdn.com/img/ibank/2020/097/737/13926737790_66091754.jpg"><img alt="undefined" height="790" src="https://cbu01.alicdn.com/img/ibank/2020/576/063/13842360675_66091754.jpg" width="790"><img alt="undefined" height="790" src="https://cbu01.alicdn.com/img/ibank/2020/233/077/13926770332_66091754.jpg" width="790"><img alt="undefined" height="790" src="https://cbu01.alicdn.com/img/ibank/2020/394/467/13926764493_66091754.jpg" width="790"><img alt="undefined" src="https://cbu01.alicdn.com/img/ibank/2020/469/843/13842348964_66091754.jpg"><img alt="undefined" height="790" src="https://cbu01.alicdn.com/img/ibank/2020/793/946/13878649397_66091754.jpg" width="790"><img alt="undefined" height="790" src="https://cbu01.alicdn.com/img/ibank/2020/402/873/13842378204_66091754.jpg" width="790"><img alt="undefined" src="https://cbu01.alicdn.com/img/ibank/2020/863/976/13878679368_66091754.jpg"></p>""";

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('flutter_html Example'),
        centerTitle: true,
      ),
      body: CustomScrollView(slivers: [
        SliverImgHtml(
          data: htmlData,
          customRender: (RenderContext context, Widget child, attributes, _) {
            return Image.network(attributes['src']);
          },
          //Optional parameters:
//           style: {
//             "html": Style(
//               backgroundColor: Colors.black12,
// //              color: Colors.white,
//             ),
// //            "h1": Style(
// //              textAlign: TextAlign.center,
// //            ),
//             "table": Style(
//               backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
//             ),
//             "tr": Style(
//               border: Border(bottom: BorderSide(color: Colors.grey)),
//             ),
//             "th": Style(
//               padding: EdgeInsets.all(6),
//               backgroundColor: Colors.grey,
//             ),
//             "td": Style(
//               padding: EdgeInsets.all(6),
//             ),
//             "var": Style(fontFamily: 'serif'),
//           },
//           customRender: {
//             "flutter": (RenderContext context, Widget child, attributes, _) {
//               return FlutterLogo(
//                 style: (attributes['horizontal'] != null) ? FlutterLogoStyle.horizontal : FlutterLogoStyle.markOnly,
//                 textColor: context.style.color,
//                 size: context.style.fontSize.size * 5,
//               );
//             },
//           },
//           onLinkTap: (url) {
//             print("Opening $url...");
//           },
//           onImageTap: (src) {
//             print(src);
//           },
//           onImageError: (exception, stackTrace) {
//             print(exception);
//           },
        ),
      ]),
    );
  }
}
