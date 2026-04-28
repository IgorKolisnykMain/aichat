# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This App Is

A multi-platform Flutter AI chat application (iOS, Android, Web) with OpenAI-powered tutoring, Firebase backend, RevenueCat/Stripe subscriptions, and Algolia product search.

## Build & Run Commands

**Always check `.vscode/launch.json` first** — it contains the authoritative launch configurations.

```bash
# Run with flavor (dev or prod)
flutter run --flavor dev --dart-define environment=dev
flutter run --flavor prod --dart-define environment=prod

# Web (no flavor)
flutter run -d chrome --dart-define=environment=dev

# Release builds
flutter build apk --flavor dev --dart-define environment=dev
flutter build ios --flavor dev --dart-define environment=dev
flutter build web --dart-define=environment=dev

# Code generation (run after modifying models/providers)
dart run build_runner build --delete-conflicting-outputs
dart run build_runner watch --delete-conflicting-outputs

# Tests
flutter test
flutter test test/src/features/some_test.dart  # single test file
```

**Required `.env` file** at project root before running:
```
OPEN_AI_TOKEN=...
STRIPE_PUBLISHABLE_KEY=...
ALGOLIA_APP_ID=...
ALGOLIA_SEARCH_KEY=...
REVENUE_CAT_PUBLIC_KEY=...
```

After editing `.env`, regenerate with `dart run build_runner build`.

## Architecture

**Clean Architecture + MVVM with Riverpod 3.0.1:**
- `Data Layer` → `Domain Layer` ← `Presentation Layer`
- Feature-first modules under `lib/src/features/`
- All state via `@riverpod`-annotated controllers/providers (code-generated `.g.dart` files)

### Feature Modules

| Feature | Purpose |
|---|---|
| `ai_chat` | Core AI tutor — OpenAI streaming, thread management, message history |
| `onboarding/auth` | Email, Apple, Google sign-in via Firebase Auth |
| `onboarding/subscription` | RevenueCat + Stripe subscription paywall |
| `onboarding/wizard` | First-run onboarding flow |
| `store` | Product catalog with Algolia search |
| `payment` | Stripe payment processing |
| `splash` | Auth state check on startup |

### Key Architectural Patterns

**Riverpod providers** (`lib/src/core/di/modules/firebase_module.dart`): All Firebase services (`FirebaseAuth`, `FirebaseFirestore`, `FirebaseStorage`, `FirebaseFunctions`, `FirebaseAppCheck`) are `keepAlive: true` Riverpod providers injected app-wide.

**Event-based controllers:**
```dart
@riverpod
class FeatureController extends _$FeatureController {
  @override
  Future<FeatureState> build() async { ... }

  void handleEvent(FeatureEvent event) { ... }
  // Uses AsyncValue.guard() for error handling
}
```

**Repository pattern**: Abstract interfaces in `domain/repository/`, implementations in `data/repository/`. Never access Firebase directly from UI or controllers — always through repository interfaces.

**AppConfig** (`lib/src/core/config/`): Loads AI model settings, tokens, and feature flags from Firestore at startup via `AppConfigRepository`.

### Navigation

`GoRouter` configured in `lib/src/router/app_router.dart`. Auth-protected routes redirect to `/welcome-sign` if unauthenticated. Uses `GoRouterRefreshStream` on `authStateChanges()`. All transitions use `NoTransitionPage`. Route names are defined in `lib/src/router/route_name.dart`.

### Responsive Design

- **Mobile**: `ScreenUtilInit` with design size `Size(402, 874)`. Use `.rsp` (font), `.rw` (width), `.rh` (height), `.rr` (radius) extensions.
- **Web**: Skips `ScreenUtilInit`. The same extensions return `toDouble() * 2` on web.
- `ResponsiveCenter` widget for max-width content centering on wide screens.

### Error Handling

Three-tier system:
1. `CommonError` / `StandardException` / `LocalException` — typed exception hierarchy in `lib/src/exceptions/`
2. `ErrorLogger` — Riverpod keepAlive provider that routes to `FirebaseCrashlytics` for `CommonError`, silent for `Standard`/`Local`
3. `AsyncErrorLogger` — `ProviderObserver` registered in `ProviderScope` that automatically intercepts all `AsyncError` states

### Firebase Emulators

`AppBootstrap.setupFirebaseEmulators()` exists but is commented out in `main.dart`. Uncomment to use local emulators for development.

## Code Generation

These files are auto-generated — **do not edit manually**:
- `*.g.dart` — Riverpod providers, JSON serialization
- `*.freezed.dart` — Freezed immutable models
- `lib/generated/assets.gen.dart` — Asset references (FlutterGen)
- `lib/generated/fonts.gen.dart` — Font references (FlutterGen)
- `lib/l10n/app_localizations*.dart` — Localization (from `lib/l10n/*.arb`)
