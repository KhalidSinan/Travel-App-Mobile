String getClassType(String classType) {
  if (classType == 'First Class') {
    return 'A';
  } else if (classType == 'Business Class' || classType == 'Bussiness Class') {
    return 'B';
  } else {
    return 'C';
  }
}
