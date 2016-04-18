class ContactUsController < ApplicationController

  def new
    render :new, layout: "special"
  end

  def create
    @name = params[:full_name]
  end
end
