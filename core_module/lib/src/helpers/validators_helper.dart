abstract class ValidatorsHelper {
  static bool emailIsValid(String? email) {
    const emailPattern =
        r'^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';

    final regex = RegExp(emailPattern);

    if (email != null) return regex.hasMatch(email);

    return false;
  }

  static bool phoneIsValid(String? phone) {
    const phonePattern = r'^\(?\d{2}\)?[\s-]?9?\d{4}-?\d{4}$';

    final regex = RegExp(phonePattern);

    if (phone != null) return regex.hasMatch(phone);

    return false;
  }

  static bool documentIsValid(String? document) {
    const cpfPattern = r'^\d{3}\.\d{3}\.\d{3}-\d{2}$|^\d{11}$';
    const cnpjPattern = r'^\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}$|^\d{14}$';

    final cpfRegex = RegExp(cpfPattern);
    final cnpjRegex = RegExp(cnpjPattern);

    if (document != null) {
      return cpfRegex.hasMatch(document) || cnpjRegex.hasMatch(document);
    }

    return false;
  }
}
