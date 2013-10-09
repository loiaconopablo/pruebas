JobVacancy::App.controllers :consulta do
  
  get :my do
    @consultas_encontradas = Consulta.find_by_owner(current_user)
    render 'consulta/my_consultas'
  end    

  # get :index do
  #   @offers = JobOffer.all
  #   render 'job_offers/search'
  # end  

  get :new, :with =>:offer_id  do
    @consulta = Consulta.new
    #@job_offer = JobOffer.get(params[:offer_id])
    #@consulta.job_offer = 'quilmes'
    render 'consulta/new'
  end

  # get :latest do
  #   @offers = JobOffer.all
  #   render 'job_offers/list'
  # end

  get :edit, :with =>:consu_id  do
    @consulta = Consulta.get(params[:consu_id])
    # ToDo: validate the current user is the owner of the offer
    render 'consulta/edit'
  end

  get :apply, :with =>:consulta_id   do
    @consulta = Consulta.get(params[:consulta_id ])
    # ToDo: validate the current user is the owner of the offer
    render 'consulta/apply'
  end

  post :create do
    @consulta = Consulta.new(params[:consulta])
    @consulta.owner = current_user
    if @consulta.save
      flash[:success] = 'Consulta Creada'
      redirect '/consulta/my'
    else
      flash.now[:error] = 'Title and Description are mandatory..'
      render 'consulta/new'
    end  
  end

  post :update, :with => :consulta_id do
    @consulta = Consulta.get(params[:consulta_id])
    @consulta.update(params[:consulta])
    if @consulta.save
      flash[:success] = 'Consulta actualizada'
      redirect '/consulta/my'
    else
      flash.now[:error] = 'Title and Description are mandatory'
      render 'consulta/edit'
    end  
  end

  delete :destroy do
    @consulta = Consulta.get(params[:consu_id])
    if @consulta.destroy
      flash[:success] = 'Offer deleted'
    else
      flash.now[:error] = 'Title is mandatory'
    end
    redirect 'consulta/my'
  end

end