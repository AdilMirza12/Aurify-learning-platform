/// Responsive numerical extensions providing `.w`, `.h`, `.r`, `.sp` getters.
extension NumResponsiveExtension on num {
  /// Width scaling
  double get w => toDouble();

  /// Height scaling
  double get h => toDouble();

  /// Radius scaling
  double get r => toDouble();

  /// Font size scaling
  double get sp => toDouble();
}
