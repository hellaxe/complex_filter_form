window.SearchApp.controller 'SearchController', ($scope, Search) ->
  $scope.fromServer = true
  $scope.settings =
    floor: 0
    ceil: 100
    mods: ['fire', 'wind', 'monkey', 'mark', 'lsd', 'steel', 'midas', 'speed', 'heat', 'water', 'ice', 'lightning', 'summon']
    rarities: ['normal', 'legendary', 'magick', 'rare', 'uniq']
  $scope.filter = {
    query: ''
    min_str: 0
    max_str: 100
    min_dex: 0
    max_dex: 100
    min_int: 0
    max_int: 100
    mods: []
    view: 'calendar'
  }

  $scope.addMod = () ->
    $scope.filter.mods.push { name: '', min_value: 0, max_value: 100}
  $scope.changeView = (view) ->
    $scope.filter.view = view
    $scope.search()

  $scope.search = () ->
    Search.search(params: {filter: $scope.filter}).then (response) ->
      $scope.results = response.data.results
      $scope.total_count = response.data.total_count
      $scope.fromServer = false