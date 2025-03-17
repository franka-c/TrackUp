require 'csv'
class ParticipantsController < ApplicationController
  #before_action :authenticate_admin!, only: :index  # Restrict admin access

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      redirect_to root_path, notice: "Successfully signed up!"
    else
      render :new
    end
  end

  def index
    @participants = Participant.all.order(created_at: :desc)
  end

  def export
    @participants = Participant.all

    respond_to do |format|
      format.csv { send_data generate_csv(@participants), filename: "participants-#{Date.today}.csv" }
    end
  end
  private
  def participant_params
    params.require(:participant).permit(:name, :surname, :email, :phone)
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
