// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_local_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authRemoteRepository)
const authRemoteRepositoryProvider = AuthRemoteRepositoryProvider._();

final class AuthRemoteRepositoryProvider
    extends
        $FunctionalProvider<
          AuthLocalRepository,
          AuthLocalRepository,
          AuthLocalRepository
        >
    with $Provider<AuthLocalRepository> {
  const AuthRemoteRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRemoteRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRemoteRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthLocalRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthLocalRepository create(Ref ref) {
    return authRemoteRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthLocalRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthLocalRepository>(value),
    );
  }
}

String _$authRemoteRepositoryHash() =>
    r'05f9078495844a875110b9eec894b7f954b35c85';
