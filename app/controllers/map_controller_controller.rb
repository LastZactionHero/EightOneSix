class MapControllerController < ApplicationController
  
  def index
    @companies = DirectoryCompany.all 
  end
  
end
