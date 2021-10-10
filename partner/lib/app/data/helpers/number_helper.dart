String FormatNumber(int n) {
  if (n > 1000)
    return '${(n / 1000).toStringAsPrecision(2)} K';
  else if (n > 100000)
    return '${(n / 100000).toStringAsPrecision(2)} L';
  else if (n > 10000000)
    return '${(n / 10000000).toStringAsPrecision(2)} Cr';
  else if (n > 10000000000)
    return '${(n / 10000000000).toStringAsPrecision(2)} B';
  return n.toString();
}
