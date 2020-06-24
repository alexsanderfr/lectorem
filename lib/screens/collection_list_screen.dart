import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:lectorem/models/access_token.dart';
import 'package:lectorem/models/collection.dart';
import 'package:lectorem/screens/feed_list_screen.dart';
import 'package:lectorem/services/api.dart';
import 'package:lectorem/utilities/constants.dart';
import 'package:lectorem/utilities/helpers.dart';
import 'package:lectorem/widgets/loading_widget.dart';
import 'package:lectorem/widgets/no_connection_error_widget.dart';
import 'package:lectorem/widgets/no_content_error_widget.dart';

class CollectionListScreen extends StatefulWidget {
  static const String id = 'collection_list_screen';

  @override
  _CollectionListScreenState createState() => _CollectionListScreenState();
}

class _CollectionListScreenState extends State<CollectionListScreen> {
  List<Collection> collections;
  bool _isLoading = false;

  void getCollections() async {
    if (this.mounted) {
      setState(() {
        _isLoading = true;
      });
    }
    if (await hasInternetConnection()) {
      AccessToken accessToken = await getAccessToken();
      FeedlyApi api = FeedlyApi();
      if (accessToken != null) {
        List<Collection> collectionsResponse =
            await api.getCollections(accessToken);
        if (this.mounted) {
          setState(() {
            _isLoading = false;
            collections = collectionsResponse;
          });
        }
      }
    } else {
      if (this.mounted) {
        setState(() {
          _isLoading = false;
          collections = null;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCollections();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: _isLoading
          ? LoadingWidget(
              withPhoto: false,
              withSubtitle: false,
            )
          : collections == null
              ? NoConnectionErrorWidget(onRetryCallback: getCollections)
              : collections.length == 0
                  ? NoContentErrorWidget(onRetryCallback: getCollections)
                  : Scrollbar(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          Collection collection = collections[index];
                          return CollectionTile(collection: collection);
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: collections.length,
                      ),
                    ),
    );
  }
}

class CollectionTile extends StatelessWidget {
  const CollectionTile({
    Key key,
    @required this.collection,
  }) : super(key: key);

  final Collection collection;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          platformPageRoute(
            context: context,
            builder: (context) => FeedsListScreen(
              feeds: collection.feeds,
              title: collection.label,
            ),
          ),
        );
      },
      title: Text(
        collection.label,
        style: kTitleTextStyle,
      ),
      subtitle: collection.description != null
          ? Text(collection.description)
          : null,
    );
  }
}
