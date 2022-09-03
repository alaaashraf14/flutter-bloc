import 'package:bloc/bloc.dart';
import 'package:course_project/data-layer/model/characters.dart';
import 'package:course_project/data-layer/model/quotes.dart';
import 'package:course_project/data-layer/repoistories/characters_repoistories.dart';
import 'package:meta/meta.dart';


part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }

  void getQuotes(String charName) {
    charactersRepository.getCharacterQuotes(charName).then((quotes) {
      emit(QuotesLoaded(quotes));
    });
  }
}