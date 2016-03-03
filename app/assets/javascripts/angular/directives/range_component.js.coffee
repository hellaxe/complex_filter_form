window.SearchApp.directive 'rangeComponent', () ->
  {
    restrict: 'E'
    scope: {
      parameters: '='
    }
    replace: true
    link: (scope, elem, attr) ->
  }