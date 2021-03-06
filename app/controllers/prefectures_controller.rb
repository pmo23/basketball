class PrefecturesController < ApplicationController

  def index
    @prefectures = Prefecture.includes(:users).where('name LIKE(?)', "%#{params[:keyword]}%")
    @prefectures.each do |prefecture|
      @users = prefecture.users.order("created_at DESC")
    end
  end

end
