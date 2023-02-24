import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_position_event.freezed.dart';

@freezed
class AddPositionEvent with _$AddPositionEvent {
  factory AddPositionEvent.init(String instrumentId) = AddPositionEventInit;

  factory AddPositionEvent.submit() = AddPositionEventSubmit;

  factory AddPositionEvent.currencyChanged(String? currency) = AddPositionEventCurrencyChanged;

  factory AddPositionEvent.priceChanged(String? price) = AddPositionEventPriceChanged;

  factory AddPositionEvent.countChanged(String? count) = AddPositionEventCountChanged;

  factory AddPositionEvent.dateChanged(DateTime date) = AddPositionEventDateChanged;
}
