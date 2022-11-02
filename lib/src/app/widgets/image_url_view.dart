import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageUrlView extends StatelessWidget {
  //todo: replace with all network image widgets in the app
  final String? url;
  final String? imageKey;
  final BorderRadius? borderRadius;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final bool? circular;
  final bool? roundedCorners;

  const ImageUrlView({
    Key? key,
    this.url,
    this.imageKey,
    this.borderRadius = const BorderRadius.all(Radius.circular(16.0)),
    this.fit = BoxFit.cover,
    this.height,
    this.width = double.infinity,
    this.circular = false,
    this.roundedCorners = true,
  })  : assert(imageKey != null || url != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    //todo: get image error from assets
    Widget imageErrorWidget = Image.asset('image shows error here', fit: fit);
    String finalUrl = imageKey != null
        ? 'https://ik.imagekit.io/tnc8pizf9e/$imageKey?tr=w-$width,h-$height'
        : url!;
    Widget image = kIsWeb
        ? FadeInImage.memoryNetwork(
            fit: fit,
            width: width,
            height: height,
            imageErrorBuilder: (context, error, stackTrace) => imageErrorWidget,
            fadeInDuration: const Duration(milliseconds: 1),
            fadeOutDuration: const Duration(milliseconds: 1),
            image: finalUrl,
            placeholder: kTransparentImage,
          )
        : CachedNetworkImage(
            fit: fit,
            width: width,
            height: height,
            imageUrl: finalUrl,
            errorWidget: (context, uri, error) => imageErrorWidget,
          );

    return circular!
        ? ClipOval(
            child: image,
          )
        : roundedCorners!
            ? ClipRRect(borderRadius: borderRadius, child: image)
            : image;
  }
}
