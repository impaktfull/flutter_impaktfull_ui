class ImpaktfullUiInputFieldValidatorResult {
  final bool isPendingFinalValidation;
  final String? _errorMessage;

  bool get isValid => _errorMessage == null || _errorMessage.isEmpty;

  String get errorMessage => _errorMessage ?? '';

  const ImpaktfullUiInputFieldValidatorResult.pendingFinalValidation()
      : isPendingFinalValidation = true,
        _errorMessage = null;

  const ImpaktfullUiInputFieldValidatorResult.invalid({
    required String errorMessage,
  })  : _errorMessage = errorMessage,
        isPendingFinalValidation = false;

  const ImpaktfullUiInputFieldValidatorResult.valid()
      : _errorMessage = null,
        isPendingFinalValidation = false;
}
