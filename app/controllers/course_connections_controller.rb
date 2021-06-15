class CourseConnectionsController < ApplicationController
  load_and_authorize_resource
  before_action :set_course_connection, only: %i[ show edit update destroy ]

  # GET /course_connections or /course_connections.json
  def index
    @course_connections = CourseConnection.all
  end

  # GET /course_connections/1 or /course_connections/1.json
  def show
  end

  # GET /course_connections/new
  def new
    @course_connection = CourseConnection.new
  end

  # GET /course_connections/1/edit
  def edit
  end

  # POST /course_connections or /course_connections.json
  def create
    @course_connection = CourseConnection.new(course_connection_params)

    respond_to do |format|
      if @course_connection.save
        format.html { redirect_to @course_connection, notice: "Course connection was successfully created." }
        format.json { render :show, status: :created, location: @course_connection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_connections/1 or /course_connections/1.json
  def update
    respond_to do |format|
      if @course_connection.update(course_connection_params)
        format.html { redirect_to @course_connection, notice: "Course connection was successfully updated." }
        format.json { render :show, status: :ok, location: @course_connection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_connections/1 or /course_connections/1.json
  def destroy
    @course_connection.destroy
    respond_to do |format|
      format.html { redirect_to course_connections_url, notice: "Course connection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_connection
      @course_connection = CourseConnection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_connection_params
      params.require(:course_connection).permit(:parent_course_code, :child_course_code, :required)
    end
end
