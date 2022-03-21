# EMS App
 ## How to open the project
Open ems/ems.xcodeproj

 ## Features
 - MVVM Clean Architecture implementation using RxSwift.
- App depedebcues manaaged using Swift Package Manager
- Third party libraries: RxSwift,  Charts, RxGesture.
- Some example and unit tests in Domain and Presentation Layer

## Todo
 - [ ] Complete testing for view models, domain and data layer


## Used Architecture
This architecture is based on MVVM pattern and Clean Architecture described by Robert C. Martin.

![enter image description here](https://miro.medium.com/max/2000/1*N3ypUNMUGv87qUL57JyqJA.png)

### Data Flow

_1._ **_View_**_(UI)_  _calls method from_ **_ViewModel_** _(Presenter)._

_2._ **_ViewModel_** _executes_ **_Use Case_**_._

_3._ **_Use Case_** _combines data from_ **_User_** _and_ **_Repositorie_**_s._

_4. Each_ **_Repository_** _returns data from a_ **_Remote Data_** _(Network),_ **_Persistent DB_** _Storage Source or In-memory Data (Remote or Cached)._

_5. Information flows back to the_ **_View_**_(UI) where we display the list of items._

### Dependency Direction

**Presentation Layer -> Domain Layer <- Data Repositories Layer**

**_Presentation Layer (MVVM)_** _= ViewModels(Presenters) + Views(UI)_

**_Domain Layer_** _= Entities + Use Cases + Repositories Interfaces_

**_Data_** _= Repositories Implementations + API(Network) + Persistence DB_

## Domain Layer

Contains Models, Uses Cases and Repository interfaces.
## Presentation Layer

**Presentation Layer** contains _UI (UIViewControllers or SwiftUI Views). Views_ are coordinated by _ViewModels (Presenters) which execute one or many Use Cases._ Presentation Layer **depends only** on the **Domain Layer**.
## Data Layer

**Data Layer** contains _Repository Implementations and one or many Data Sources._ Repositories are responsible for coordinating data from different Data Sources. Data Source can be Remote or Local (for example persistent database). Data Layer **depends only on** the **Domain Layer**. 

## Navigation
Navigation is done using Coordinators which are also responsible for initializing dependencies.
