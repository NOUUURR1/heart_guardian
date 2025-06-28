import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:firebase_database/firebase_database.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';
import 'dart:async';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  LatLng _childLocation = const LatLng(30.0444, 31.2357);
  bool _isLoading = true;
  String _connectionStatus = 'جاري الاتصال...';

  final DatabaseReference _locationRef = FirebaseDatabase.instance.ref('gps');
  late final MapController _mapController;
  StreamSubscription<DatabaseEvent>? _locationSubscription;
  DateTime? _lastUpdate;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _setupLocationListener();
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    super.dispose();
  }

  void _setupLocationListener() {
    _locationSubscription = _locationRef.onValue.listen(
      (DatabaseEvent event) {
        final now = DateTime.now();
        if (_lastUpdate != null &&
            now.difference(_lastUpdate!).inMilliseconds < 1000) {
          return;
        }
        _lastUpdate = now;

        try {
          if (event.snapshot.exists) {
            final data = event.snapshot.value;

            if (data is Map) {
              final latitude = data['latitude'];
              final longitude = data['longitude'];

              if (latitude != null && longitude != null) {
                double lat = double.tryParse(latitude.toString()) ?? 0.0;
                double lng = double.tryParse(longitude.toString()) ?? 0.0;

                if (_isValidCoordinate(lat, lng)) {
                  if (!mounted) return;
                  setState(() {
                    _childLocation = LatLng(lat, lng);
                    _isLoading = false;
                    _connectionStatus = 'متصل';
                  });

                  _mapController.move(_childLocation, 16.0);
                } else {
                  _setErrorState('إحداثيات غير صحيحة');
                }
              } else {
                _setErrorState('بيانات الموقع ناقصة');
              }
            } else {
              _setErrorState('تنسيق البيانات غير صحيح');
            }
          } else {
            _setErrorState('لا توجد بيانات موقع');
          }
        } catch (e) {
          _setErrorState('خطأ في قراءة البيانات: ${e.toString()}');
        }
      },
      onError: (error) {
        _setErrorState('خطأ في الاتصال: ${error.toString()}');
      },
    );
  }

  void _setErrorState(String message) {
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _connectionStatus = message;
    });
  }

  bool _isValidCoordinate(double lat, double lng) {
    return lat.abs() <= 90 && lng.abs() <= 180 && (lat != 0 || lng != 0);
  }

  void _refreshLocation() {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
      _connectionStatus = 'جاري التحديث...';
    });

    _locationSubscription?.cancel();
    _setupLocationListener();
  }

  Widget _buildStatusCard() {
    final isConnected = _connectionStatus == 'متصل';
    final bgColor =
        _isLoading
            ? Colors.orange.shade50
            : isConnected
            ? Colors.green.shade50
            : Colors.red.shade50;
    final borderColor =
        _isLoading
            ? Colors.orange
            : isConnected
            ? Colors.green
            : Colors.red;
    final iconColor = borderColor;
    final textColor =
        _isLoading
            ? Colors.orange[700]
            : isConnected
            ? Colors.green[700]
            : Colors.red[700];

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Icon(
            _isLoading
                ? Icons.sync
                : isConnected
                ? Icons.gps_fixed
                : Icons.gps_off,
            color: iconColor,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _connectionStatus,
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),
          ),
          if (!_isLoading)
            IconButton(
              onPressed: _refreshLocation,
              icon: const Icon(Icons.refresh),
              iconSize: 20,
              tooltip: 'تحديث الموقع',
            ),
        ],
      ),
    );
  }

  Widget _buildLocationInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Location:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue[700],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Latitude: ${_childLocation.latitude.toStringAsFixed(6)}',
            style: const TextStyle(fontFamily: 'monospace'),
          ),
          Text(
            'Longitude: ${_childLocation.longitude.toStringAsFixed(6)}',
            style: const TextStyle(fontFamily: 'monospace'),
          ),
        ],
      ),
    );
  }

  Widget _buildMap() {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: _childLocation,
        initialZoom: 16.0,
        minZoom: 3.0,
        maxZoom: 18.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c'],
          maxZoom: 18,
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: _childLocation,
              width: 60,
              height: 60,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red, width: 2),
                ),
                child: const Icon(
                  Icons.person_pin_circle,
                  color: Colors.red,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
        CircleLayer(
          circles: [
            CircleMarker(
              point: _childLocation,
              radius: 100,
              useRadiusInMeter: true,
              // ignore: deprecated_member_use
              color: Colors.blue.withOpacity(0.2),
              borderColor: Colors.blue,
              borderStrokeWidth: 2,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Child's Location",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFA0D1EF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            onPressed: _refreshLocation,
            icon: const Icon(Icons.refresh, color: Colors.white),
            tooltip: 'Update Location',
          ),
        ],
      ),
      body: Column(
        children: [
          _buildStatusCard(),
          if (!_isLoading) _buildLocationInfo(),
          const SizedBox(height: 8),
          Expanded(
            child:
                _isLoading
                    ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 16),
                          Text(
                            'Loading location...',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )
                    : _buildMap(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mapController.move(_childLocation, 16.0),
        backgroundColor: Colors.blue[600],
        tooltip: 'Return to Current Location',
        child: const Icon(Icons.my_location, color: Colors.white),
      ),
    );
  }
}
