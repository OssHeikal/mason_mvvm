import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/config/extensions/all_extensions.dart';
import '../../../../../core/config/service_locator/injection.dart';
import '../../../../../core/resources/cubit_status.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../controller/connectivity_cubit/connectivity_cubit.dart';
import '../widgets/error_view.dart';

final ValueNotifier<int> bottomNavNotifier = ValueNotifier<int>(0);

class ScaffoldWithNavBarScreen extends StatefulWidget {
  const ScaffoldWithNavBarScreen({super.key, required this.shell});

  final StatefulNavigationShell shell;

  @override
  State<ScaffoldWithNavBarScreen> createState() => _ScaffoldWithNavBarScreenState();
}

class _ScaffoldWithNavBarScreenState extends State<ScaffoldWithNavBarScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ConnectivityCubit>(),
      child: Scaffold(
        extendBody: true,
        body: BlocBuilder<ConnectivityCubit, ConnectivityState>(
          builder: (context, state) {
            switch (state.status) {
              case ConnectivityStatus.connected:
                return widget.shell;
              case ConnectivityStatus.disconnected:
                return ErrorView(onRetry: () {});
              default:
                return const CustomLoading().center();
            }
          },
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(boxShadow: ShadowStyles.bottomSheetShadow),
          child: ClipRRect(
            child: ValueListenableBuilder(
                valueListenable: bottomNavNotifier,
                builder: (context, value, _) {
                  return BottomNavigationBar(
                    elevation: 0,
                    currentIndex: value,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: context.scaffoldBackgroundColor,
                    onTap: (index) => _onTap(index),
                    items: List.generate(NavBarItemModel.items.length, (index) {
                      return NavBarItemModel.items[index].toWidget(context, index);
                    }),
                  );
                }),
          ),
        ),
      ),
    );
  }

  void _onTap(int index) {
    bottomNavNotifier.value = index;
    widget.shell.goBranch(index);
  }
}

class NavBarItemModel {
  final String iconPath;
  final String activeIconPath;
  final String label;

  NavBarItemModel({
    required this.iconPath,
    required this.activeIconPath,
    required this.label,
  });

  static List<NavBarItemModel> items = [];
}

extension NavBarItemModelExtension on NavBarItemModel {
  BottomNavigationBarItem toWidget(BuildContext context, int index) {
    return BottomNavigationBarItem(
      label: label.tr(),
      icon: SvgPicture.asset(
        iconPath,
        width: AppSize.s20.sp,
        colorFilter: ColorFilter.mode(context.iconColorUnselected, BlendMode.srcIn),
      ),
      activeIcon: SvgPicture.asset(activeIconPath, width: AppSize.s20.sp),
    );
  }
}
