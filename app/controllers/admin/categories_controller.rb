# frozen_string_literal: true

# app/controllers/admin/categories_controller.rb

module Admin
  class CategoriesController < Admin::BaseController
    before_action :set_category, only: %i[show edit update destroy]

    def index
      @categories = Category.sort_by_title.page(params[:page])
    end

    def show; end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to admin_categories_path,
                    notice: t('admin.categories.created')
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @category.update(category_params)
        redirect_to admin_categories_path,
                    notice: t('admin.categories.updated')
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @category.destroy
      redirect_to admin_categories_path,
                  notice: t('admin.categories.destroyed')
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:title)
    end
  end
end
