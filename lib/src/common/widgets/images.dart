import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spendit/src/common/common.dart';

class SiImages extends StatefulWidget {
  const SiImages({super.key, required this.imageUrl, this.fit = BoxFit.cover});

  final String imageUrl;
  final BoxFit fit;

  @override
  State<SiImages> createState() => _SiImagesState();
}

class _SiImagesState extends State<SiImages> {
  late String _currentUrl;
  int _retryCount = 0;
  final _maxRetry = 5;
  final _interval = Duration(seconds: 5);
  Timer? _timer;

  String _updatedUrl(String url) {
    return '$url?retry=$_retryCount&ts=${DateTime.now().millisecondsSinceEpoch}';
  }

  void _resetTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _retry() {
    if (_retryCount >= _maxRetry) {
      _resetTimer();
      return;
    }
    setState(() {
      _retryCount++;
      _currentUrl = _updatedUrl(widget.imageUrl);
    });
  }

  @override
  void initState() {
    super.initState();
    _currentUrl = _updatedUrl(widget.imageUrl);
  }

  @override
  void didUpdateWidget(covariant SiImages oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.imageUrl != oldWidget.imageUrl) {
      setState(() {
        _retryCount = 0;
        _currentUrl = _updatedUrl(widget.imageUrl);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: _currentUrl,
      imageBuilder: (context, imageProvider) {
        _resetTimer();
        return Image(image: imageProvider, fit: widget.fit);
      },
      progressIndicatorBuilder: (context, url, progress) {
        return Center(
          child: CircularProgressIndicator.adaptive(value: progress.progress),
        );
      },
      errorWidget: (context, url, error) {
        if (_timer == null && _retryCount < _maxRetry) {
          _timer = Timer(_interval, _retry);
        }
        return HugeIcon(
          icon: HugeIcons.strokeRoundedImageDelete02,
          color: SiColors.danger,
        );
      },
    );
  }
}
