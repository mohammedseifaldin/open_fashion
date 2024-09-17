String? emailValidator(String? text) {
  if (text == null) {
    return "الرجاء كتابة عنوان بريدك الإلكتروني";
  }
  final good = RegExp(
          r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(text);
  return good ? null : "تأكد من كتابة البريد بشكل صحيح";
}

String? passValidator(String? text) {
  if (text == null) {
    return "الرجاء كتابة كلمة المرور";
  }
  return text.length > 7 ? null : "كلمة المرور قصيرة";
}

String? defaultValidator(String? text) {
  if (text == null || text.isEmpty) {
    return "الرجاء ملئ هذا الحقل";
  }
  return null;
}

String? nameValidator(String? text) {
  if (text == null || text.isEmpty) {
    return "الرجاء ملئ هذا الحقل";
  }
  if (text.length < 3) {
    return "الإسم قصير جداً";
  }
  if (text.length > 20) {
    return "الإسم طويل جداً";
  }
  return null;
}


String? priceValidator(String? text) {
  ///TODO implement this
  return null;
}
