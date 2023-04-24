class ApartmentsController < ApplicationController

    def create
        apartment = Apartment.new(apartment_params)
        if apartment.valid?
            apartment.save
            render json: apartment, status: :created
        else 
            render json: {errors: apartment.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def index
        render json: Apartment.all, status: :ok
    end

    def update
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            apartment.update(params)
            render json: apartment, status: :ok
        else
            render json: {errors: apartment.errors.full_messages}, status: :not_found
        end
    end

    def destroy
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            apartment.destroy
            head :no_content
        else
            render json: {error: "apartment not found"}, status: 404
        end
    end

    private

    def apartment_params
        params.permit(:number)
    end

end
