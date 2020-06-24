import 'package:lectorem/models/access_token.dart';
import 'package:lectorem/models/collection.dart';
import 'package:lectorem/models/entry.dart';
import 'package:lectorem/models/feed.dart';
import 'package:lectorem/models/subscription.dart';
import 'package:lectorem/models/stream.dart';
import 'package:lectorem/keys.dart';

import 'networking.dart';

const redirectUri = 'https://localhost';
const responseType = 'code';
const scope = 'https://cloud.feedly.com/subscriptions';
const grantType = 'authorization_code';

const authPath = '/v3/auth/auth';
const tokenPath = '/v3/auth/token';
const categoriesPath = '/v3/categories';
const subscriptionsPath = '/v3/subscriptions';
const streamContentPath = '/v3/streams/contents';
const entriesPath = '/v3/entries';
const collectionsPath = '/v3/collections';
const feedsPath = '/v3/feeds/';

const clientIdParam = 'client_id';
const clientSecretParam = 'client_secret';
const redirectUriParam = 'redirect_uri';
const responseTypeParam = 'response_type';
const scopeParam = 'scope';
const codeParam = 'code';
const grantTypeParam = 'grant_type';
const streamIdParam = 'streamId';
const continuationParam = 'continuation';

class FeedlyApi {
  final String apiUrl = Key.apiUrl;
  final String clientId = Key.clientId;
  final String clientSecret = Key.clientSecret;

  FeedlyApi();

  String buildUrlForAuth() {
    Uri uri = Uri.https(apiUrl, authPath, {
      clientIdParam: clientId,
      redirectUriParam: redirectUri,
      responseTypeParam: responseType,
      scopeParam: scope,
    });
    return uri.toString();
  }

  Future<AccessToken> getAccessToken(String code) async {
    Uri uri = Uri.https(apiUrl, tokenPath, {
      codeParam: code,
      clientIdParam: clientId,
      clientSecretParam: clientSecret,
      redirectUriParam: redirectUri,
      grantTypeParam: grantType,
    });
    dynamic response = await postData(uri);
    return AccessToken.fromJson(response);
  }

  Future<List<Subscription>> getSubscriptions(AccessToken accessToken) async {
    Uri uri = Uri.https(apiUrl, subscriptionsPath);
    dynamic response =
        await getDataWithBasicAuth(uri, accessToken.accessToken);
    List<Subscription> subscriptionList = [];
    for (dynamic item in response) {
      subscriptionList.add(Subscription.fromJson(item));
    }
    return subscriptionList;
  }

  Future<Stream> getStream(
      AccessToken accessToken, String streamId, int continuation) async {
    Uri uri = Uri.https(apiUrl, streamContentPath, {streamIdParam: streamId});
    if (continuation != null) {
      uri.queryParameters[continuationParam] = continuation as String;
    }
    dynamic response = await getDataWithBasicAuth(uri, accessToken.accessToken);
    return Stream.fromJson(response);
  }

  Future<Entry> getEntry(AccessToken accessToken, String entryId) async {
    Uri uri = Uri.https(apiUrl, '$entriesPath/$entryId');
    dynamic response =
        await getDataWithBasicAuth(uri, accessToken.accessToken);
    return Entry.fromJson(response);
  }

  Future<List<Collection>> getCollections(AccessToken accessToken) async {
    Uri uri = Uri.https(apiUrl, collectionsPath);
    dynamic response =
        await getDataWithBasicAuth(uri, accessToken.accessToken);
    List<Collection> collectionList = [];
    for (dynamic item in response) {
      collectionList.add(Collection.fromJson(item));
    }
    return collectionList;
  }

  Future<Feed> getFeed(AccessToken accessToken, String feedId) async {
    String url = '$apiUrl$feedsPath/$feedId';
    dynamic response =
        await getDataWithBasicAuth(Uri.parse(url), accessToken.accessToken);
    return Feed.fromJson(response);
  }
}
