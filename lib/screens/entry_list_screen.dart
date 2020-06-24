import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lectorem/models/access_token.dart';
import 'package:lectorem/models/entry.dart';
import 'package:lectorem/models/visual.dart';
import 'package:lectorem/services/api.dart';
import 'package:lectorem/utilities/colors.dart';
import 'package:lectorem/utilities/constants.dart';
import 'package:lectorem/utilities/helpers.dart';
import 'package:lectorem/models/stream.dart';
import 'package:lectorem/widgets/custom_scaffold.dart';
import 'package:lectorem/widgets/image_thumbnail.dart';
import 'package:lectorem/widgets/loading_widget.dart';
import 'package:lectorem/widgets/no_connection_error_widget.dart';
import 'package:lectorem/widgets/no_content_error_widget.dart';

import 'entry_screen.dart';

import 'package:html/dom.dart' as HtmlDom;
import 'package:html/parser.dart' as HtmlParser;

class EntryListScreen extends StatefulWidget {
  static const String id = 'entry_list_screen';
  final String streamId;
  final String title;

  const EntryListScreen({this.streamId, this.title});

  @override
  _EntryListScreenState createState() => _EntryListScreenState();
}

class _EntryListScreenState extends State<EntryListScreen> {
  Stream stream;
  bool _isLoading = false;

  void getStream() async {
    if (this.mounted) {
      setState(() {
        _isLoading = true;
      });
    }
    if (await hasInternetConnection()) {
      AccessToken accessToken = await getAccessToken();
      FeedlyApi api = FeedlyApi();
      if (accessToken != null) {
        Stream streamResponse =
            await api.getStream(accessToken, widget.streamId, null);
        if (this.mounted) {
          setState(() {
            _isLoading = false;
            stream = streamResponse;
          });
        }
      }
    } else {
      if (this.mounted) {
        setState(() {
          _isLoading = false;
          stream = null;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getStream();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScaffold(
        title: widget.title,
        body: Center(
          child: _isLoading
              ? LoadingWidget(
                  withPhoto: true,
                  withSubtitle: true,
                )
              : stream == null
                  ? NoConnectionErrorWidget(onRetryCallback: getStream)
                  : stream.items.length == 0
                      ? NoContentErrorWidget(onRetryCallback: getStream)
                      : Scrollbar(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              Entry entry = stream.items[index];
                              return EntryTile(entry: entry);
                            },
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            itemCount: stream.items.length,
                          ),
                        ),
        ),
      ),
    );
  }
}

class EntryTile extends StatelessWidget {
  final Entry entry;

  const EntryTile({this.entry});

  List<String> getImageFromEntry(Entry entry) {
    List<String> imageList = [];
    if (entry.content != null && entry.content.content != null) {
      HtmlDom.Document document = HtmlParser.parse(entry.content.content);
      List<HtmlDom.Element> elements = document.getElementsByTagName('img');
      if (elements != null && elements.isNotEmpty) {
        for (HtmlDom.Element element in elements) {
          if (element != null && element.attributes['src'] != null) {
            imageList.add(element.attributes['src']);
          }
        }
      }
    }
    if (entry.thumbnail != null && entry.thumbnail.isNotEmpty) {
      for (Visual visual in entry.thumbnail) {
        if (visual != null && visual.url != null && visual.url != 'none') {
          imageList.add(visual.url);
        }
      }
    }
    if (entry.visual != null &&
        entry.visual.url != null &&
        entry.visual.url != 'none') {
      imageList.add(entry.visual.url);
    }
    return imageList;
  }

  @override
  Widget build(BuildContext context) {
    List<String> imageList = getImageFromEntry(entry);
    String url = imageList.isNotEmpty ? imageList.first : null;
    return ListTile(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          platformPageRoute(
            context: context,
            builder: (context) => EntryScreen(
              entry: entry,
            ),
          ),
        );
      },
      leading:
          url != null ? ImageThumbnail(isUnread: entry.unread, url: url) : null,
      title: Text(entry.title,
          style: entry.unread ? kTitleTextStyle : kTitleReadTextStyle),
      subtitle: Text(
        formatDate(entry.published),
        style: entry.unread ? kSubtitleTextStyle : kSubtitleReadTextStyle,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          entry.unread
              ? Icon(
                  FontAwesomeIcons.solidCircle,
                  color: CustomColors.lightGrey,
                )
              : Icon(
                  FontAwesomeIcons.circle,
                  color: CustomColors.lightGrey,
                ),
          entry.unread
              ? Text(
                  'Mark read',
                  style: kSubtitleTextStyle,
                )
              : Text(
                  'Mark unread',
                  style: kSubtitleTextStyle,
                )
        ],
      ),
    );
  }
}
