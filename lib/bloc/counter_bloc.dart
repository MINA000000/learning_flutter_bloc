import 'package:flutter_bloc/flutter_bloc.dart';
class CounterEvent{}
class CounterIncrement extends CounterEvent{}
class CounterDecrement extends CounterEvent{}

class CounterIncremented{}
class CounterBloc extends Bloc<CounterEvent,int>{
  CounterBloc(): super(0){
   on<CounterIncrement>((event,emit){
     emit(state+1);
   });
   on<CounterDecrement>((event,emit){
     emit(state-1);
   });
  }
}