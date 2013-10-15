JobVacancy::App.controllers :consulta do
  
  get :my do
    @consultas_encontradas = Consulta.find_by_owner(current_user)
    render 'consulta/my_consultas'
  end    

  get :new do
    @consulta = Consulta.new
    @consulta.job_offer = JobOffer.get(params[:offer_id])
    render 'consulta/new'
  end

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
    @consulta.job_offer = JobOffer.get(params[:offer_id])
    if @consulta.save
      flash[:success] = 'Consulta Creada'
      redirect '/consulta/my'
    else
      flash.now[:error] = 'Title and Description son obligatorios y debe estar logeado'
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

  get :listConsultas do
    @job = JobOffer.get(params[:offer_id])
    @consultas_find= Consulta.find_by_job_offer(@job)
    render 'consulta/offer_consultas'
  end  

 end