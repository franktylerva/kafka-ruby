#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"

ruby producer.rb --config ./rdkafka.config --topic test1