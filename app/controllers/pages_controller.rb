class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]


  def home
    @languages = Language.all
  end

  def activity

  end

  def archive

  end

end
