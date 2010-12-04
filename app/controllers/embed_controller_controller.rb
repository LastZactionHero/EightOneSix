class EmbedControllerController < ApplicationController
  
  def index
    @companies = DirectoryCompany.all  
  end
  
end
