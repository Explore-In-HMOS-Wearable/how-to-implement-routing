import { MapComponent } from '@hms.core.map.MapComponent';
import { map, mapCommon, navi } from '@kit.MapKit';
import { AsyncCallback, BusinessError } from '@kit.BasicServicesKit';
import { geoLocationManager } from '@kit.LocationKit';

@Entry
@Component
struct Index {
  private mapOptions?: mapCommon.MapOptions;
  private callback?: AsyncCallback<map.MapComponentController>;
  private mapController?: map.MapComponentController;
  private mapEventManager?: map.MapEventManager
  private firstLocation: navi.RouteCoordinate = { latitude: 40.9831267033108, longitude: 29.022204423900796 }
  private secondLocation: navi.RouteCoordinate = { latitude: 40.99799561269982, longitude: 29.043634921371325 }

  aboutToAppear(): void {
    this.mapOptions = {
      position: {
        target: { latitude: 40.9831267033108, longitude: 29.022204423900796 },
        zoom: 11
      }
    };

    this.callback = async (err, mapController) => {
      if (!err) {
        this.mapController = mapController;
        this.mapEventManager = this.mapController.getEventManager();
        let drawRoute = async () => {

          try {
            let params: navi.RouteParams = {
              origins: [this.firstLocation],
              destination: this.secondLocation,
              language: "en"
            };
            console.log('get routes');
            const result = await navi.getWalkingRoutes(params);

            if (result && result.routes.length !== 0) {
              let polylineOption: mapCommon.MapPolylineOptions = {
                points: result.routes[0].overviewPolyline!,
                color: 0xFF089C57,
                jointType: mapCommon.JointType.ROUND,
                width: 12
              };

              await this.mapController?.addPolyline(polylineOption);

            }
          } catch (e) {
            console.error('draw route error', JSON.stringify(e))
          }
        }
        this.mapEventManager.on('mapLoad', drawRoute)

      } else {
        console.error('Map initialization failed:', err);
      }
    };

  }

  build() {
    Stack() {
      MapComponent({ mapOptions: this.mapOptions, mapCallback: this.callback }).width('100%').height('100%')


    }
  }
}