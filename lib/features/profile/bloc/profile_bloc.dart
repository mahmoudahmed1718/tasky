import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/profile/bloc/profile_state.dart';

class ProfileBloc extends Cubit<ProfileState> {
  ProfileBloc() : super(ProfileState());
}
