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
    extends $NotifierProvider<AuthViewModel, AsyncValue<user_md.UserMd>?> {
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
  Override overrideWithValue(AsyncValue<user_md.UserMd>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<user_md.UserMd>?>(value),
    );
  }
}

String _$authViewModelHash() => r'02ec5733aa062b3bf5cde97ac4d7edeedcef6a64';

abstract class _$AuthViewModel extends $Notifier<AsyncValue<user_md.UserMd>?> {
  AsyncValue<user_md.UserMd>? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<user_md.UserMd>?, AsyncValue<user_md.UserMd>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<user_md.UserMd>?,
                AsyncValue<user_md.UserMd>?
              >,
              AsyncValue<user_md.UserMd>?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
