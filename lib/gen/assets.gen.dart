/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $LibGen {
  const $LibGen();

  /// Directory path: lib/assets
  $LibAssetsGen get assets => const $LibAssetsGen();
}

class $LibAssetsGen {
  const $LibAssetsGen();

  /// Directory path: lib/assets/fonts
  $LibAssetsFontsGen get fonts => const $LibAssetsFontsGen();

  /// Directory path: lib/assets/icons
  $LibAssetsIconsGen get icons => const $LibAssetsIconsGen();

  /// Directory path: lib/assets/images
  $LibAssetsImagesGen get images => const $LibAssetsImagesGen();

  /// Directory path: lib/assets/translations
  $LibAssetsTranslationsGen get translations =>
      const $LibAssetsTranslationsGen();
}

class $LibAssetsFontsGen {
  const $LibAssetsFontsGen();

  /// File path: lib/assets/fonts/.gitignore
  String get aGitignore => 'lib/assets/fonts/.gitignore';

  /// List of all assets
  List<String> get values => [aGitignore];
}

class $LibAssetsIconsGen {
  const $LibAssetsIconsGen();

  /// File path: lib/assets/icons/facebook.svg
  String get facebook => 'lib/assets/icons/facebook.svg';

  /// List of all assets
  List<String> get values => [facebook];
}

class $LibAssetsImagesGen {
  const $LibAssetsImagesGen();

  /// File path: lib/assets/images/.gitignore
  String get aGitignore => 'lib/assets/images/.gitignore';

  /// File path: lib/assets/images/sample.png
  AssetGenImage get sample =>
      const AssetGenImage('lib/assets/images/sample.png');

  /// List of all assets
  List<dynamic> get values => [aGitignore, sample];
}

class $LibAssetsTranslationsGen {
  const $LibAssetsTranslationsGen();

  /// File path: lib/assets/translations/en.json
  String get en => 'lib/assets/translations/en.json';

  /// File path: lib/assets/translations/pl.json
  String get pl => 'lib/assets/translations/pl.json';

  /// List of all assets
  List<String> get values => [en, pl];
}

class Assets {
  Assets._();

  static const $LibGen lib = $LibGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
