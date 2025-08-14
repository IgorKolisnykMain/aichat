// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_chat_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(aiRepository)
const aiRepositoryProvider = AiRepositoryProvider._();

final class AiRepositoryProvider
    extends $FunctionalProvider<AiRepository, AiRepository, AiRepository>
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
  $ProviderElement<AiRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

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

final class AiTokenStorageProvider
    extends $FunctionalProvider<AITokenStorage, AITokenStorage, AITokenStorage>
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
  $ProviderElement<AITokenStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

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

final class AssistantStorageProvider
    extends
        $FunctionalProvider<
          AssistantStorage,
          AssistantStorage,
          AssistantStorage
        >
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
  $ProviderElement<AssistantStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

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

String _$assistantStorageHash() => r'3fa3cedc73f6a3c6d5883bfc5f57c4b0ecbf3b8f';

@ProviderFor(threadIdStorage)
const threadIdStorageProvider = ThreadIdStorageProvider._();

final class ThreadIdStorageProvider
    extends
        $FunctionalProvider<ThreadIdStorage, ThreadIdStorage, ThreadIdStorage>
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
  $ProviderElement<ThreadIdStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

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

@ProviderFor(firestoreChatStorage)
const firestoreChatStorageProvider = FirestoreChatStorageProvider._();

final class FirestoreChatStorageProvider
    extends $FunctionalProvider<ChatStorage, ChatStorage, ChatStorage>
    with $Provider<ChatStorage> {
  const FirestoreChatStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firestoreChatStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firestoreChatStorageHash();

  @$internal
  @override
  $ProviderElement<ChatStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ChatStorage create(Ref ref) {
    return firestoreChatStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatStorage>(value),
    );
  }
}

String _$firestoreChatStorageHash() =>
    r'ac25c36fbdd1e518e72e7f61a2e8d2deda004e00';

@ProviderFor(chatGptChatStorage)
const chatGptChatStorageProvider = ChatGptChatStorageProvider._();

final class ChatGptChatStorageProvider
    extends $FunctionalProvider<ChatStorage, ChatStorage, ChatStorage>
    with $Provider<ChatStorage> {
  const ChatGptChatStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatGptChatStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatGptChatStorageHash();

  @$internal
  @override
  $ProviderElement<ChatStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ChatStorage create(Ref ref) {
    return chatGptChatStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatStorage>(value),
    );
  }
}

String _$chatGptChatStorageHash() =>
    r'8257960036df32d3ec0e0023f57e4637950e2aa4';

@ProviderFor(aiChatService)
const aiChatServiceProvider = AiChatServiceProvider._();

final class AiChatServiceProvider
    extends $FunctionalProvider<AiChatService, AiChatService, AiChatService>
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
  $ProviderElement<AiChatService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

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

String _$aiChatServiceHash() => r'e6e89d4d81d3e9c7a57fa1885c458be07a33f123';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
