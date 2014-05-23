# Copyright 2014 N3TWORK, Inc.
#
# Licensed under Apache 2.0 - see the LICENSE file

node.set[:druid][:node_type] = File.basename(__FILE__, ".rb")
include_recipe "druid::_setup"