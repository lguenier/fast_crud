require "fast_crud/version"

module FastCrud
  class FastCrud < ActionController::Base
    def index
      @collection = model.all
    end

    def show
      @resource = model.find(params[:id])
    end

    def new
      @resource = model.new
    end

    def edit
      @resource = model.find(params[:id])
    end

    def create
      @resource = model.new(model_params)

      if @resource.save
        flash[:success] = "#{model} successfully created!"
        redirect_to @resource
      else
        flash[:danger] = "Error creating #{model}: #{@resource.errors.full_messages.join(' - ')}"
        render 'new'
      end
    end

    def update
      @resource = model.find(params[:id])

      if @resource.update(model_params)
        flash[:success] = "#{model} successfully updated!"
        redirect_to @resource
      else
        flash[:danger] = "Error updating #{model}: #{@resource.errors.full_messages.join(' - ')}"
        render 'edit'
      end
    end

    def destroy
      @resource = model.find(params[:id])
      @resource.destroy

      redirect_to eval("#{controller_name}_path")
    end

    private
    def model
      controller_name.singularize.capitalize.constantize
    end
  end
end
