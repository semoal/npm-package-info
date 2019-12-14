defmodule NpmPackageInfoTest do
  use ExUnit.Case
  doctest NpmPackageInfo

  describe "Public repositories" do
    test "Passing a react package recovers the information" do
      check_dependency("react")
    end

    test "Passing a vue package recovers the information" do
      check_dependency("vue")
    end
  end

  describe "Private repositories" do
    test "Passing a private package recovers the information" do
      check_dependency("@allfundsbank/ts-book", System.get_env("TEST_NPM_TOKEN"))
    end
  end

  defp check_dependency(name, bearer \\ "") do
    {:ok, package_info} =
      NpmPackageInfo.parse_package(
        name,
        %{bearer: bearer}
      )

    assert package_info["_id"] == name
    assert package_info["name"] == name
  end
end
