class StatusesController < ApplicationController
  # GET /statuses/new
  def new
    @status = Status.new
  end

  # GET /statuses/1/edit
  def edit
    @status = Status.find(params[:id])
    # set_status
  end

  # POST /statuses
  def create
    @status = Status.new(status_params)
    @status.user_id = current_user.id
    if @status.save
      current_user.statuses.append @status
      redirect_to current_user, notice: 'Status was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /statuses/1
  def update
    @status = Status.find(params[:id])
    if @status.update(status_params)
      redirect_to current_user, notice: 'Status was succefully updated.'
    else
      render :edit
    end
  end

  # DELETE /statuses/1
  def destroy
    set_status
    @status.destroy
    redirect_to current_user, notice: 'Status was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_status
    @status = Status.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def status_params
    params[:status].permit(:text)
  end
end
