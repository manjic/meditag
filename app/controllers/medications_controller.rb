class MedicationsController < ApplicationController

  def index
    @medications = current_user.medications.all
  end

  def new
    @medication = Medication.new
  end

  def create
    @medication = Medication.new(new_medication_params)
    @medication.user = current_user

    if @medication.save
      redirect_to "/medications"
    else
      render 'new'
    end
  end

  private

  def new_medication_params
    params[:medication].permit(
      :medication,
      :dose,)
  end
end


