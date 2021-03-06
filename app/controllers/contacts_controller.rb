class ContactsController < ApplicationController
  before_action :authenticate_admin!, except: [:new, :create]
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  layout 'admin', except: :new

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.order(created_at: :desc)
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @speakers = Speaker.order :last_name
    @areas = Area.order :title
    @speaker = Speaker.friendly.find(params[:speaker_id]) if params[:speaker_id].present?
  end

  # GET /contacts/1/edit
  def edit
    @speakers = Speaker.order :last_name
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :profession, :organization, :city, :zip_code, :email, :phone_number, :request_details, :event_details, :past_events_speaker)
    end
end
