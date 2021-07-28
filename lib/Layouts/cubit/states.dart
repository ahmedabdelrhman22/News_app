abstract class NewStates
{

}
class InitialState extends NewStates
{

}
class NewsBootomNavState extends NewStates
{

}
class NewsGetBusinessSuccessState extends NewStates
{

}
class NewsGetBusinessLoadingState extends NewStates
{

}
class NewsGetBusinessErrorState extends NewStates {
  final String error;

  NewsGetBusinessErrorState (this.error);

}

class NewsGetSportsSuccessState extends NewStates
{

}
class NewsGetSportsLoadingState extends NewStates
{

}
class NewsGetSportsErrorState extends NewStates {
  final String error;

  NewsGetSportsErrorState (this.error);

}



class NewsGetScienceSuccessState extends NewStates
{

}
class NewsGetScienceLoadingState extends NewStates
{

}
class NewsGetScienceErrorState extends NewStates
{

  final String error;

  NewsGetScienceErrorState(this.error);


}


class NewsGetSearchSuccessState extends NewStates
{

}
class NewsGetSearchLoadingState extends NewStates
{

}
class NewsGetSearchErrorState extends NewStates
{

  final String error;

  NewsGetSearchErrorState(this.error);


}


class ChangeAppModeState extends NewStates
{

}


