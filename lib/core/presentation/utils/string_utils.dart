
extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() =>
      replaceAll(RegExp(' +'), ' ')
          .split(' ')
          .map((String str) => str.contains(RegExp(r'\d'))
          ? str.replaceAllMapped(
        RegExp(r'(\d+)\p{Ll}'),
            (Match match) => '${match.group(1)}${match.group(2)?.toUpperCase()}',
      )
          : str.toCapitalized())
          .join(' ');
}

