class PagesController < ApplicationController
  def contact
    @title = "Meu título legal"
  end

  def about
  end

  def home
    @projects = Project.all.limit(10)
  end

  def teste
  end
end
