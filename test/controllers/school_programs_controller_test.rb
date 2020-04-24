require 'test_helper'

class SchoolProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school_program = school_programs(:one)
  end

  test "should get index" do
    get school_programs_url
    assert_response :success
  end

  test "should get new" do
    get new_school_program_url
    assert_response :success
  end

  test "should create school_program" do
    assert_difference('SchoolProgram.count') do
      post school_programs_url, params: { school_program: { code: @school_program.code, content: @school_program.content, name: @school_program.name } }
    end

    assert_redirected_to school_program_url(SchoolProgram.last)
  end

  test "should show school_program" do
    get school_program_url(@school_program)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_program_url(@school_program)
    assert_response :success
  end

  test "should update school_program" do
    patch school_program_url(@school_program), params: { school_program: { code: @school_program.code, content: @school_program.content, name: @school_program.name } }
    assert_redirected_to school_program_url(@school_program)
  end

  test "should destroy school_program" do
    assert_difference('SchoolProgram.count', -1) do
      delete school_program_url(@school_program)
    end

    assert_redirected_to school_programs_url
  end
end
