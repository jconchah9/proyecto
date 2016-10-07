require 'test_helper'

class BudgetDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @budget_document = budget_documents(:one)
  end

  test 'should get index' do
    get budget_documents_url
    assert_response :success
  end

  test 'should get new' do
    get new_budget_document_url
    assert_response :success
  end

  test 'should create budget_document' do
    assert_difference('BudgetDocument.count') do
      post budget_documents_url, params: { budget_document: { budget_id: @budget_document.budget_id, descripcion: @budget_document.descripcion, file_name: @budget_document.file_name, name: @budget_document.name, type: @budget_document.type } }
    end

    assert_redirected_to budget_document_url(BudgetDocument.last)
  end

  test 'should show budget_document' do
    get budget_document_url(@budget_document)
    assert_response :success
  end

  test 'should get edit' do
    get edit_budget_document_url(@budget_document)
    assert_response :success
  end

  test 'should update budget_document' do
    patch budget_document_url(@budget_document), params: { budget_document: { budget_id: @budget_document.budget_id, descripcion: @budget_document.descripcion, file_name: @budget_document.file_name, name: @budget_document.name, type: @budget_document.type } }
    assert_redirected_to budget_document_url(@budget_document)
  end

  test 'should destroy budget_document' do
    assert_difference('BudgetDocument.count', -1) do
      delete budget_document_url(@budget_document)
    end

    assert_redirected_to budget_documents_url
  end
end
