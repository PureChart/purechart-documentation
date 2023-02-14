require 'github/markup'
require 'uri'

class ArticlesController < ApplicationController
  
  def index
    @parent_path = request.path
    puts "PATH = " + @parent_path
  end

  def open_article

    title = Rails.root.to_s + "/app/markdown/" + params[:title] + ".md"
    @content = ActionController::Base.render inline: GitHub::Markup.render(title, File.read(title))
  end

  def show

  end
end
