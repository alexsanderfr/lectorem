import 'package:flutter/material.dart';
import 'package:lectorem/models/access_token.dart';
import 'package:lectorem/models/subscription.dart';
import 'package:lectorem/services/api.dart';
import 'package:lectorem/utilities/helpers.dart';
import 'package:lectorem/widgets/loading_widget.dart';
import 'package:lectorem/widgets/no_connection_error_widget.dart';
import 'package:lectorem/widgets/no_content_error_widget.dart';

import 'feed_list_screen.dart';

class SubscriptionListScreen extends StatefulWidget {
  static const String id = 'subscription_list_screen';

  SubscriptionListScreen();

  @override
  _SubscriptionListScreenState createState() => _SubscriptionListScreenState();
}

class _SubscriptionListScreenState extends State<SubscriptionListScreen> {
  List<Subscription> subscriptions;
  bool _isLoading = false;

  void getSubscriptions() async {
    if (this.mounted) {
      setState(() {
        _isLoading = true;
      });
    }
    if (await hasInternetConnection()) {
      AccessToken accessToken = await getAccessToken();
      FeedlyApi api = FeedlyApi();
      if (accessToken != null) {
        List<Subscription> subscriptionsResponse =
            await api.getSubscriptions(accessToken);

        if (this.mounted) {
          setState(() {
            _isLoading = false;
            subscriptions = subscriptionsResponse;
          });
        }
      }
    } else {
      if (this.mounted) {
        setState(() {
          _isLoading = false;
          subscriptions = null;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getSubscriptions();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: _isLoading
          ? LoadingWidget(
              withPhoto: false,
              withSubtitle: true,
            )
          : subscriptions == null
              ? NoConnectionErrorWidget(onRetryCallback: getSubscriptions)
              : subscriptions.length == 0
                  ? NoContentErrorWidget(onRetryCallback: getSubscriptions)
                  : Scrollbar(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          Subscription subscription = subscriptions[index];
                          return FeedTile(
                            id: subscription.id,
                            title: subscription.title,
                            website: subscription.website,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: subscriptions.length,
                      ),
                    ),
    );
  }
}
