class TalksController < ApplicationController
  def new
    @speaker_array = Array.new
    @speaker_array[0] = Speaker.new
    @talk = Talk.new
    @talk.speakers = @speaker_array
    @talk
  end
  def create
    @talk = Talk.new params[:talk]
    @talk.save

  end
end