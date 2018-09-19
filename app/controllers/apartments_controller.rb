class Apartments_Controller < Application_Controller
    before_action :set_apt, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]


    def index
        @apts = Apt.paginate(:page => params [:page], per_page:2)
    end

    def show
    end

    def new
        @apt = Apt.new
    end

    def edit
    end

    def create
        @apt = Apt.new(apt_params)

        respond_to do |format|
            if @apt.save
                format.html { redirect_to @apt, notice: 'Apartment listing was successfully created.' }
                format.json { render action: 'show', status: :created, location @book }
            else
                format.html { render action: 'new' }
                format.json { render json: @apt.errors, status: :unprocessable_entity }
            end
        end
    end

    def update 
        respond_to do |format|
            if @apt.update(apt_params)
                format.html { redirect_to @apt, notice: 'Apartment listing was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render action: 'edit' }
                format.json { render json: @apt.errors, status: :unprocessable_entity }
            end
        end
    end




    
end