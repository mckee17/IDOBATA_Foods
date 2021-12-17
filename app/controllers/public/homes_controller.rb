class Public::HomesController < ApplicationController
  def top
    @new = Food.order(created_at: :desc).limit(3)
  end
end
