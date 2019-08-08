class StaticController < ApplicationController
  def homepage
    @pending_approval = Post.where(status: :registrado)
  end
end