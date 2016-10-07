require 'test_helper'

class MonitoringsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monitoring = monitorings(:one)
  end

  test 'should get index' do
    get monitorings_url
    assert_response :success
  end

  test 'should get new' do
    get new_monitoring_url
    assert_response :success
  end

  test 'should create monitoring' do
    assert_difference('Monitoring.count') do
      post monitorings_url, params: { monitoring: { sector_id: @monitoring.sector_id, sensor_id: @monitoring.sensor_id } }
    end

    assert_redirected_to monitoring_url(Monitoring.last)
  end

  test 'should show monitoring' do
    get monitoring_url(@monitoring)
    assert_response :success
  end

  test 'should get edit' do
    get edit_monitoring_url(@monitoring)
    assert_response :success
  end

  test 'should update monitoring' do
    patch monitoring_url(@monitoring), params: { monitoring: { sector_id: @monitoring.sector_id, sensor_id: @monitoring.sensor_id } }
    assert_redirected_to monitoring_url(@monitoring)
  end

  test 'should destroy monitoring' do
    assert_difference('Monitoring.count', -1) do
      delete monitoring_url(@monitoring)
    end

    assert_redirected_to monitorings_url
  end
end
