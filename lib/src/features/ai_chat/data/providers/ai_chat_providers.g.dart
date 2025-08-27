// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_chat_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(aiRepository)
const aiRepositoryProvider = AiRepositoryProvider._();

final class AiRepositoryProvider extends $FunctionalProvider<AiRepository, AiRepository, AiRepository>
    with $Provider<AiRepository> {
  const AiRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aiRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aiRepositoryHash();

  @$internal
  @override
  $ProviderElement<AiRepository> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  AiRepository create(Ref ref) {
    return aiRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AiRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AiRepository>(value),
    );
  }
}

String _$aiRepositoryHash() => r'671fbb44d86c19c68b0daddcac408544a70e2a69';

@ProviderFor(aiTokenStorage)
const aiTokenStorageProvider = AiTokenStorageProvider._();

final class AiTokenStorageProvider extends $FunctionalProvider<AITokenStorage, AITokenStorage, AITokenStorage>
    with $Provider<AITokenStorage> {
  const AiTokenStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aiTokenStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aiTokenStorageHash();

  @$internal
  @override
  $ProviderElement<AITokenStorage> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  AITokenStorage create(Ref ref) {
    return aiTokenStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AITokenStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AITokenStorage>(value),
    );
  }
}

String _$aiTokenStorageHash() => r'6db85fce11326d4e9ac496d403266d6a0908ca0d';

@ProviderFor(assistantStorage)
const assistantStorageProvider = AssistantStorageProvider._();

final class AssistantStorageProvider extends $FunctionalProvider<AssistantStorage, AssistantStorage, AssistantStorage>
    with $Provider<AssistantStorage> {
  const AssistantStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'assistantStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$assistantStorageHash();

  @$internal
  @override
  $ProviderElement<AssistantStorage> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  AssistantStorage create(Ref ref) {
    return assistantStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AssistantStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AssistantStorage>(value),
    );
  }
}

String _$assistantStorageHash() => r'aefc398c85405230cbee4912e87c471fa72bb11a';

@ProviderFor(threadIdStorage)
const threadIdStorageProvider = ThreadIdStorageProvider._();

final class ThreadIdStorageProvider extends $FunctionalProvider<ThreadIdStorage, ThreadIdStorage, ThreadIdStorage>
    with $Provider<ThreadIdStorage> {
  const ThreadIdStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'threadIdStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$threadIdStorageHash();

  @$internal
  @override
  $ProviderElement<ThreadIdStorage> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  ThreadIdStorage create(Ref ref) {
    return threadIdStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThreadIdStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThreadIdStorage>(value),
    );
  }
}

String _$threadIdStorageHash() => r'913a45f4fb22d5d0205358ce203ca96fcd000552';

@ProviderFor(chatStorage)
const chatStorageProvider = ChatStorageProvider._();

final class ChatStorageProvider extends $FunctionalProvider<ChatStorage, ChatStorage, ChatStorage>
    with $Provider<ChatStorage> {
  const ChatStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatStorageHash();

  @$internal
  @override
  $ProviderElement<ChatStorage> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  ChatStorage create(Ref ref) {
    return chatStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatStorage>(value),
    );
  }
}

String _$chatStorageHash() => r'a08e937aa29661319dfc0de8c45a6d89535bf755';

@ProviderFor(aiChatService)
const aiChatServiceProvider = AiChatServiceProvider._();

final class AiChatServiceProvider extends $FunctionalProvider<AiChatService, AiChatService, AiChatService>
    with $Provider<AiChatService> {
  const AiChatServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aiChatServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aiChatServiceHash();

  @$internal
  @override
  $ProviderElement<AiChatService> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  AiChatService create(Ref ref) {
    return aiChatService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AiChatService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AiChatService>(value),
    );
  }
}

String _$aiChatServiceHash() => r'8b16c6eb590f13a9e3077b768eedf7e3d336b53c';

@ProviderFor(userThreadsStream)
const userThreadsStreamProvider = UserThreadsStreamProvider._();

final class UserThreadsStreamProvider
    extends $FunctionalProvider<AsyncValue<List<String>>, List<String>, Stream<List<String>>>
    with $FutureModifier<List<String>>, $StreamProvider<List<String>> {
  const UserThreadsStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userThreadsStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userThreadsStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<String>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<String>> create(Ref ref) {
    return userThreadsStream(ref);
  }
}

String _$userThreadsStreamHash() => r'e73498f5b59f09d26eae0c17d3f2ec55e9a5839a';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
