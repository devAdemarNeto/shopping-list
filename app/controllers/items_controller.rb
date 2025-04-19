# app/controllers/items_controller.rb
class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :destroy, :toggle]

  # GET /items ou root_path
  def index
    @items = Item.all.order(created_at: :desc)
    @new_item = Item.new # Para o formulário de criação
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to root_path, notice: 'Item adicionado com sucesso!' }
        format.turbo_stream # Procura por create.turbo_stream.erb
      else
        format.html { render :index, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.replace('new_item_form', partial: 'items/form', locals: { item: @item }) }
      end
    end
  end

  # PATCH /items/:id/toggle
  def toggle
    @item.update(purchased: !@item.purchased)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream # Procura por toggle.turbo_stream.erb
    end
  end

  # PATCH/PUT /items/:id
  def update
    if @item.update(item_params)
      redirect_to root_path, notice: 'Item atualizado com sucesso!'
    else
      render :index, status: :unprocessable_entity
    end
  end

  # DELETE /items/:id
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Item removido com sucesso!' }
      format.turbo_stream # Procura por destroy.turbo_stream.erb
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :quantity)
  end
end