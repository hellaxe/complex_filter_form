class SearchesController < ApplicationController
  def index

    @form = Search.new(params.fetch(:filter, {}))
    @items = @form.search.only(:id).load(item: search_scope)

    respond_to do |f|
      f.json { render "searches/search_views/#{@form.view}" }
      f.html {}
    end
  end

  def new
    @search = Search.new
  end

  def create

  end

  def show
    @form = Search.new(params.fetch(:filter, {}))
    @items = @form.search.only(:id).load
    respond_to do |f|
      f.json { render json: @items.to_json }
      f.html {}
    end
  end

  def search_scope
    case @form.view
      when 'table'
        {scope: Item}
      when 'calendar'
        {scope: -> {includes(:mods, :league)} }
      else
        {scope: -> {includes(:mods, :league)} }
    end
  end
end