# frozen_string_literal: true

# app/controllers/admin/badges_controller.rb
module Admin
  class BadgesController < ApplicationController
    before_action :set_badge, only: %i[show edit update destroy]
    before_action :get_images, only: %i[new edit]

    def index
      @badges = Badge.all
    end

    def new
      @badge = Badge.new
    end

    def create
      @badge = Badge.new(badge_params)
      if @badge.save
        redirect_to admin_badges_path, notice: t('admin.badges.create.success')
      else
        render :new
      end
    end

    def edit; end

    def update
      if @badge.update(badge_params)
        redirect_to admin_badges_path, notice: t('admin.badges.update.updated')
      else
        render :edit
      end
    end

    def destroy
      @badge.destroy
      redirect_to admin_badges_path, alert: t('admin.badges.destroy.deleted')
    end

    private

    def get_images
      @images = Dir.glob(Rails.root.join('public', 'badges', '*')).map { |path| File.basename(path) }
    end

    def set_badge
      @badge = Badge.find(params[:id])
    end

    def badge_params
      params.require(:badge).permit(:title, :image, :image_url, :rule, :value, :status)
    end
  end
end
