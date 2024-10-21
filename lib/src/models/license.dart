class ImpaktfullUiLicense {
  final String name;
  final List<String> licenses;

  String get licenseString => licenses.join('\n\n---\n\n');

  const ImpaktfullUiLicense({
    required this.name,
    required this.licenses,
  });
}
