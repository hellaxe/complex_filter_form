window.SearchApp = angular.module 'SearchApp', ['ng-rails-csrf', 'templates', 'rzModule']
window.SearchApp.config ($httpProvider) ->
  $httpProvider.defaults.paramSerializer = '$httpParamSerializerJQLike';