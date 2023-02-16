require_relative 'book'
require_relative 'label'
require 'json'

module LabelModule
    def fetch_labels
        File.open('./store/labels.json', 'r') { |line| JSON.parse(line.read) }
    end

    def add_label(item)
        title = ask_question('Label title: ').capitalize
        color = ask_question('Label color: ').capitalize
        stored_label = nil
        label_position = nil

        fetch_labels.each_with_index { |label, index| 
            if label["title"] == title && label["color"] == color
                stored_label = label
                label_position = index
            end
        }
        label = nil
        if stored_label
            label = Label.new(stored_label["title"], stored_label["color"])
            label.items = stored_label["items"]
        else
            label = Label.new(title, color)
        end
        item.add_label(label)
        store_label(label, label_position)
        puts "label added successfully"
    end

    def store_label(label, label_position)
        labels = fetch_labels
        labels[label_position] = label.to_json if label_position

        labels << label.to_json unless label_position
        File.write('./store/labels.json', JSON.generate(labels), mode: 'w')
    end
    
    def list_all_labels
        labels = fetch_labels
        return puts "There are no labels stored!" if labels.empty?
        labels.each { |label|
            puts "Title: #{label["title"]}, Color: #{label["color"]}"
        }
    end
end
