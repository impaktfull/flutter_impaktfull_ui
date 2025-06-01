class InputFieldValidatorResult {
  final bool isPendingFinalValidation;
  final String? _errorMessage;

  bool get isValid => _errorMessage == null || _errorMessage.isEmpty;

  String get errorMessage => _errorMessage ?? '';

  const InputFieldValidatorResult.pendingFinalValidation()
      : isPendingFinalValidation = true,
        _errorMessage = null;

  const InputFieldValidatorResult.invalid({
    required String errorMessage,
  })  : _errorMessage = errorMessage,
        isPendingFinalValidation = false;

  const InputFieldValidatorResult.valid()
      : _errorMessage = null,
        isPendingFinalValidation = false;
}
