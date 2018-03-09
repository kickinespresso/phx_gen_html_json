defmodule PhxGenHtmlJsonWeb.Api.PostControllerTest do
  use PhxGenHtmlJsonWeb.ConnCase

  alias PhxGenHtmlJson.Blog
  alias PhxGenHtmlJson.Blog.Post

  @create_attrs %{and: "some and", content: "some content", title: "some title"}
  @update_attrs %{and: "some updated and", content: "some updated content", title: "some updated title"}
  @invalid_attrs %{and: nil, content: nil, title: nil}

  def fixture(:post) do
    {:ok, post} = Blog.create_post(@create_attrs)
    post
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all posts", %{conn: conn} do
      conn = get conn, api_post_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create post" do
    test "renders post when data is valid", %{conn: conn} do
      conn = post conn, api_post_path(conn, :create), post: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, api_post_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "and" => "some and",
        "content" => "some content",
        "title" => "some title"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, api_post_path(conn, :create), post: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update post" do
    setup [:create_post]

    test "renders post when data is valid", %{conn: conn, post: %Post{id: id} = post} do
      conn = put conn, api_post_path(conn, :update, post), post: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, api_post_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "and" => "some updated and",
        "content" => "some updated content",
        "title" => "some updated title"}
    end

    test "renders errors when data is invalid", %{conn: conn, post: post} do
      conn = put conn, api_post_path(conn, :update, post), post: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete post" do
    setup [:create_post]

    test "deletes chosen post", %{conn: conn, post: post} do
      conn = delete conn, api_post_path(conn, :delete, post)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, api_post_path(conn, :show, post)
      end
    end
  end

  defp create_post(_) do
    post = fixture(:post)
    {:ok, post: post}
  end
end
