import 'package:flutter/material.dart';

class ProfileContainer extends StatefulWidget {
  final String field1;
  final String value1;
  final IconData icon1;
  final String field2;
  final String value2;
  final IconData icon2;
  const ProfileContainer(
      {Key? key,
      required this.field1,
      required this.value1,
      required this.icon1,
      required this.field2,
      required this.value2,
      required this.icon2})
      : super(key: key);

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  @override
  Widget build(BuildContext context) {
    final field1 = widget.field1;
    final value1 = widget.value1;
    final icon1 = widget.icon1;
    final field2 = widget.field2;
    final value2 = widget.value2;
    final icon2 = widget.icon2;

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: const Color(0xA82B7DF4),
          borderRadius: BorderRadius.circular(15),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 10, 10, 10),
                          child: Icon(icon1)),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10, 10, 10, 10),
                        child: Text('$field1 - $value1'),
                      )
                    ],
                  )),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 10, 10, 10),
                          child: Icon(icon2)),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10, 10, 10, 10),
                        child: Text('$field2 - $value2'),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
