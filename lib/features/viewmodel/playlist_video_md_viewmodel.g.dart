// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_video_md_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(playlistVideoMdVm)
const playlistVideoMdVmProvider = PlaylistVideoMdVmFamily._();

final class PlaylistVideoMdVmProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<VideoMeta>>,
          List<VideoMeta>,
          FutureOr<List<VideoMeta>>
        >
    with $FutureModifier<List<VideoMeta>>, $FutureProvider<List<VideoMeta>> {
  const PlaylistVideoMdVmProvider._({
    required PlaylistVideoMdVmFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'playlistVideoMdVmProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$playlistVideoMdVmHash();

  @override
  String toString() {
    return r'playlistVideoMdVmProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<VideoMeta>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<VideoMeta>> create(Ref ref) {
    final argument = this.argument as String;
    return playlistVideoMdVm(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PlaylistVideoMdVmProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playlistVideoMdVmHash() => r'f87b66dd76a0d7979d8e83c957fc8b23fe86bc56';

final class PlaylistVideoMdVmFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<VideoMeta>>, String> {
  const PlaylistVideoMdVmFamily._()
    : super(
        retry: null,
        name: r'playlistVideoMdVmProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PlaylistVideoMdVmProvider call(String playListId) =>
      PlaylistVideoMdVmProvider._(argument: playListId, from: this);

  @override
  String toString() => r'playlistVideoMdVmProvider';
}
