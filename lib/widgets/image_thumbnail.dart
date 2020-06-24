import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lectorem/utilities/colors.dart';

class ImageThumbnail extends StatelessWidget {
  final String url;
  final bool isUnread;

  const ImageThumbnail({this.url, this.isUnread});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: CustomColors.lightGrey,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: CachedNetworkImage(
          color: isUnread ? null : Colors.grey,
          colorBlendMode: isUnread ? BlendMode.srcIn : BlendMode.lighten,
          imageUrl: url,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              SpinKitRing(color: CustomColors.accentColor),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
      width: 80.0,
      height: 80.0,
    );
  }
}
