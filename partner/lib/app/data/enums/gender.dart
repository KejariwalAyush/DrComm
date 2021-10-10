enum Gender { FEMALE, MALE, OTHER }

String getGenderString(Gender gender) {
  switch (gender) {
    case Gender.MALE:
      return 'Male';
    case Gender.FEMALE:
      return 'Female';
    case Gender.OTHER:
      return 'Other';
    default:
      return 'Other';
  }
}

Gender getGender(String gender) {
  switch (gender) {
    case 'Male':
      return Gender.MALE;
    case 'Female':
      return Gender.FEMALE;
    case 'Other':
      return Gender.OTHER;
    default:
      return Gender.MALE;
  }
}
