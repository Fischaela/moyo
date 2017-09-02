defmodule Moyo.StudioTest do
  use Moyo.DataCase

  alias Moyo.Studio

  describe "blocks" do
    alias Moyo.Studio.Block

    @valid_attrs %{description: "some description", note: "some note", title: "some title", url: "some url", url_meta: %{}}
    @update_attrs %{description: "some updated description", note: "some updated note", title: "some updated title", url: "some updated url", url_meta: %{}}
    @invalid_attrs %{description: nil, note: nil, title: nil, url: nil, url_meta: nil}

    def block_fixture(attrs \\ %{}) do
      {:ok, block} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Studio.create_block()

      block
    end

    test "list_blocks/0 returns all blocks" do
      block = block_fixture()
      assert Studio.list_blocks() == [block]
    end

    test "get_block!/1 returns the block with given id" do
      block = block_fixture()
      assert Studio.get_block!(block.id) == block
    end

    test "create_block/1 with valid data creates a block" do
      assert {:ok, %Block{} = block} = Studio.create_block(@valid_attrs)
      assert block.description == "some description"
      assert block.note == "some note"
      assert block.title == "some title"
      assert block.url == "some url"
      assert block.url_meta == %{}
    end

    test "create_block/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Studio.create_block(@invalid_attrs)
    end

    test "update_block/2 with valid data updates the block" do
      block = block_fixture()
      assert {:ok, block} = Studio.update_block(block, @update_attrs)
      assert %Block{} = block
      assert block.description == "some updated description"
      assert block.note == "some updated note"
      assert block.title == "some updated title"
      assert block.url == "some updated url"
      assert block.url_meta == %{}
    end

    test "update_block/2 with invalid data returns error changeset" do
      block = block_fixture()
      assert {:error, %Ecto.Changeset{}} = Studio.update_block(block, @invalid_attrs)
      assert block == Studio.get_block!(block.id)
    end

    test "delete_block/1 deletes the block" do
      block = block_fixture()
      assert {:ok, %Block{}} = Studio.delete_block(block)
      assert_raise Ecto.NoResultsError, fn -> Studio.get_block!(block.id) end
    end

    test "change_block/1 returns a block changeset" do
      block = block_fixture()
      assert %Ecto.Changeset{} = Studio.change_block(block)
    end
  end

  describe "shows" do
    alias Moyo.Studio.Show

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def show_fixture(attrs \\ %{}) do
      {:ok, show} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Studio.create_show()

      show
    end

    test "list_shows/0 returns all shows" do
      show = show_fixture()
      assert Studio.list_shows() == [show]
    end

    test "get_show!/1 returns the show with given id" do
      show = show_fixture()
      assert Studio.get_show!(show.id) == show
    end

    test "create_show/1 with valid data creates a show" do
      assert {:ok, %Show{} = show} = Studio.create_show(@valid_attrs)
      assert show.title == "some title"
    end

    test "create_show/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Studio.create_show(@invalid_attrs)
    end

    test "update_show/2 with valid data updates the show" do
      show = show_fixture()
      assert {:ok, show} = Studio.update_show(show, @update_attrs)
      assert %Show{} = show
      assert show.title == "some updated title"
    end

    test "update_show/2 with invalid data returns error changeset" do
      show = show_fixture()
      assert {:error, %Ecto.Changeset{}} = Studio.update_show(show, @invalid_attrs)
      assert show == Studio.get_show!(show.id)
    end

    test "delete_show/1 deletes the show" do
      show = show_fixture()
      assert {:ok, %Show{}} = Studio.delete_show(show)
      assert_raise Ecto.NoResultsError, fn -> Studio.get_show!(show.id) end
    end

    test "change_show/1 returns a show changeset" do
      show = show_fixture()
      assert %Ecto.Changeset{} = Studio.change_show(show)
    end
  end
end
