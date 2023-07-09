#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"

ruby consumer.rb --config /code/rdkafka.config --topic test1