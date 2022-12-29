class PeopleController < ApplicationController
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
    # When we visit /people/new, the GET /articles/new request is mapped to the new action. The new action does not attempt to save @person. Therefore, validations are not checked, and there will be no error messages.

    # When we submit the form, the POST /people request is mapped to the create action. The create action does attempt to save @person. Therefore, validations are checked. If any validation fails, @person will not be saved, and app/views/people/new.html.erb will be rendered with error messages.

    @person = Person.new(person_params)
    @person.username = validate_username(@person.username)

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

  private

  def validate_username(username)
    "@#{username}" unless username.starts_with? '@'
  end

  def person_params
    params.require(:person).permit(:first_name, :last_name, :username)
  end
end
