require 'test_helper'

class DetailContratsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detail_contrat = detail_contrats(:one)
  end

  test 'should get index' do
    get detail_contrats_url
    assert_response :success
  end

  test 'should get new' do
    get new_detail_contrat_url
    assert_response :success
  end

  test 'should create detail_contrat' do
    assert_difference('DetailContrat.count') do
      post detail_contrats_url, params: { detail_contrat: { contract_id: @detail_contrat.contract_id, end_date: @detail_contrat.end_date, group_id: @detail_contrat.group_id, qty_sensores: @detail_contrat.qty_sensores, sector_id: @detail_contrat.sector_id, start_date: @detail_contrat.start_date } }
    end

    assert_redirected_to detail_contrat_url(DetailContrat.last)
  end

  test 'should show detail_contrat' do
    get detail_contrat_url(@detail_contrat)
    assert_response :success
  end

  test 'should get edit' do
    get edit_detail_contrat_url(@detail_contrat)
    assert_response :success
  end

  test 'should update detail_contrat' do
    patch detail_contrat_url(@detail_contrat), params: { detail_contrat: { contract_id: @detail_contrat.contract_id, end_date: @detail_contrat.end_date, group_id: @detail_contrat.group_id, qty_sensores: @detail_contrat.qty_sensores, sector_id: @detail_contrat.sector_id, start_date: @detail_contrat.start_date } }
    assert_redirected_to detail_contrat_url(@detail_contrat)
  end

  test 'should destroy detail_contrat' do
    assert_difference('DetailContrat.count', -1) do
      delete detail_contrat_url(@detail_contrat)
    end

    assert_redirected_to detail_contrats_url
  end
end
