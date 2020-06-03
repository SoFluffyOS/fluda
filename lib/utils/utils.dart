catchAll(Function() function) {
  try {
    function();
  } catch (_) {}
}
