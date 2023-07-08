require 'json'
require './c_cloud'

ccloud = CCloud.new
topic = ccloud.topic

# subscribe to a topic with auto.offset.reset earliest to start reading from the beginning of the
# topic if no committed offsets exist
ccloud.consumer.subscribe(topic)

total_count = 0
puts "Consuming messages from #{topic}"
# Process messages
while true
  begin
    ccloud.consumer.each do |message|
      record_key = message.key
      record_value = message.payload
      data = JSON.parse(record_value)
      total_count += data['count']

      puts "Consumed record with key #{record_key} and value #{record_value}, " \
         "and updated total count #{total_count}"
    end
  rescue Interrupt
    puts "Exiting"
  rescue => e
    puts "Consuming messages from #{topic} failed: #{e.message}"
  ensure
    ccloud.consumer.close
    break
  end
end