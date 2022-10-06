import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:promdifarm_app/core/const/strings.dart';
import 'package:promdifarm_app/view/bloc/index.dart';
import 'package:promdifarm_app/core/di/index.dart';
import 'package:promdifarm_app/view/pages/feedback.page.dart';
import 'package:promdifarm_app/view/pages/help_centre.dart';
import 'package:promdifarm_app/view/pages/rider_change_password.dart';
import 'package:promdifarm_app/view/pages/index.dart';
import 'package:promdifarm_app/view/pages/profile_rider.dart';
import 'package:promdifarm_app/view/pages/rider_deliveries.dart';
import 'package:promdifarm_app/view/pages/transaction_history.dart';
import 'package:promdifarm_app/view/widgets/shared.dart';

class Routes {
  static List<GoRoute> routes = [
    createBlocRoute<LoginPage, UserCubit>(
      path: ROUTE.LOGIN,
      page: LoginPage(),
    ),
    createBlocRoute<SignUpPage, UserCubit>(
      path: ROUTE.SIGN_UP,
      page: SignUpPage(),
    ),
    createBlocRoute<DeliveriesPage, DeliveriesCubit>(
      path: ROUTE.DELIVERIES,
      page: DeliveriesPage(),
    ),
    createBlocRoute<RiderProfile, DeliveriesCubit>(
      path: ROUTE.RIDERPROFILE,
      page: RiderProfile(),
    ),
    createBlocRoute<RiderPassword, DeliveriesCubit>(
      path: ROUTE.RIDERPASSWORD,
      page: RiderPassword(),
    ),
    createBlocRoute<RiderDeliveries, DeliveriesCubit>(
      path: ROUTE.RIDERDELIVERIES,
      page: RiderDeliveries(),
    ),
    createBlocRoute<helpCentre, DeliveriesCubit>(
      path: ROUTE.HELPCENTRE,
      page: helpCentre(),
    ),
    createBlocRoute<pageFeedback, DeliveriesCubit>(
      path: ROUTE.FEEDBACK,
      page: pageFeedback(),
    ),
    createBlocRoute<transactionHistory, DeliveriesCubit>(
      path: ROUTE.TRANSACTION,
      page: transactionHistory(),
    ),
    GoRoute(
      path: '/${ROUTE.MAP}/:id',
      name: ROUTE.MAP,
      builder: (context, state) => BlocProvider(
        create: (BuildContext context) => sl<DeliveriesCubit>(),
        child: Shared.template(
          context: context,
          body: MapPage(id: state.params['id']!),
          title: "Map",
        ),
      ),
    ),
    createRoute(path: ROUTE.STATUS, page: StatusPage()),
    createRoute(path: ROUTE.HISTORY, page: HistoryPage()),
    createRoute(path: ROUTE.WALLET, page: WalletPage()),
    createRoute(path: ROUTE.FORGET_PW, page: ForgetPasswordPage()),
  ];

  static GoRoute createRoute<T extends Widget>({
    required String path,
    required T page,
  }) {
    return GoRoute(
      path: '/$path',
      name: path,
      pageBuilder: (context, state) => MaterialPage<T>(
        key: state.pageKey,
        child: page,
      ),
    );
  }

  static GoRoute createBlocRouteWithParams<T extends Widget>({
    required String path,
    required String param,
    required Widget Function(
      BuildContext,
      GoRouterState,
    )
        builder,
  }) {
    return GoRoute(path: '/$path$param', name: path, builder: builder);
  }

  static GoRoute createBlocRoute<T extends Widget, K extends Cubit>({
    required String path,
    required T page,
  }) {
    return GoRoute(
      path: '/$path',
      name: path,
      builder: (context, state) => BlocProvider(
        create: (BuildContext context) => sl<K>(),
        child: page,
      ),
    );
  }

  static MaterialPage<void> Function(
    BuildContext,
    GoRouterState,
  ) errorPage = (
    context,
    state,
  ) =>
      MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(state.error.toString()),
          ),
        ),
      );
}
