// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_md_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(videoMdVm)
const videoMdVmProvider = VideoMdVmFamily._();

final class VideoMdVmProvider
    extends
        $FunctionalProvider<
          AsyncValue<VideoMeta>,
          VideoMeta,
          FutureOr<VideoMeta>
        >
    with $FutureModifier<VideoMeta>, $FutureProvider<VideoMeta> {
  const VideoMdVmProvider._({
    required VideoMdVmFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'videoMdVmProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$videoMdVmHash();

  @override
  String toString() {
    return r'videoMdVmProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<VideoMeta> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<VideoMeta> create(Ref ref) {
    final argument = this.argument as String;
    return videoMdVm(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is VideoMdVmProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$videoMdVmHash() => r'b81a64a0c2b9d0f9af4131806b35a478620e25c5';

final class VideoMdVmFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<VideoMeta>, String> {
  const VideoMdVmFamily._()
    : super(
        retry: null,
        name: r'videoMdVmProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VideoMdVmProvider call(String videoId) =>
      VideoMdVmProvider._(argument: videoId, from: this);

  @override
  String toString() => r'videoMdVmProvider';
}
