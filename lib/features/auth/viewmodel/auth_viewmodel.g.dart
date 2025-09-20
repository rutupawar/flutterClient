// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthViewModel)
const authViewModelProvider = AuthViewModelProvider._();

final class AuthViewModelProvider
    extends $NotifierProvider<AuthViewModel, AsyncValue<UserMd>?> {
  const AuthViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authViewModelHash();

  @$internal
  @override
  AuthViewModel create() => AuthViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<UserMd>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<UserMd>?>(value),
    );
  }
}

String _$authViewModelHash() => r'2e39d058cebb240b7f9d39e5e656c74d75aa4c98';

abstract class _$AuthViewModel extends $Notifier<AsyncValue<UserMd>?> {
  AsyncValue<UserMd>? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<UserMd>?, AsyncValue<UserMd>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserMd>?, AsyncValue<UserMd>?>,
              AsyncValue<UserMd>?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
