abstract class Validator {
  static String? requiredEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'O e-mail é obrigatório';
    }

    final emailRegex = RegExp(r'^.+@.+\..+$');

    if (!emailRegex.hasMatch(value)) {
      return 'Insira um e-mail válido';
    }

    return null;
  }

  static String? requiredSenha(String? value) {
    if (value == null || value.isEmpty) {
      return 'A senha é obrigatória';
    }

    if (value.length < 7) {
      return 'A senha deve ter pelo menos 7 caracteres';
    }

    return null;
  }
}
