class ApiResource<T> {
  final T? _data;
  final Exception? _error;

  factory ApiResource.success(T data) => ApiResource._(data, null);

  factory ApiResource.failure(Exception e) => ApiResource._(null, e);

  ApiResource._(this._data, this._error);

  R fold<R>({
    required R Function(T) success,
    required R Function(Exception) failure,
  }) {
    if (_error != null) {
      return failure(_error as Exception);
    } else {
      return success(_data as T);
    }
  }

  ApiResource<T> onSuccess(Function(T) success) {
    final data = _data;

    if (data != null) {
      success(data);
    }

    return this;
  }

  ApiResource<T> onFailure(Function(Exception) failure) {
    final error = _error;

    if (error != null) {
      failure(error);
    }

    return this;
  }

  T get requireValue => _data as T;

  Exception get requireException => _error as Exception;
}

Future<ApiResource<T>> runCatching<T>(Future<T> action) async {
  try {
    return ApiResource.success(await action);
  } catch (e) {
    return ApiResource.failure(e as Exception);
  }
}
