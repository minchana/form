class FormsController < ApplicationController
	def new
		@form=Form.new
	end
	def create
		# binding.pry
		@form=Form.new(form_params)
		if @form.save
		redirect_to forms_list_path
	else 
		render 'new'
	end
end
	

	def edit
	# binding.pry
	@form=Form.find_by_id(params[:id])
    end

    def index
	@forms=Form.all
	end

	def update
	# binding.pry
	@form=Form.find_by_id(params[:id])
	@form.update_attributes(form_params)
	redirect_to forms_list_path
end


	def destroy
		@form=Form.find_by_id(params[:id])
		@form.destroy
		redirect_to forms_list_path
	end

	# def profile
	# 	@form=Form.all

	# end
 
	private
     def form_params
	   params.require(:form).permit(:firstname,:lastname,:email,:password)
      end
  end



