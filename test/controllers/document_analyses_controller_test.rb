require 'test_helper'

class DocumentAnalysesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document_analysis = document_analyses(:one)
  end

  test 'should get index' do
    get document_analyses_url
    assert_response :success
  end

  test 'should get new' do
    get new_document_analysis_url
    assert_response :success
  end

  test 'should create document_analysis' do
    assert_difference('DocumentAnalysis.count') do
      post document_analyses_url, params: { document_analysis: { analysis_id: @document_analysis.analysis_id, descripcion: @document_analysis.descripcion, file_name: @document_analysis.file_name, name: @document_analysis.name, type: @document_analysis.type } }
    end

    assert_redirected_to document_analysis_url(DocumentAnalysis.last)
  end

  test 'should show document_analysis' do
    get document_analysis_url(@document_analysis)
    assert_response :success
  end

  test 'should get edit' do
    get edit_document_analysis_url(@document_analysis)
    assert_response :success
  end

  test 'should update document_analysis' do
    patch document_analysis_url(@document_analysis), params: { document_analysis: { analysis_id: @document_analysis.analysis_id, descripcion: @document_analysis.descripcion, file_name: @document_analysis.file_name, name: @document_analysis.name, type: @document_analysis.type } }
    assert_redirected_to document_analysis_url(@document_analysis)
  end

  test 'should destroy document_analysis' do
    assert_difference('DocumentAnalysis.count', -1) do
      delete document_analysis_url(@document_analysis)
    end

    assert_redirected_to document_analyses_url
  end
end
