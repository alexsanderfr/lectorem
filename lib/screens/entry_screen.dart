import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lectorem/models/entry.dart';
import 'package:lectorem/utilities/constants.dart';
import 'package:lectorem/widgets/custom_scaffold.dart';
import 'package:url_launcher/url_launcher.dart';

class EntryScreen extends StatefulWidget {
  static const String id = 'entry_screen';

  final Entry entry;

  const EntryScreen({this.entry});

  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Entry entry = widget.entry;
    bool isContent =
        widget.entry.content != null && widget.entry.content.content != null;
    String link =
        entry.alternate.isNotEmpty && entry.alternate.first.href != null
            ? entry.alternate.first.href
            : null;
    return CustomScaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                entry.title != null
                    ? Text(
                        entry.title,
                        style: kTitleTextStyle,
                      )
                    : SizedBox(),
                entry.author != null
                    ? Text(
                        entry.author,
                        style: kSubtitleTextStyle,
                      )
                    : SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Html(
                    data: isContent
                        ? entry.content.content
                        : entry.summary.content,
                    onLinkTap: (String url) {
                      launchUrl(url);
                    },
                    defaultTextStyle: kPrimaryTextStyle,
                  ),
                ),
                link != null
                    ? OutlineButton(
                        child: Text(
                          'Read more',
                          style: kOutlineButtonTextStyle,
                        ),
                        onPressed: () {
                          launchUrl(entry.alternate.first.href);
                        })
                    : SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
