class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :onboarding]

  def home
  end

  def onboarding
  end

  def components
  end
end
