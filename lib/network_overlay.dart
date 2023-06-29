import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        Center,
        Colors,
        Container,
        FontWeight,
        Key,
        Positioned,
        Stack,
        State,
        StatefulWidget,
        Text,
        TextStyle,
        Widget;

class NetworkOverlay extends StatefulWidget {
  final Widget child;
  const NetworkOverlay({Key? key, required this.child}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _NetworkOverlayState createState() => _NetworkOverlayState();
}

class _NetworkOverlayState extends State<NetworkOverlay> {
  late Connectivity _connectivity;
  late bool _isOffline;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  @override
  void initState() {
    super.initState();
    _connectivity = Connectivity();
    _isOffline = false;
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectivityStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  void _updateConnectivityStatus(ConnectivityResult result) {
    setState(() {
      _isOffline = (result == ConnectivityResult.none);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_isOffline)
          Positioned.fill(
            child: Container(
              color: Colors.black54,
              child: const Center(
                child: Text(
                  'No Internet Connection',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
