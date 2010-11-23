class DirectoryCompaniesController < ApplicationController
  # GET /directory_companies
  # GET /directory_companies.xml
  def index
    @directory_companies = DirectoryCompany.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @directory_companies }
    end
  end

  # GET /directory_companies/1
  # GET /directory_companies/1.xml
  def show
    @directory_company = DirectoryCompany.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @directory_company }
    end
  end

  # GET /directory_companies/new
  # GET /directory_companies/new.xml
  def new
    @directory_company = DirectoryCompany.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @directory_company }
    end
  end

  # GET /directory_companies/1/edit
  def edit
    @directory_company = DirectoryCompany.find(params[:id])
  end

  # POST /directory_companies
  # POST /directory_companies.xml
  def create
    @directory_company = DirectoryCompany.new(params[:directory_company])

    respond_to do |format|
      if @directory_company.save
        format.html { redirect_to(@directory_company, :notice => 'Directory company was successfully created.') }
        format.xml  { render :xml => @directory_company, :status => :created, :location => @directory_company }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @directory_company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /directory_companies/1
  # PUT /directory_companies/1.xml
  def update
    @directory_company = DirectoryCompany.find(params[:id])

    respond_to do |format|
      if @directory_company.update_attributes(params[:directory_company])
        format.html { redirect_to(@directory_company, :notice => 'Directory company was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @directory_company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /directory_companies/1
  # DELETE /directory_companies/1.xml
  def destroy
    @directory_company = DirectoryCompany.find(params[:id])
    @directory_company.destroy

    respond_to do |format|
      format.html { redirect_to(directory_companies_url) }
      format.xml  { head :ok }
    end
  end
end
