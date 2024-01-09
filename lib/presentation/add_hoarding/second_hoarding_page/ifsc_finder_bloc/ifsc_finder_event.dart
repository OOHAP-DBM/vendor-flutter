// Events
abstract class IFSCFinderEvent {}

class DropdownSelectionChanged extends IFSCFinderEvent {
  final String? bank;
  final String? state;
  final String? city;
  final String? branch;

  DropdownSelectionChanged(this.bank, this.state, this.city, this.branch);


}


