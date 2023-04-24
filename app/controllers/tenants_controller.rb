class TenantsController < ApplicationController

    def create
        tenant = Tenant.new(tenant_params)
        if tenant.valid?
            tenant.save
            render json: tenant, status: :created
        else
            render json: {errors: tenant.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def index
        render json: Tenant.all, status: :ok
    end

    def update
        tenant = Tenant.find_by(id: params[:id])
        if tenant
            tenant.update(params)
            render json: tenant, status: :ok
        else
            render json: {errors: tenant.errors.full_messages}, status: :not_found
        end
    end

    def destroy
        tenant = Tenant.find_by(id: params[:id])
        if tenant
            tenant.destroy
            head :no_content
        else
            render json: {error: "tenant not found"}, status: :not_found
        end
    end

    private

    def tenant_params
        params.permit(:name, :age)
    end
    
end
