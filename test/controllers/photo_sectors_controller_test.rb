require 'test_helper'

class PhotoSectorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photo_sector = photo_sectors(:one)
  end

  test 'should get index' do
    get photo_sectors_url
    assert_response :success
  end

  test 'should get new' do
    get new_photo_sector_url
    assert_response :success
  end

  test 'should create photo_sector' do
    assert_difference('PhotoSector.count') do
      post photo_sectors_url, params: { photo_sector: { descripcion: @photo_sector.descripcion, document: @photo_sector.document, name: @photo_sector.name, sector_id: @photo_sector.sector_id, type_file: @photo_sector.type_file } }
    end

    assert_redirected_to photo_sector_url(PhotoSector.last)
  end

  test 'should show photo_sector' do
    get photo_sector_url(@photo_sector)
    assert_response :success
  end

  test 'should get edit' do
    get edit_photo_sector_url(@photo_sector)
    assert_response :success
  end

  test 'should update photo_sector' do
    patch photo_sector_url(@photo_sector), params: { photo_sector: { descripcion: @photo_sector.descripcion, document: @photo_sector.document, name: @photo_sector.name, sector_id: @photo_sector.sector_id, type_file: @photo_sector.type_file } }
    assert_redirected_to photo_sector_url(@photo_sector)
  end

  test 'should destroy photo_sector' do
    assert_difference('PhotoSector.count', -1) do
      delete photo_sector_url(@photo_sector)
    end

    assert_redirected_to photo_sectors_url
  end
end
