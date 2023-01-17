class Workshop::PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    @person.username = "@#{@person.username}" unless @person.username.starts_with? '@'

    new_person_registration(@person)

    if @person.save
      redirect_to @person
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      redirect_to @person
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    redirect_to people_path, status: :see_other
  end

  def dashboard
    if person_signed_in?
      true
    else
      redirect_to new_person_session_path
    end
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :username, :email, :password, :password, :password_confirmation)
  end
end
