library auth_repository;

/*
authenticationu bu paket içerisinde yapmamızın amacı cloud functionsları ve
cloud dosyalarını root klasörü olan libden uzak tutmaktır.
Böylece bu authenticationu istediğimiz her yerde kullanabiliriz.

 */

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
