class SimpleFileHandler
  FILE_NAME = 'sample.txt'

  
  def self.index
    File.exist?(FILE_NAME) ? File.readlines(FILE_NAME, chomp: true) : []
  end

  
  def self.find(id)
    index.find { |line| line.start_with?("#{id}. ") }
  end

  
  def self.where(text)
    index.select { |line| line.include?(text) }
  end

  
  def self.update(id, new_text)
    lines = index
    lines.each do |line|
      if line.start_with?("#{id}. ")
        line.replace("#{id}. #{new_text}")
        break
      end
    end
    File.write(FILE_NAME, lines.join("\n"))
    "#{id}. #{new_text}"
  end

  
  def self.delete(id)
    lines = index
    deleted = nil
    new_lines = lines.reject do |line|
      if line.start_with?("#{id}. ")
        deleted = line
        true
      else
        false
      end
    end
    File.write(FILE_NAME, new_lines.join("\n"))
    deleted
  end

  
  def self.create(text)
    lines = index
    new_id = lines.empty? ? 1 : lines.last.split('.').first.to_i + 1
    new_line = "#{new_id}. #{text}"
    File.open(FILE_NAME, 'a') { |f| f.puts new_line }
    new_line
  end
end