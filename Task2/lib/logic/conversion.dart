class Converter {
  convert(String? from, String? to, amount) {
    if (from != null && to != null) {
      var metrics = ["CM", "M", "KM"];
      var divide = metrics.indexOf(from) < metrics.indexOf(to) ? true : false;
      double res;

      var save = {
        "CMM": 100,
        "MKM": 1000,
        "CMKM": 100000,

      };

      var saveValue = save[from + to] ?? save[to + from];

      if (divide) {
        res = amount / saveValue;
      } else {
        res = amount * saveValue;
      }

      return res;
    }
  }
}