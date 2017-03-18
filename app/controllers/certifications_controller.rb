class CertificationsController < ApplicationController

  def index
    @certifications = Certification.page(params[:page]).per(4)
  end

  def show
    @certification = Certification.find(params[:id])
  end

end