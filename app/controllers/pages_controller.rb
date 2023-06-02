class PagesController < ApplicationController
  before_action :set_book, only: %i[ index new create ]
  before_action :set_page, only: %i[ show edit update destroy ]

  def index
    @pages = @book.pages
  end

  def show
  end

  def new
    @page = @book.pages.build
  end

  def edit
  end

  def create
    @page = @book.pages.build(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to book_path(@book), notice: "Page was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to page_url(@page), notice: "Page was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url, notice: "Page was successfully destroyed." }
    end
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def page_params
    params.require(:page).permit(:body, :book_id)
  end
end
