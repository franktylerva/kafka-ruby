require "kafka"

kafka = Kafka.new(
    ["kafka-0.kafka-headless.default.svc.cluster.local:9092"],
    ssl_ca_cert: File.read('ca.crt'),
    ssl_client_cert: File.read('tls.crt'),
    ssl_client_cert_key: File.read('tls.key'),
    ssl_verify_hostname: false,

)

puts "Cool"

kafka.deliver_message("Hello, World!", topic: "test1")