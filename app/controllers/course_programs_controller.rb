class CourseProgramsController < ApplicationController

  load_and_authorize_resource
  before_action :set_course_program, only: %i[show edit update destroy]

  

  # GET /course_programs
  # GET /course_programs.json
  def index
    @course_programs = if params[:program_id]
                         CourseProgram.where(program_id: params[:program_id])
                                      .includes(:program, :course)
                                      .order('programs.name', 'semester', 'courses.name')
                       else
                         CourseProgram.includes(:course, :program)
                                      .order('programs.name', 'semester', 'courses.name')
                       end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @course_programs }
    end
  end

  # GET /course_programs/1
  # GET /course_programs/1.json
  def show; end

  def courseWithConnectionsInProgram
    course = Course.friendly.find(params[:course_id])

    child_courses_codes = CourseConnection.where(parent_course_code: course.code)
    child_courses = []
    child_courses_codes.each do |c|
      object = { course: Course.find_by(code: c.child_course_code), course_connection: c}
      child_courses.push(object)
    end
    parent_courses_codes = CourseConnection.where(child_course_code: course.code)
    parent_courses = []
    parent_courses_codes.each do |c|
      object = { course: Course.find_by(code: c.parent_course_code), course_connection: c}
      parent_courses.push(object)
    end
   
    program = Program.friendly.find(params[:program_id])
    course_program = CourseProgram.find_by(course_id: course.id, program_id: program.id)

    respond_to do |format|
      format.json  { render :json => {course_program: course_program, 
      course: course, child_courses: child_courses, parent_courses: parent_courses }}
     
    end
  end
  # GET /course_programs/new
  def new
    @course_program = CourseProgram.new
  end

  # GET /course_programs/1/edit
  def edit; end

  # POST /course_programs
  # POST /course_programs.json
  def create
    @course_program = CourseProgram.new(course_program_params)
    next_view_edit = params['next_view'] && params['next_view'] == 'edit'
    respond_to do |format|
      if @course_program.save && !next_view_edit
        format.html { redirect_to @course_program, notice: 'Course program was successfully created.' }
        format.json { render :show, status: :created, location: @course_program }
      else
        format.html { render :new }
        format.json { render json: @course_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_programs/1
  # PATCH/PUT /course_programs/1.json
  def update
    respond_to do |format|
      if @course_program.update(course_program_params)
        format.html { redirect_to @course_program, notice: 'Course program was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_program }
      else
        format.html { render :edit }
        format.json { render json: @course_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_programs/1
  # DELETE /course_programs/1.json
  def destroy
    @program = @course_program.program
    @course_program.destroy
    respond_to do |format|
      format.html { redirect_to @program, notice: 'Course program was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course_program
    @course_program = CourseProgram.includes(:course, :program).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_program_params
    params.require(:course_program).permit(:course_id, :program_id, :semester, :required)
  end
end
