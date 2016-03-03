window.SearchApp.directive 'searchBox', () ->
  {
    restrict: 'E'
    replace: true
    templateUrl: '/assets/templates/search_box.html'
    controller: ($scope, $attrs, $element, $timeout, $filter) ->


  }