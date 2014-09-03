class DecksController < ApplicationController

  def index
    @decks = Deck.all
  end

  def show
    @deck = Deck.find(params[:id])
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(name: params[:deck][:name])
    #Tried Deck.new(params[:deck]) and got ForbiddenAttributeError
    @deck.save
    redirect_to '/decks'
  end

  def edit
    @deck = Deck.find(params[:id])
  end

  def update
    @deck = Deck.find(params[:id])
    @deck.update(name: params[:deck][:name])
    redirect_to "/decks/#{@deck.id}"
  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy
    redirect_to '/decks'
  end

end