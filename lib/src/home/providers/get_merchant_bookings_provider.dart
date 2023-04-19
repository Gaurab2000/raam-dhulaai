import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:raam_dhulaai/src/core/enum/order_type.dart';
import 'package:raam_dhulaai/src/home/data_source/booking_data_source.dart';
import 'package:raam_dhulaai/src/home/models/booking_model.dart';

part 'get_merchant_bookings_provider.freezed.dart';

class GetMerchantBookingsNotifier extends StateNotifier<GetMerchantBookingsState> {
  GetMerchantBookingsNotifier(this._dataSource) : super(const GetMerchantBookingsState.initial());
  final BookingDataSource _dataSource;

  Future<void> getMerchantBookings() async {
    state = const GetMerchantBookingsState.loading();
    final response = await _dataSource.getMerchantBookings();
    state = response.fold(
      (error) => error.when(
        serverError: (message) => GetMerchantBookingsState.error(message: message),
        noInternet: () => const GetMerchantBookingsState.noInternet(),
      ),
      (response) {
        final previous = <BookingModel>[];
        final upcoming = <BookingModel>[];
        for (var booking in response) {
          if (booking.orderType == OrderType.Completed || booking.orderType == OrderType.Cancelled) {
            previous.add(booking);
          } else {
            upcoming.add(booking);
          }
        }
        print(response);
        return GetMerchantBookingsState.success(
          previous: previous,
          upcoming: upcoming,
        );
      },
    );
  }

  Future<void> updateBookings({required String bookingId, required OrderType orderType}) async {
    state = const GetMerchantBookingsState.loading();
    final response = await _dataSource.updateBookings(bookingId: bookingId, orderType: orderType);
    await getMerchantBookings();
    state = response.fold(
      (error) => error.when(
        serverError: (message) => GetMerchantBookingsState.error(message: message),
        noInternet: () => const GetMerchantBookingsState.noInternet(),
      ),
      (response) {
        final _state = state as _Success;
        return GetMerchantBookingsState.success(
          previous: _state.previous,
          upcoming: _state.upcoming,
        );
      },
    );
  }
}

final getMerchantBookingsStateProvider =
    StateNotifierProvider<GetMerchantBookingsNotifier, GetMerchantBookingsState>((ref) {
  return GetMerchantBookingsNotifier(
    ref.read(bookingDataSourceProvider),
  )..getMerchantBookings();
});

@freezed
class GetMerchantBookingsState with _$GetMerchantBookingsState {
  const factory GetMerchantBookingsState.initial() = _Initial;

  const factory GetMerchantBookingsState.loading() = _Loading;

  const factory GetMerchantBookingsState.noInternet() = _NoInternet;

  const factory GetMerchantBookingsState.success({
    required List<BookingModel> previous,
    required List<BookingModel> upcoming,
  }) = _Success;

  const factory GetMerchantBookingsState.error({
    required String message,
  }) = _Error;
}
