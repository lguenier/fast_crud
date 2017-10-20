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

    def create(location = nil)
      @resource = model.new(model_params)

      if @resource.save
        flash[:success] = "#{model} successfully created!"
        if location
          redirect_to location
        else
          redirect_to @resource
        end
      else
        flash[:danger] = "Error creating #{model}: #{@resource.errors.full_messages.join(' - ')}"
        render 'new'
      end
    end

    def update(location = nil)
      @resource = model.find(params[:id])

      if @resource.update(model_params)
        flash[:success] = "#{model} successfully updated!"
        if location
          redirect_to location
        else
          redirect_to @resource
        end
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
      controller_name.classify.constantize
    end
  end
end
