import 'package:flutter/cupertino.dart';
import 'dart:collection';
import 'dart:math';
import 'package:csslib/parser.dart' as cssparser;
import 'package:csslib/visitor.dart' as css;
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/src/html_elements.dart';
import 'package:flutter_html/src/layout_element.dart';
import 'package:flutter_html/src/utils.dart';
import 'package:flutter_html/style.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as htmlparser;

import 'html_parser.dart';

class ImgParser extends StatelessWidget {
  final String htmlData;

  final CustomRender customRender;

  const ImgParser({
    Key key,
    @required this.htmlData,
    @required this.customRender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<dom.Element> _list = [];
    dom.Document document = htmlparser.parse(htmlData);

    _parse(document, _list);

    print(_list);

    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (_, index) {
        final ele = _list[index];
        return customRender(null, null, ele.attributes.map((key, value) => MapEntry(key, value)), ele);
      },
      childCount: _list.length,
    ));
  }

  _parse(dom.Node element, List<dom.Node> imgList) {
    if (element.nodes.isNotEmpty) {
      for (int i = 0; i < element.nodes.length; i++) {
        final dom.Node eleChild = element.nodes[i];
        if (eleChild is dom.Element) {
          if (eleChild.nodes.isEmpty) {
            print('${eleChild.localName}');
            if (eleChild.localName == 'img') imgList.add(eleChild);
          } else {
            _parse(eleChild, imgList);
          }
        }
      }
    }
  }
}
