class PhysicCurrencyListResponse {
  List<PhysicCurrency> list;

  PhysicCurrencyListResponse(String data)
      : list = data.split('\n').skip(1).where((e) => e.isNotEmpty).map(
          (e) {
            final row = e.split(',');
            final code = row.first;
            final name = row.last;

            return PhysicCurrency(
              code: code,
              name: name,
            );
          },
        ).toList(growable: false);
}

class PhysicCurrency {
  final String code;
  final String name;

  PhysicCurrency({
    required this.code,
    required this.name,
  });
}
