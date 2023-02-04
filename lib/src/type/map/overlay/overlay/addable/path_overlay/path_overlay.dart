part of flutter_naver_map;

class NPathOverlay extends NAddableOverlay<NPathOverlay> {
  List<NLatLng> get coords => _coords;
  List<NLatLng> _coords;

  double get width => _width;
  double _width;

  Color get color => _color;
  Color _color;

  Color get outlineColor => _outlineColor;
  Color _outlineColor;

  double get outlineWidth => _outlineWidth;
  double _outlineWidth;

  Color get passedColor => _passedColor;
  Color _passedColor;

  Color get passedOutlineColor => _passedOutlineColor;
  Color _passedOutlineColor;

  double get progress => _progress;
  double _progress;

  NOverlayImage? _patternImage;

  double get patternInterval => _patternInterval;
  double _patternInterval;

  bool get isHideCollidedCaptions => _isHideCollidedCaptions;
  bool _isHideCollidedCaptions;

  bool get isHideCollidedMarkers => _isHideCollidedMarkers;
  bool _isHideCollidedMarkers;

  bool get isHideCollidedSymbols => _isHideCollidedSymbols;
  bool _isHideCollidedSymbols;

  NPathOverlay({
    required String id,
    required List<NLatLng> coords,
    double width = 4,
    Color color = Colors.white,
    double outlineWidth = 1,
    Color outlineColor = Colors.black,
    Color passedColor = Colors.white,
    Color passedOutlineColor = Colors.black,
    double progress = 0, // -1 ~ 1
    NOverlayImage? patternImage,
    double patternInterval = 20,
    bool isHideCollidedCaptions = false,
    bool isHideCollidedMarkers = false,
    bool isHideCollidedSymbols = false,
  })  : _coords = coords,
        _width = width,
        _color = color,
        _outlineWidth = outlineWidth,
        _outlineColor = outlineColor,
        _passedColor = passedColor,
        _passedOutlineColor = passedOutlineColor,
        _progress = progress,
        _patternImage = patternImage,
        _patternInterval = patternInterval,
        _isHideCollidedCaptions = isHideCollidedCaptions,
        _isHideCollidedMarkers = isHideCollidedMarkers,
        _isHideCollidedSymbols = isHideCollidedSymbols,
        super(id: id, type: NOverlayType.pathOverlay);

  void setCoords(List<NLatLng> coords) {
    _coords = coords;
    _set(_coordsName, coords);
  }

  void setWidth(double width) {
    _width = width;
    _set(_widthName, width);
  }

  void setColor(Color color) {
    _color = color;
    _set(_colorName, color.value);
  }

  void setOutlineColor(Color outlineColor) {
    _outlineColor = outlineColor;
    _set(_outlineColorName, outlineColor.value);
  }

  void setOutlineWidth(double outlineWidth) {
    _outlineWidth = outlineWidth;
    _set(_outlineWidthName, outlineWidth);
  }

  void setPassedColor(Color passedColor) {
    _passedColor = passedColor;
    _set(_passedColorName, passedColor.value);
  }

  void setPassedOutlineColor(Color passedOutlineColor) {
    _passedOutlineColor = passedOutlineColor;
    _set(_passedOutlineColorName, passedOutlineColor.value);
  }

  void setProgress(double progress) {
    _progress = progress;
    _set(_progressName, progress);
  }

  void setPatternImage(NOverlayImage patternImage) {
    _patternImage = patternImage;
    _set(_patternImageName, patternImage);
  }

  void setPatternInterval(double patternInterval) {
    _patternInterval = patternInterval;
    _set(_patternIntervalName, patternInterval);
  }

  void setIsHideCollidedCaptions(bool isHideCollidedCaptions) {
    _isHideCollidedCaptions = isHideCollidedCaptions;
    _set(_isHideCollidedCaptionsName, isHideCollidedCaptions);
  }

  void setIsHideCollidedMarkers(bool isHideCollidedMarkers) {
    _isHideCollidedMarkers = isHideCollidedMarkers;
    _set(_isHideCollidedMarkersName, isHideCollidedMarkers);
  }

  void setIsHideCollidedSymbols(bool isHideCollidedSymbols) {
    _isHideCollidedSymbols = isHideCollidedSymbols;
    _set(_isHideCollidedSymbolsName, isHideCollidedSymbols);
  }

  Future<NLatLngBounds> getBounds() {
    return _getAsyncWithCast(_boundsName, NLatLngBounds._fromJson);
  }

  factory NPathOverlay._fromJson(dynamic json) => NPathOverlay(
        id: NOverlayInfo._fromJson(json[_infoName]!).id,
        coords: (json[_coordsName] as List).map(NLatLng._fromJson).toList(),
        width: json[_widthName],
        color: Color(json[_colorName]),
        outlineWidth: json[_outlineWidthName],
        outlineColor: Color(json[_outlineColorName]),
        passedColor: Color(json[_passedColorName]),
        passedOutlineColor: Color(json[_passedOutlineColorName]),
        progress: json[_progressName],
        patternImage: json[_patternImageName] != null
            ? NOverlayImage._fromJson(json[_patternImageName])
            : null,
        patternInterval: json[_patternIntervalName],
        isHideCollidedCaptions: json[_isHideCollidedCaptionsName],
        isHideCollidedMarkers: json[_isHideCollidedMarkersName],
        isHideCollidedSymbols: json[_isHideCollidedSymbolsName],
      );

  @override
  NPayload toNPayload() => NPayload.make({
        _infoName: info,
        _coordsName: _coords,
        _widthName: _width,
        _colorName: _color.value,
        _outlineWidthName: _outlineWidth,
        _outlineColorName: _outlineColor.value,
        _passedColorName: _passedColor.value,
        _passedOutlineColorName: _passedOutlineColor.value,
        _progressName: _progress,
        _patternImageName: _patternImage,
        _patternIntervalName: _patternInterval,
        _isHideCollidedCaptionsName: _isHideCollidedCaptions,
        _isHideCollidedMarkersName: _isHideCollidedMarkers,
        _isHideCollidedSymbolsName: _isHideCollidedSymbols,
      });

  /*
    --- Messaging Name Define ---
  */
  static const _infoName = "info";
  static const _coordsName = "coords";
  static const _widthName = "width";
  static const _colorName = "color";
  static const _outlineWidthName = "outlineWidth";
  static const _outlineColorName = "outlineColor";
  static const _passedColorName = "passedColor";
  static const _passedOutlineColorName = "passedOutlineColor";
  static const _progressName = "progress";
  static const _patternImageName = "patternImage";
  static const _patternIntervalName = "patternInterval";
  static const _isHideCollidedCaptionsName = "isHideCollidedCaptions";
  static const _isHideCollidedMarkersName = "isHideCollidedMarkers";
  static const _isHideCollidedSymbolsName = "isHideCollidedSymbols";
  static const _boundsName = "bounds";
}
