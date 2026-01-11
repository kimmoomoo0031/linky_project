class FormGate {
  const FormGate._();

  static bool canSubmit({
    required bool isBusy,
    required List<bool> conditions,
  }) {
    if (isBusy) return false;
    return conditions.every((c) => c);
  }
}


