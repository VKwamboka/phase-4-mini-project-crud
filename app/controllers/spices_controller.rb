class SpicesController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :spice_not_found

    def index
        spices = Spice.all
        render json: spices
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: 201
    end

    # def show
    #     spice = find_spice
    #     if spice
    #       render json: spice
    #     else
    #       render json: { error: "Spice not found" }, status: :not_found
    #     end
    # end

    def update 
        spice = find_spice
        spice.update(spice_params)
        render json: spice
    end

    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end

    private 

    def find_spice
        Spice.find(params[:id])
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def spice_not_found
        render json: { error: "Spice not found" }, status: 404
    end
   
  
  end
  