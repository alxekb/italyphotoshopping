class BatchesController < ApplicationController
  before_action :batch, only: [:show, :update]

  def index
    @batches = Batch.all
  end

  def new
    @batch = Batch.new
  end

  def create
    @batch = Batch.create!(batch_params)
    if @batch.save
      redirect_to batches_index_path
      flash[:notice] = 'Batch created'
    else
      redirect_to new_batch_path
      flash[:warning] = 'Error'
    end
  end

  def show
  end

  def update
  end

  private

  def batch_params
    params.require(:batch).permit(:package_id, :batch_status_id)
  end

  def batch
    @batch = Batch.find_by(id: params[:id])
  end
end
