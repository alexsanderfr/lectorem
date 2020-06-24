import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:lectorem/models/feed.dart';
import 'package:lectorem/utilities/constants.dart';
import 'package:lectorem/widgets/custom_scaffold.dart';
import 'package:lectorem/widgets/no_content_error_widget.dart';

import 'entry_list_screen.dart';

class FeedsListScreen extends StatefulWidget {
  static const String id = 'feed_list_screen';
  final String title;
  final List<Feed> feeds;

  const FeedsListScreen({this.title, this.feeds});

  @override
  _FeedsListScreenState createState() => _FeedsListScreenState();
}

class _FeedsListScreenState extends State<FeedsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScaffold(
        title: widget.title,
        body: widget.feeds.length == 0
            ? NoContentErrorWidget()
            : Scrollbar(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    Feed feed = widget.feeds[index];
                    return FeedTile(
                      id: feed.id,
                      title: feed.title,
                      website: feed.website,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: widget.feeds.length,
                ),
              ),
      ),
    );
  }
}

class FeedListScreenArguments {
  final String title;
  final List<Feed> feeds;

  FeedListScreenArguments({this.title, this.feeds});
}


class FeedTile extends StatelessWidget {
  const FeedTile({
    @required this.id,
    @required this.title,
    @required this.website,
  });

  final String id;
  final String title;
  final String website;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          platformPageRoute(
            context: context,
            builder: (context) => EntryListScreen(
              streamId: id,
              title: title,
            ),
          ),
        );
      },
      title: Text(
        title,
        style: kTitleTextStyle,
      ),
      subtitle: Text(
        website,
        style: kSubtitleTextStyle,
      ),
    );
  }
}


class StreamScreenArguments {
  final String streamId;
  final String title;

  StreamScreenArguments({this.streamId, this.title});
}
