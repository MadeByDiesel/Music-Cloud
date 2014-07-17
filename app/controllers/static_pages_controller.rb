class StaticPagesController < ApplicationController

  def home
  end

  def latest
    @tracks = Track.all
  end
end
