require 'will_paginate/array'

class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @heading= "Latest Matches in Dota World"
    if session.key? :current_user
       history = Dota.history(:start_at_match_id => params[:first_match_id])
       matches = history.matches
       @first_match_id = matches.first.id
    end
    @pages = matches.paginate(:per_page => 5,:page => params[:page])
    @match_details  = @pages.collect{|m|Dota.match(m.id)}
    render :template =>'users/show'
  end
end
