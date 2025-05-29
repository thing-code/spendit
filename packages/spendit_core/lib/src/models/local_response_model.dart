import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_response_model.freezed.dart';

@Freezed(genericArgumentFactories: true)
/// Contoh Penggunaan [ApiResponseModel] :
///```dart
/// try {
///   return LocalResponseSuccess.fromJson(
///     json,
///     (data) => DataModel.fromJson(data as Map<String, dynamic>),
///   );
/// } catch (e) {
///   return LocalResponseFailure(e.toString());
/// }
///```
sealed class LocalResponseModel<T> with _$LocalResponseModel<T> {
  const factory LocalResponseModel.success(T data) = LocalResponseSuccess;
  const factory LocalResponseModel.failure(String message) = LocalResponseFailure;
}
