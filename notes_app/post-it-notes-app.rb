require 'green_shoes'
require 'yaml/store'

Shoes.app height: 200, width: 200, title: "Post-it notes app" do
  flow do
    button "New" do
      store = YAML::Store.new "config.yml"
      store.transaction(true) do
        @title.text = store['title']
        @para.text = store['para']
      end  
    end
    
    button "Open" do
      file = ask_open_file
      store = YAML::Store.new file
      store.transaction(true) do
        @title.text = store['title']
        @para.text = store['para']
      end  
    end
    
    button "Save" do
  
      file = ask_save_file
      store = YAML::Store.new file
      store.transaction do
        store["title"] = @title.text
        store["para"] = @para.text
      end
    end    
  end
  
  flow do
    @title = edit_line "New note", margin: [0, 5, 0, 5]
    @para = edit_box "Describe your note here"
  end
end
