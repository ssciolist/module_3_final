### Feature Completion

- [x] All features are functional

### Process

- [x] Git history shows student uses TDD and follows red/green/refactor
- [ ] App is well tested
  x Needs more unit tests but the integration tests are good
  * Maybe implement Webmock??

### Ruby/Rails Style

- [x] Objects used in views
- [x] No hashes used in the view
- [x] Hand built API supports non-GET requests using an external tool like Postman or cURL.
- [x] API keys are not hardcoded
- [x] Controller is not responsible for making API calls.
- [x] A service object is used for making the API call.
- [x] The model-like object is responsible for instantiating itself and not the service object.
- [x] A model-like object is referenced in the controller when consuming an external API (e.g. Thing.filter(parameter: value)). This does not mean it should be an ActiveRecord backed model. A PORO is often the better choice.

### Refactoring

Passing assessments will implement all but two of the following

- [x] The model-like object is responsible for asking the service for data.
- [x] Each class is broken down into small (including width) reusable methods (SRP).
- [x] Service object is built in a way that allows portions of it to be reusable. An un-refactored example would be using string interpolation to build the API request.
- [ ] Student uses a presenter or search object in addition to a model-like PORO.
