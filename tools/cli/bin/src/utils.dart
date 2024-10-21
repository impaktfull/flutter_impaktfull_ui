extension StringExtension on String {
  String pascalToSnakeCase() => replaceAllMapped(
        RegExp(r'[A-Z]'),
        (Match match) => '_${match.group(0)!.toLowerCase()}',
      ).substring(1);

  String camelToSnakeCase() {
    if (isEmpty) return this;
    return this[0].toLowerCase() + substring(1);
  }
}
