# The English Premier League
 
 ## Run Requirements 
 * XCode Version 14.0.1
 

 ## OVERVIEW
  - The English Premier League is a simple iOS App built using MVVM Clean Architecture and SwiftUI and Moya.

## High Level Layers
* **Domain Layer** = Entities + Use Cases + Repositories Interfaces.
* **Data Repositories Layer** = Repositories Implementations + API (Network).
* **Presentation Layer (MVVM)** = ViewModels + Views.

## Data Flow
* 1. `View(UI)` calls method from `ViewModel (Presenter)`.
* 2. `ViewModel` executes Use Case.
* 3. `Use Case` combines data from User and Repositories.
* 4. Each Repository returns data from a Remote Data `(Network)`
* 5. Information flows back to the `View(UI)` where we display the weaather data.


## Dependency Direction
* `Use Factory Dependency Injection To Solve Dependencies` 
* `Presentation Layer` `->` `Domain Layer` `<-` `Data Repositories Layer`
* `Presentation Layer (MVVM)` = `ViewModels(Presenters)` + `Views(UI)`
* `Domain Layer` = `Entities` + `Use Cases` + `Repositories Interfaces`
* `Data Repositories Layer` = `Repositories Implementations` + `API(Network)` + `Persistence DB`
* For more about Factory please check: (https://github.com/hmlongco/Factory)


## Folder Structure
![](https://github.com/aoliman/The-English-Premier-League/blob/main/MVVMCleanArchitecture.png?raw=true)


##### Domain Layer
* It contains Entities, CompetitionsMatchesUseCase which fetches the Matches data.
* it contains Data Repositories Interfaces which are needed for Dependency Inversion.


##### Presentation Layer
* Containts the ViewModels with the necessary data and it logic.
* `ViewModels` have all the reactive `combine` properties.
* `Views` build with `SwiftUI`


##### Data Layer
* Contains `Repositories` Implementaion, It conforms to interfaces defined inside Domain Layer.
* `Note`  Data Layer conforms to interfaces defined inside Domain Layer in order to achieve (Dependency Inversion).
* Contains `Moya` that holds the apis configurations for each target

##### Network Layer (Network) (Hover)

* **`Service / Networking`** - contains the base networklayer `Moya/Combine`.
* Moya/Combine is a networking library build with `combine`.
* For more about Moya/Combine please check: (https://github.com/Moya/Moya)


##### Testing
* Write UnitTest for app using MVVM architecture .
