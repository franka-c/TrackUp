require 'csv'
class ParticipantsController < ApplicationController
  #before_action :authenticate_admin!, only: :index  # Restrict admin access

  def new
    @participant = Participant.new
  end

  def create
    existing = Participant.find_by(email: participant_params[:email])

    if existing
      redirect_to thank_you_participants_path, notice: "You've already signed up!"
    else
      @participant = Participant.new(participant_params)
      if @participant.save
        redirect_to thank_you_participants_path, notice: "Successfully signed up!"
      else
        render :new
      end
    end
  end


  def index
    @participants = Participant.all.order(created_at: :desc)
  end

  def thank_you
  end

  def export
    @participants = Participant.all

    respond_to do |format|
      format.csv { send_data generate_csv(@participants), filename: "participants-#{Date.today}.csv" }
    end
  end
  private
  def participant_params
    params.require(:participant).permit(:name, :surname, :email, :phone, :trek_type)
  end
  def generate_csv(participants)
    CSV.generate(headers: true) do |csv|
      csv << ["ID", "Name", "Surname", "Email", "Phone", "Created At"] # Column headers
      participants.each do |participant|
        csv << [participant.id, participant.name, participant.surname, participant.email, participant.phone, participant.created_at]
      end
    end
  end
end
