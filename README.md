> **Note:** To access all shared projects, get information about environment setup, and view other guides, please visit [Explore-In-HMOS-Wearable Index](https://github.com/Explore-In-HMOS-Wearable/hmos-index).

# How to implement routing with MapKit

This codelab shows how to use MapKit to implement routing functionality on HarmonyOS.  
The project (**MapRoutingTask**) demonstrates how to visualize start and end points on a map and dynamically draw a connecting route.

# Preview
<div>
<img src="screenshot/1.png" width="25%" />
</div>


# Use Cases
- Set start and end points with markers
- Dynamically draw route with `MapArcParams`
- Handle map callbacks and controller with `MapComponent`



# Tech Stack
- **Languages**: ArkTS, ArkUI
- **Frameworks**: HarmonyOS SDK 5.0.2(14)
- **Tools**: DevEco Studio 5.1.0.828
- **Libraries**: @kit.MapKit


# Directory Structure
```
entry/src/main/ets/
├── entryability
│    └── EntryAbility.ets
├── entrybackupability
│    └── EntryBackupAbility.ets
└── pages
     └── Index.ets
```


# Constraints and Restrictions
## Supported Device
- HarmonyOS devices with MapKit support (e.g. Huawei Watch 5, compatible phones/emulators)
## Preparations Before Run
- You must **manually sign the application** before running it.
- Otherwise, the map will appear as a **white screen** with no information.
- [🔗 Learn how to sign your application](https://developer.huawei.com/consumer/en/doc/harmonyos-guides/map-config-agc)

- [🔗 Map kit supported countries/regions](https://developer.huawei.com/consumer/en/doc/harmonyos-guides/map-supported)


# License
**MapRoutingTask** is distributed under the terms of the MIT License.  
See the [LICENSE](LICENSE) file for more information.  
