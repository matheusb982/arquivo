def up
    remove_column :users, :username

    add_column :users, :title, :string
    add_column :users, :resume, :string
    add_column :users, :description, :text
    add_column :users, :website, :string
    add_column :users, :youtube, :string
    add_reference :users, :city, index: true, foreign_key: true
    add_column :users, :zipcode, :string
    add_column :users, :address, :string
    add_column :users, :phonecell, :string
    add_column :users, :phone, :string
    add_column :users, :whatsapp, :string

  end

  def down
    add_column :users, :username

    remove_column :users, :title, :string
    remove_column :users, :resume, :string
    remove_column :users, :description, :text
    remove_column :users, :website, :string
    remove_column :users, :youtube, :string
    remove_reference :users, :city, index: true, foreign_key: true
    remove_column :users, :zipcode, :string
    remove_column :users, :address, :string
    remove_column :users, :phonecell, :string
    remove_column :users, :phone, :string
    remove_column :users, :whatsapp, :string

  end
