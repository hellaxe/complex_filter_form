window.SearchApp.factory 'Search', ($http) ->
  config: ->
    $http.get('search/conf')

  search: (data) ->
    $http.get('/searches/', data)