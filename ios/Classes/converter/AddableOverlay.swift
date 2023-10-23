import NMapsMap

/// Wrapper of NMFOverlay
internal protocol NOverlay {
    associatedtype OverlayType: NMFOverlay

    var mapOverlay: OverlayType { get }
    
    static func fromMessageable(_ v: Any) -> Self
}

internal protocol AddableOverlay {
    associatedtype OverlayType: NMFOverlay

    var info: NOverlayInfo { get }

    func createMapOverlay() -> OverlayType

    static func fromMessageable(_ v: Any) -> Self
}

func asAddableOverlayFromMessageable(info: NOverlayInfo, json: Any) throws -> any AddableOverlay {
    let d = asDict(json)
    let creator: (Any) -> any AddableOverlay
    switch info.type {
    case .marker: creator = NMarker.fromMessageable
    case .infoWindow: creator = NInfoWindow.fromMessageable
    case .circleOverlay: creator = NCircleOverlay.fromMessageable
    case .groundOverlay: creator = NGroundOverlay.fromMessageable
    case .polygonOverlay: creator = NPolygonOverlay.fromMessageable
    case .polylineOverlay: creator = NPolylineOverlay.fromMessageable
    case .pathOverlay: creator = NPathOverlay.fromMessageable
    case .multipartPathOverlay: creator = NMultipartPathOverlay.fromMessageable
    case .arrowheadPathOverlay: creator = NArrowheadPathOverlay.fromMessageable
    case .locationOverlay: throw NSError()
    }
    return creator(d)
}

extension NMFLocationOverlay {
    func toMessageable() -> Dictionary<String, Any?> {
        [
            "info": NOverlayInfo.locationOverlayInfo.toMessageable(),
            Self.anchorName: NPoint.fromCGPointWithOutDisplay(anchor).toMessageable(),
            Self.circleColorName: circleColor.toInt(),
            Self.circleOutlineColorName: circleOutlineColor.toInt(),
            Self.circleOutlineWidthName: circleOutlineWidth,
            Self.circleRadiusName: circleRadius,
            Self.iconSizeName: NSize(width: iconWidth, height: iconHeight).toMessageable(),
            Self.positionName: location.toMessageable(),
            Self.subAnchorName: NPoint.fromCGPointWithOutDisplay(subAnchor).toMessageable(),
            Self.subIconSizeName: NSize(width: subIconWidth, height: subIconHeight).toMessageable(),
        ].merging(overlayToMessageable(self), uniquingKeysWith: { $1 })
    }

    private static let anchorName = "anchor"
    private static let circleColorName = "circleColor"
    private static let circleOutlineColorName = "circleOutlineColor"
    private static let circleOutlineWidthName = "circleOutlineWidth"
    private static let circleRadiusName = "circleRadius"
    private static let iconSizeName = "iconSize"
    private static let positionName = "position"
    private static let subAnchorName = "subAnchor"
    private static let subIconSizeName = "subIconSize"
}

private func overlayToMessageable(_ overlay: NMFOverlay) -> Dictionary<String, Any?> {
    [
        zIndexName: overlay.zIndex,
        globalZIndexName: overlay.globalZIndex,
        isVisibleName: !overlay.hidden,
        minZoomName: overlay.minZoom,
        maxZoomName: overlay.maxZoom,
        isMinZoomInclusiveName: overlay.isMinZoomInclusive,
        isMaxZoomInclusiveName: overlay.isMaxZoomInclusive,
    ]
}
