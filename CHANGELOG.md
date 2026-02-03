# Changelog

## Unreleased

- Fix: Add missing `import java.util.Properties` to `android/app/build.gradle.kts` to fix Kotlin DSL compilation errors.
- Fix: Upgrade Kotlin Gradle plugin to `2.1.0` in `android/settings.gradle.kts` to address deprecation warnings.
- Fix: Add `android/app/proguard-rules.pro` to prevent missing-file warnings during release builds.

Notes:
- Build verified with `flutter build appbundle -v` and the release AAB was produced successfully.
