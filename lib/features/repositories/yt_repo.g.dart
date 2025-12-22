// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yt_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(youtubeRepository)
const youtubeRepositoryProvider = YoutubeRepositoryProvider._();

final class YoutubeRepositoryProvider
    extends
        $FunctionalProvider<
          YoutubeRepository,
          YoutubeRepository,
          YoutubeRepository
        >
    with $Provider<YoutubeRepository> {
  const YoutubeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'youtubeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$youtubeRepositoryHash();

  @$internal
  @override
  $ProviderElement<YoutubeRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  YoutubeRepository create(Ref ref) {
    return youtubeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(YoutubeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<YoutubeRepository>(value),
    );
  }
}

String _$youtubeRepositoryHash() => r'a48ece3d68a21321b5bd052cb305531d7cfe4943';
