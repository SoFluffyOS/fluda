typedef ErrorCallback(T);

/// Runs the `function` and ignore all the errors.
///
/// Runs function [ErrorCallback] `onError` when there is an error
/// Returns `true` whether there is no error.
bool catchAll(Function function, {ErrorCallback? onError}) {
  try {
    function();
    return true;
  } catch (error) {
    if (onError != null) {
      onError(error);
    }
  }
  return false;
}

/// Runs the async `function` and ignore all the errors.
///
/// Runs function [ErrorCallback] `onError` when there is an error
/// Returns `true` whether there is no error.
Future<bool> asyncCatchAll(Function function, {ErrorCallback? onError}) async {
  try {
    await function();
    return true;
  } catch (error) {
    if (onError != null) {
      await onError(error);
    }
  }
  return false;
}
