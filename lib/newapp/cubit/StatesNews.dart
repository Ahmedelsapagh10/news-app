abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsbottomState extends NewsStates {}

class bussinessSuccessState extends NewsStates {}

class bussinessErrorState extends NewsStates {
  final String error;
  bussinessErrorState(this.error);
}

class bussinessLoadingState extends NewsStates {}

class TechnologySuccessState extends NewsStates {}

class TechnologyErrorState extends NewsStates {
  final String error;
  TechnologyErrorState(this.error);
}

class TechnologyLoadingState extends NewsStates {}

class SportsSuccessState extends NewsStates {}

class SportsLoadingState extends NewsStates {}

class SportsErrorState extends NewsStates {
  final String error;
  SportsErrorState(this.error);
}

class ScienceSuccessState extends NewsStates {}

class ScienceErrorState extends NewsStates {
  final String error;
  ScienceErrorState(this.error);
}

class ScienceLoadingState extends NewsStates {}
class SearchSuccessState extends NewsStates {}

class SearchErrorState extends NewsStates {
  final String error;
  SearchErrorState(this.error);
}

class SearchLoadingState extends NewsStates {}
