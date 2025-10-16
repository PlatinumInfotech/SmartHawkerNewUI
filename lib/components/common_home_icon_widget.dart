import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'common_home_icon_model.dart';
export 'common_home_icon_model.dart';

/// create a home icon so i can use on my pages and color is white
class CommonHomeIconWidget extends StatefulWidget {
  const CommonHomeIconWidget({super.key});

  @override
  State<CommonHomeIconWidget> createState() => _CommonHomeIconWidgetState();
}

class _CommonHomeIconWidgetState extends State<CommonHomeIconWidget> {
  late CommonHomeIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommonHomeIconModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: AlignmentDirectional(1.0, -1.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('COMMON_HOME_ICON_Icon_w0mod4zb_ON_TAP');
              logFirebaseEvent('Icon_navigate_to');

              context.pushNamed(HomePageWidget.routeName);
            },
            child: Icon(
              Icons.home,
              color: Colors.white,
              size: 32.0,
            ),
          ),
        ),
      ],
    );
  }
}
